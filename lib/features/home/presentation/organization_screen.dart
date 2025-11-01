import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/home/presentation/manager/organization_cubit/organization_cubit.dart';
import 'package:lms/features/home/presentation/widgets/loading/ogranization_loading.dart';
import 'package:lms/features/home/presentation/widgets/organiztion_list_tile.dart';
import 'package:lms/generated/l10n.dart';

class OrganizationScreen extends StatelessWidget {
  const OrganizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(S.of(context).organizations),
      ),
      body: BlocBuilder<OrganizationCubit, OrganizationState>(
        builder: (context, state) {
          if (state is OrganizationLoading) {
            return const OgranizationLoading();
          } else if (state is OrganizationError) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is OrganizationLoaded) {
            final organizations = state.organizationModel.data!;
            return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: organizations.length,
              itemBuilder: (context, index) {
                final organization = organizations[index];
                return OrganiztionListTile(
                  title: organization.name!,
                  type: organization.type!,
                  email: organization.email!,
                  onTap: () {},
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
