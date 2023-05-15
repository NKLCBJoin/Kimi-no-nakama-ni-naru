import 'package:flutter/material.dart';

abstract class SocialLogin{
  Future<bool> login();
  Future<bool> logout();
}