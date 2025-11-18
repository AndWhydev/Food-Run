import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodhub/models/order_model.dart';
import 'package:foodhub/models/user_model.dart';

class RiderProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get riderId => _auth.currentUser?.uid ?? '';

  // Get current online status
  Future<bool> getOnlineStatus() async {
    try {
      if (riderId.isEmpty) return false;

      final doc = await _firestore.collection('users').doc(riderId).get();
      if (!doc.exists) return false;

      final user = UserModel.fromMap(doc.data()!, doc.id);
      return user.online ?? false;
    } catch (e) {
      print('Error getting online status: $e');
      return false;
    }
  }

  // Update online status
  Future<void> updateOnlineStatus(bool isOnline) async {
    try {
      if (riderId.isEmpty) {
        throw Exception('No rider logged in');
      }

      await _firestore.collection('users').doc(riderId).update({
        'online': isOnline,
        'lastActive': FieldValue.serverTimestamp(),
      });

      notifyListeners();
    } catch (e) {
      print('Error updating online status: $e');
      rethrow;
    }
  }

  // Listen to available orders (pending status)
  Stream<List<OrderModel>> listenAvailableOrders() {
    return _firestore
        .collection('orders')
        .where('status', isEqualTo: 'pending')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return OrderModel.fromDoc(doc);
          }).toList();
        });
  }

  // Listen to rider's assigned orders
  Stream<List<OrderModel>> listenMyOrders() {
    if (riderId.isEmpty) {
      return Stream.value([]);
    }

    return _firestore
        .collection('orders')
        .where('riderId', isEqualTo: riderId)
        .where('status', whereIn: ['assigned', 'inTransit'])
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return OrderModel.fromDoc(doc);
          }).toList();
        });
  }

  // Place a bid on an order
  Future<void> placeBid({
    required String orderId,
    required double amount,
  }) async {
    try {
      if (riderId.isEmpty) {
        throw Exception('No rider logged in');
      }

      if (amount <= 0) {
        throw Exception('Bid amount must be greater than zero');
      }

      // Get rider info
      final riderDoc = await _firestore.collection('users').doc(riderId).get();
      if (!riderDoc.exists) {
        throw Exception('Rider not found');
      }

      final rider = UserModel.fromMap(riderDoc.data()!, riderDoc.id);

      // Add bid to order
      await _firestore.collection('orders').doc(orderId).update({
        'bids.$riderId': {
          'amount': amount,
          'riderName': rider.name,
          'riderId': riderId,
          'timestamp': FieldValue.serverTimestamp(),
        },
      });

      notifyListeners();
    } catch (e) {
      print('Error placing bid: $e');
      rethrow;
    }
  }

  // Accept an order (if admin assigns it directly)
  Future<void> acceptOrder(String orderId) async {
    try {
      if (riderId.isEmpty) {
        throw Exception('No rider logged in');
      }

      await _firestore.collection('orders').doc(orderId).update({
        'status': 'assigned',
        'riderId': riderId,
        'assignedAt': FieldValue.serverTimestamp(),
      });

      notifyListeners();
    } catch (e) {
      print('Error accepting order: $e');
      rethrow;
    }
  }

  // Update order status to in transit
  Future<void> startDelivery(String orderId) async {
    try {
      if (riderId.isEmpty) {
        throw Exception('No rider logged in');
      }

      await _firestore.collection('orders').doc(orderId).update({
        'status': 'inTransit',
        'startedAt': FieldValue.serverTimestamp(),
      });

      notifyListeners();
    } catch (e) {
      print('Error starting delivery: $e');
      rethrow;
    }
  }

  // Complete delivery
  Future<void> completeDelivery(String orderId) async {
    try {
      if (riderId.isEmpty) {
        throw Exception('No rider logged in');
      }

      await _firestore.collection('orders').doc(orderId).update({
        'status': 'delivered',
        'completedAt': FieldValue.serverTimestamp(),
      });

      // Update rider's total deliveries
      await _firestore.collection('users').doc(riderId).update({
        'totalDeliveries': FieldValue.increment(1),
      });

      notifyListeners();
    } catch (e) {
      print('Error completing delivery: $e');
      rethrow;
    }
  }

  // Get rider statistics
  Future<Map<String, dynamic>> getRiderStats() async {
    try {
      if (riderId.isEmpty) {
        return {
          'totalDeliveries': 0,
          'totalEarnings': 0.0,
          'rating': 0.0,
          'completionRate': 0.0,
        };
      }

      // Get completed orders
      final completedOrders = await _firestore
          .collection('orders')
          .where('riderId', isEqualTo: riderId)
          .where('status', isEqualTo: 'delivered')
          .get();

      // Get all assigned orders (including cancelled)
      final allOrders = await _firestore
          .collection('orders')
          .where('riderId', isEqualTo: riderId)
          .get();

      double totalEarnings = 0.0;
      for (var doc in completedOrders.docs) {
        final data = doc.data();
        final bids = data['bids'] as Map<String, dynamic>?;
        if (bids != null && bids.containsKey(riderId)) {
          final bidData = bids[riderId] as Map<String, dynamic>;
          totalEarnings += (bidData['amount'] as num?)?.toDouble() ?? 0.0;
        }
      }

      // Get rider info
      final riderDoc = await _firestore.collection('users').doc(riderId).get();
      final rider = UserModel.fromMap(riderDoc.data()!, riderDoc.id);

      final completionRate = allOrders.docs.isNotEmpty
          ? (completedOrders.docs.length / allOrders.docs.length) * 100
          : 0.0;

      return {
        'totalDeliveries': rider.totalDeliveries ?? 0,
        'totalEarnings': totalEarnings,
        'rating': rider.rating ?? 0.0,
        'completionRate': completionRate,
      };
    } catch (e) {
      print('Error getting rider stats: $e');
      return {
        'totalDeliveries': 0,
        'totalEarnings': 0.0,
        'rating': 0.0,
        'completionRate': 0.0,
      };
    }
  }

  // Update rider location (for real-time tracking)
  Future<void> updateLocation({
    required double latitude,
    required double longitude,
  }) async {
    try {
      if (riderId.isEmpty) {
        throw Exception('No rider logged in');
      }

      await _firestore.collection('users').doc(riderId).update({
        'location': GeoPoint(latitude, longitude),
        'lastActive': FieldValue.serverTimestamp(),
      });

      // Don't notify listeners for location updates to avoid excessive rebuilds
    } catch (e) {
      print('Error updating location: $e');
    }
  }

  // Get order details
  Future<OrderModel?> getOrderDetails(String orderId) async {
    try {
      final doc = await _firestore.collection('orders').doc(orderId).get();
      if (!doc.exists) return null;

      return OrderModel.fromDoc(doc);
    } catch (e) {
      print('Error getting order details: $e');
      return null;
    }
  }

  // Cancel bid
  Future<void> cancelBid(String orderId) async {
    try {
      if (riderId.isEmpty) {
        throw Exception('No rider logged in');
      }

      await _firestore.collection('orders').doc(orderId).update({
        'bids.$riderId': FieldValue.delete(),
      });

      notifyListeners();
    } catch (e) {
      print('Error cancelling bid: $e');
      rethrow;
    }
  }

  // Get rider's bid history
  Stream<List<Map<String, dynamic>>> listenBidHistory() {
    if (riderId.isEmpty) {
      return Stream.value([]);
    }

    return _firestore
        .collection('orders')
        .where('status', isEqualTo: 'pending')
        .snapshots()
        .map((snapshot) {
          List<Map<String, dynamic>> bids = [];

          for (var doc in snapshot.docs) {
            final data = doc.data();
            final orderBids = data['bids'] as Map<String, dynamic>?;

            if (orderBids != null && orderBids.containsKey(riderId)) {
              bids.add({
                'orderId': doc.id,
                'order': OrderModel.fromDoc(doc),
                'bidAmount': orderBids[riderId]['amount'],
                'timestamp': orderBids[riderId]['timestamp'],
              });
            }
          }

          return bids;
        });
  }

  // Check if rider has bid on an order
  Future<bool> hasBidOnOrder(String orderId) async {
    try {
      if (riderId.isEmpty) return false;

      final doc = await _firestore.collection('orders').doc(orderId).get();
      if (!doc.exists) return false;

      final data = doc.data()!;
      final bids = data['bids'] as Map<String, dynamic>?;

      return bids != null && bids.containsKey(riderId);
    } catch (e) {
      print('Error checking bid: $e');
      return false;
    }
  }

  // Get rider profile
  Future<UserModel?> getRiderProfile() async {
    try {
      if (riderId.isEmpty) return null;

      final doc = await _firestore.collection('users').doc(riderId).get();
      if (!doc.exists) return null;

      return UserModel.fromMap(doc.data()!, doc.id);
    } catch (e) {
      print('Error getting rider profile: $e');
      return null;
    }
  }

  // Update rider profile
  Future<void> updateRiderProfile({
    String? name,
    String? phone,
    String? profileImage,
  }) async {
    try {
      if (riderId.isEmpty) {
        throw Exception('No rider logged in');
      }

      Map<String, dynamic> updates = {};

      if (name != null) updates['name'] = name;
      if (phone != null) updates['phone'] = phone;
      if (profileImage != null) updates['profileImage'] = profileImage;

      if (updates.isNotEmpty) {
        updates['lastActive'] = FieldValue.serverTimestamp();
        await _firestore.collection('users').doc(riderId).update(updates);
        notifyListeners();
      }
    } catch (e) {
      print('Error updating rider profile: $e');
      rethrow;
    }
  }

  //
  // Listen to completed orders
  Stream<List<OrderModel>> listenCompletedOrders() {
    if (riderId.isEmpty) {
      return Stream.value([]);
    }

    return _firestore
        .collection('orders')
        .where('riderId', isEqualTo: riderId)
        .where('status', whereIn: ['delivered', 'cancelled'])
        .orderBy('completedAt', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return OrderModel.fromDoc(doc);
          }).toList();
        });
  }

  // Listen to all rider's orders
  Stream<List<OrderModel>> listenAllMyOrders() {
    if (riderId.isEmpty) {
      return Stream.value([]);
    }

    return _firestore
        .collection('orders')
        .where('riderId', isEqualTo: riderId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return OrderModel.fromDoc(doc);
          }).toList();
        });
  }
}
