// lib/models/order_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

enum OrderStatus {
  pending,
  waitingBids,
  assigned,
  picked,
  inTransit,
  delivered,
  cancelled,
}

class OrderModel {
  final String id;
  final String customerName;
  final String customerPhone;
  final GeoPoint pickupLocation;
  final String pickupAddress;
  final GeoPoint dropoffLocation;
  final String dropoffAddress;
  final List<Map<String, dynamic>> items; // [{name, qty, price}]
  final double amount;
  final OrderStatus status;
  final String? assignedRiderId;
  final Map<String, dynamic>? bids; // optional: riderId -> {amount, timestamp}
  final DateTime createdAt; // 🔥 changed

  OrderModel({
    required this.id,
    required this.customerName,
    required this.customerPhone,
    required this.pickupLocation,
    required this.pickupAddress,
    required this.dropoffLocation,
    required this.dropoffAddress,
    required this.items,
    required this.amount,
    required this.status,
    this.assignedRiderId,
    this.bids,
    required this.createdAt,
  });

  factory OrderModel.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return OrderModel(
      id: doc.id,
      customerName: data['customerName'] ?? '',
      customerPhone: data['customerPhone'] ?? '',
      pickupLocation: data['pickupLocation'] ?? GeoPoint(0, 0),
      pickupAddress: data['pickupAddress'] ?? '',
      dropoffLocation: data['dropoffLocation'] ?? GeoPoint(0, 0),
      dropoffAddress: data['dropoffAddress'] ?? '',
      items: List<Map<String, dynamic>>.from(data['items'] ?? []),
      amount: (data['amount'] ?? 0).toDouble(),
      status: _statusFromString(data['status'] ?? 'pending'),
      assignedRiderId: data['assignedRiderId'],
      bids: data['bids'] != null
          ? Map<String, dynamic>.from(data['bids'])
          : null,
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'customerName': customerName,
      'customerPhone': customerPhone,
      'pickupLocation': pickupLocation,
      'pickupAddress': pickupAddress,
      'dropoffLocation': dropoffLocation,
      'dropoffAddress': dropoffAddress,
      'items': items,
      'amount': amount,
      'status': status.name,
      'assignedRiderId': assignedRiderId,
      'bids': bids,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  static OrderStatus _statusFromString(String s) {
    switch (s) {
      case 'waitingBids':
        return OrderStatus.waitingBids;
      case 'assigned':
        return OrderStatus.assigned;
      case 'picked':
        return OrderStatus.picked;
      case 'inTransit':
        return OrderStatus.inTransit;
      case 'delivered':
        return OrderStatus.delivered;
      case 'cancelled':
        return OrderStatus.cancelled;
      default:
        return OrderStatus.pending;
    }
  }
}
