// lib/providers/admin_provider.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/order_model.dart';
import '../models/user_model.dart';

class AdminProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Streams
  // Note: requires a composite Firestore index on status + createdAt.
  // Create it in Firebase console: Firestore > Indexes > Composite.
  Stream<List<OrderModel>> listenOrders({int limit = 100}) {
    return _firestore
        .collection('orders')
        .where('status', whereIn: ['pending', 'waitingBids', 'assigned', 'picked', 'inTransit'])
        .orderBy('createdAt', descending: true)
        .limit(limit)
        .snapshots()
        .map((snap) => snap.docs
            .map((d) => OrderModel.fromDoc(d))
            .where((o) => o.archived != true)
            .toList());
  }

  // Marks delivered/cancelled orders older than 7 days as archived.
  // Run once from an admin action to clean up stale test data.
  Future<void> archiveOldOrders() async {
    final cutoff = Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 7)));
    final snap = await _firestore
        .collection('orders')
        .where('status', whereIn: ['delivered', 'cancelled'])
        .where('createdAt', isLessThan: cutoff)
        .get();
    for (final doc in snap.docs) {
      await doc.reference.update({'archived': true});
    }
  }

  Stream<List<UserModel>> listenRiders({bool onlyOnline = true}) {
    Query q = _firestore.collection('users').where('role', isEqualTo: 'rider');
    if (onlyOnline) q = q.where('online', isEqualTo: true);
    return q.snapshots().map((snap) {
      return snap.docs
          .map((d) => UserModel.fromMap(d.data() as Map<String, dynamic>, d.id))
          .toList();
    });
  }

  Future<void> assignRiderToOrder({
    required String orderId,
    required UserModel rider,
  }) async {
    final orderRef = _firestore.collection('orders').doc(orderId);
    await _firestore.runTransaction((tx) async {
      final snapshot = await tx.get(orderRef);
      if (!snapshot.exists) throw Exception("Order not found");
      tx.update(orderRef, {
        'riderId': rider.uid,
        'status': 'assigned',
        'assignedAt': Timestamp.now(),
      });
    });
    notifyListeners();
  }

  Future<void> unassignRider({required String orderId}) async {
    final orderRef = _firestore.collection('orders').doc(orderId);
    await orderRef.update({
      'riderId': FieldValue.delete(),
      'status': 'pending',
    });
    notifyListeners();
  }

  Future<void> updateOrderStatus({
    required String orderId,
    required String status,
  }) async {
    await _firestore.collection('orders').doc(orderId).update({
      'status': status,
    });
    notifyListeners();
  }

  // quick stat queries
  Future<int> countOrdersWithStatus(String status) async {
    final snap = await _firestore
        .collection('orders')
        .where('status', isEqualTo: status)
        .get();
    return snap.size;
  }

  // Requires a 'meta/orderCounter' document with field 'lastOrderNumber: 1000'
  // to be created in Firestore before first use.
  Future<void> createOrder(Map<String, dynamic> orderMap) async {
    final counterRef = _firestore.collection('meta').doc('orderCounter');

    await _firestore.runTransaction((tx) async {
      final counterSnap = await tx.get(counterRef);
      final lastNumber = (counterSnap.data()?['lastOrderNumber'] ?? 1000) as int;
      final newNumber = lastNumber + 1;

      tx.update(counterRef, {'lastOrderNumber': newNumber});

      final orderRef = _firestore.collection('orders').doc();
      tx.set(orderRef, {
        ...orderMap,
        'orderNumber': newNumber,
      });
    });
  }
}
