import 'package:flutter/material.dart';

enum Gender { male, female }

class RegisterRequest {
  String id;
  String email;
  String password;
  String userName;
  Gender gender;
  String phoneNumber;
  String city;
  String country;
  RegisterRequest({
    @required this.email,
    @required this.password,
    @required this.userName,
    @required this.gender,
    @required this.phoneNumber,
    @required this.city,
    @required this.country,
  });
  toMap() {
    return {
      'id': this.id,
      'email': this.email,
      'phone': this.phoneNumber,
      'userName': this.userName,
      'city': this.city,
      'country': this.country,
      'gender': this.gender == Gender.male ? 'male' : 'female'
    };
  }
}
