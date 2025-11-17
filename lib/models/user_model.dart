import 'package:cloud_firestore/cloud_firestore.dart';

enum UserRole { admin, rider }

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final UserRole role;
  final String? profileImage;
  final GeoPoint? location; // rider only
  final bool? online; // rider only
  final double? rating; // rider only
  final int? totalDeliveries; // rider only
  final String? fcmToken;
  final String deviceType;
  final Timestamp lastActive;
  final int badgeCount;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    required this.deviceType,
    required this.lastActive,
    required this.badgeCount,
    this.profileImage,
    this.location,
    this.online,
    this.rating,
    this.totalDeliveries,
    this.fcmToken,
  });

  /// Factory from Firestore
  factory UserModel.fromMap(Map<String, dynamic> data, String uid) {
    return UserModel(
      uid: uid,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      role: _roleFromString(data['role'] ?? 'rider'),
      profileImage: data['profileImage'],
      location: data['location'],
      online: data['online'],
      rating: (data['rating'] ?? 0).toDouble(),
      totalDeliveries: data['totalDeliveries'] ?? 0,
      fcmToken: data['fcmToken'],
      deviceType: data['deviceType'] ?? 'unknown',
      lastActive: data['lastActive'] ?? Timestamp.now(),
      badgeCount: data['badgeCount'] ?? 0,
    );
  }

  /// Convert to Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'role': role.name,
      'profileImage': profileImage,
      'location': location,
      'online': online,
      'rating': rating,
      'totalDeliveries': totalDeliveries,
      'fcmToken': fcmToken,
      'deviceType': deviceType,
      'lastActive': lastActive,
      'badgeCount': badgeCount,
    };
  }

  static UserRole _roleFromString(String role) {
    switch (role) {
      case 'admin':
        return UserRole.admin;
      case 'rider':
      default:
        return UserRole.rider;
    }
  }
}
