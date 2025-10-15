import 'package:dartz/dartz.dart';
import 'package:lms/core/errors/failure.dart';
import 'package:lms/features/home/data/models/user_model/user_model.dart';

abstract class UserRepo {
  Future<Either<Failures, UserModel>> getUserData();
}
