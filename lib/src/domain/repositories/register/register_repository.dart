import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:f_task/src/core/constants/constants.dart';
import 'package:f_task/src/core/either_dart/either.dart';
import 'package:f_task/src/data/models/auth/register/register_user_response.dart';
import 'package:f_task/src/domain/failure/failure.dart';
import 'package:f_task/src/domain/failure/server_error.dart';

part 'register_repository_impl.dart';

abstract class RegisterUserRepository {
  Future<Either<Failure, RegisterUserResponse>> registerUser({
    required Map<String, dynamic> request,
  });
}
