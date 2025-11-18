// lib/providers/admin_provider.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/order_model.dart';
import '../models/user_model.dart';

class AdminProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Streams
  Stream<List<OrderModel>> listenOrders({int limit = 100}) {
    return _firestore
        .collection('orders')
        .orderBy('createdAt', descending: true)
        .limit(limit)
        .snapshots()
        .map((snap) => snap.docs.map((d) => OrderModel.fromDoc(d)).toList());
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
  }

  Future<void> unassignRider({required String orderId}) async {
    final orderRef = _firestore.collection('orders').doc(orderId);
    await orderRef.update({
      'assignedRiderId': FieldValue.delete(),
      'status': 'pending',
    });
  }

  Future<void> updateOrderStatus({
    required String orderId,
    required String status,
  }) async {
    await _firestore.collection('orders').doc(orderId).update({
      'status': status,
    });
  }

  // quick stat queries
  Future<int> countOrdersWithStatus(String status) async {
    final snap = await _firestore
        .collection('orders')
        .where('status', isEqualTo: status)
        .get();
    return snap.size;
  }

  Future<void> createOrder(Map<String, dynamic> orderMap) async {
    await _firestore.collection('orders').add(orderMap);
  }
}
