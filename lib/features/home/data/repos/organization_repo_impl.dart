import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lms/core/api/api_keys.dart';
import 'package:lms/core/errors/failure.dart';
import 'package:lms/features/home/data/models/organization_model/organization_model.dart';
import 'package:lms/features/home/data/repos/organization_repo.dart';

class OrganizationRepoImpl extends OrganizationRepo {
  final Dio dio;
  OrganizationRepoImpl({required this.dio});

  @override
  Future<Either<Failures, OrganizationModel>> fetchOrganizations() async {
    try {
      Response response = await dio.get(
        ApiKeys.organizations,
      );

      OrganizationModel organizationsResponse = OrganizationModel.fromJson(
        response.data,
      );

      return Right(organizationsResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failures, OrganizationModel>> searchOrganization(
    String query,
  ) async {
    try {
      Response response = await dio.get(
        ApiKeys.organizations,
        queryParameters: {
          'search': query,
        },
      );

      OrganizationModel organizationsResponse = OrganizationModel.fromJson(
        response.data,
      );

      return Right(organizationsResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }
}
