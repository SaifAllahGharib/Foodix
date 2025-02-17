import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:yummy_home/core/errors/failure.dart';
import 'package:yummy_home/features/login/data/models/login_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, String>> login(LoginModel user, BuildContext context);
}
