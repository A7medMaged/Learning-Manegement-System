part of 'organization_cubit.dart';

sealed class OrganizationState {}

final class OrganizationInitial extends OrganizationState {}

final class OrganizationLoading extends OrganizationState {}

final class OrganizationLoaded extends OrganizationState {
  final OrganizationModel organizationModel;
  OrganizationLoaded({required this.organizationModel});
}

final class OrganizationError extends OrganizationState {
  final String errorMessage;
  OrganizationError({required this.errorMessage});
}
