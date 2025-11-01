import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/utils/styling/app_colors.dart';
import 'package:lms/core/widgets/app_text_form_field.dart';
import 'package:lms/core/widgets/spacing_widgets.dart';
import 'package:lms/features/home/presentation/manager/organization_cubit/organization_cubit.dart';
import 'package:lms/features/home/presentation/widgets/loading/ogranization_loading.dart';
import 'package:lms/features/home/presentation/widgets/organiztion_list_tile.dart';
import 'package:lms/generated/l10n.dart';

class OrganizationScreen extends StatefulWidget {
  const OrganizationScreen({super.key});

  @override
  State<OrganizationScreen> createState() => _OrganizationScreenState();
}

class _OrganizationScreenState extends State<OrganizationScreen> {
  final TextEditingController searchController = TextEditingController();
  Timer? debounce;

  @override
  void initState() {
    super.initState();
    context.read<OrganizationCubit>().fetchOrganizations();
  }

  @override
  void dispose() {
    searchController.dispose();
    debounce?.cancel();
    super.dispose();
  }

  void onSearchChanged(String value) {
    if (debounce?.isActive ?? false) debounce!.cancel();

    debounce = Timer(const Duration(milliseconds: 400), () {
      final cubit = context.read<OrganizationCubit>();
      if (value.trim().isEmpty) {
        cubit.fetchOrganizations();
      } else {
        cubit.searchOrganization(value);
      }
    });
  }

  Future<void> _onRefresh(BuildContext context) async {
    final cubit = context.read<OrganizationCubit>();
    cubit.fetchOrganizations();
    await cubit.stream.firstWhere((state) => state is! OrganizationLoading);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(S.of(context).organizations),
      ),
      body: RefreshIndicator(
        onRefresh: () => _onRefresh(context),
        color: mainColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppTextFormField(
                controller: searchController,
                hintText: S.of(context).search,
                prefixIcon: const Icon(Icons.search),
                onChanged: onSearchChanged,
              ),
            ),
            const HeightSpace(8),
            Expanded(
              child: BlocBuilder<OrganizationCubit, OrganizationState>(
                builder: (context, state) {
                  if (state is OrganizationLoading) {
                    return const OgranizationLoading();
                  } else if (state is OrganizationError) {
                    return Center(
                      child: Text(state.errorMessage),
                    );
                  } else if (state is OrganizationLoaded) {
                    final organizations = state.organizationModel.data!;
                    if (organizations.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.search_off,
                              size: 64,
                              color: Colors.grey,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              S.of(context).no_organizations_found,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
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
            ),
          ],
        ),
      ),
    );
  }
}
