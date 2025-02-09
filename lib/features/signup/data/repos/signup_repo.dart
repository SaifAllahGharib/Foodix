import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:yummy_home/core/errors/failure.dart';
import 'package:yummy_home/core/models/user_model.dart';

abstract class SignupRepository {
  Future<Either<Failure, String>> signup(UserModel user, BuildContext context);
}
