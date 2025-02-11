import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:yummy_home/core/errors/failure.dart';
import 'package:yummy_home/features/signup/data/models/signup_model.dart';

abstract class SignupRepository {
  Future<Either<Failure, String>> signup(
      SignupModel user, BuildContext context);
}
