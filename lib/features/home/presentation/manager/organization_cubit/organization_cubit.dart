import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/home/data/models/organization_model/organization_model.dart';
import 'package:lms/features/home/data/repos/organization_repo_impl.dart';

part 'organization_state.dart';

class OrganizationCubit extends Cubit<OrganizationState> {
  OrganizationCubit(this.organizationRepoImpl) : super(OrganizationInitial());
  final OrganizationRepoImpl organizationRepoImpl;

  Future<void> fetchOrganizations() async {
    emit(OrganizationLoading());
    final result = await organizationRepoImpl.fetchOrganizations();
    result.fold(
      (failure) => emit(OrganizationError(errorMessage: failure.error)),
      (success) => emit(OrganizationLoaded(organizationModel: success)),
    );
  }

  Future<void> searchOrganization(String query) async {
    emit(OrganizationLoading());
    final result = await organizationRepoImpl.searchOrganization(query);
    result.fold(
      (failure) => emit(OrganizationError(errorMessage: failure.error)),
      (success) => emit(OrganizationLoaded(organizationModel: success)),
    );
  }
}
