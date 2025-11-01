import 'package:dartz/dartz.dart';
import 'package:lms/core/errors/failure.dart';
import 'package:lms/features/home/data/models/organization_model/organization_model.dart';

abstract class OrganizationRepo {
  Future<Either<Failures, OrganizationModel>> fetchOrganizations();
}
