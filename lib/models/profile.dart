import 'package:flutter/material.dart';

class UserProfile {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String profile;
  final String createdAt;
  final String updatedAt;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.profile,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      profile: json['profile'] as String,
      createdAt: json['profile'] as String,
      updatedAt: json['profile'] as String,
    );
  }
}
