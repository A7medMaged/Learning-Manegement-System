import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/auth/presentation/maneger/city_cubit/city_cubit.dart';
import 'package:lms/features/auth/data/models/cities_model/city_model/datum.dart';

class CityTextFieldSelector extends StatefulWidget {
  final TextEditingController cityNameController;
  final TextEditingController cityIdController;
  final String hintText;

  const CityTextFieldSelector({
    super.key,
    required this.cityNameController,
    required this.cityIdController,
    required this.hintText,
  });

  @override
  State<CityTextFieldSelector> createState() => _CityTextFieldSelectorState();
}

class _CityTextFieldSelectorState extends State<CityTextFieldSelector> {
  Datum? selectedCity;

  @override
  void initState() {
    super.initState();
    context.read<CityCubit>().fetchCities();
  }

  void _showCitiesBottomSheet(List<Datum> cities) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => ListView.separated(
        shrinkWrap: true,
        itemCount: cities.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final city = cities[index];
          return ListTile(
            title: Text(city.name ?? 'Unknown'),
            onTap: () {
              setState(() {
                selectedCity = city;
                widget.cityNameController.text = city.name ?? '';
                widget.cityIdController.text = city.id?.toString() ?? '';
              });
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityCubit, CityState>(
      builder: (context, state) {
        if (state is CityLoading) {
          return TextFormField(
            enabled: false,
            decoration: const InputDecoration(
              labelText: 'Loading cities...',
              prefixIcon: Icon(Icons.location_city_outlined),
            ),
          );
        } else if (state is CityLoaded) {
          final cities = state.cityModel.data ?? [];

          return TextFormField(
            controller: widget.cityNameController,
            readOnly: true,
            decoration: InputDecoration(
              labelText: widget.hintText,
              prefixIcon: const Icon(Icons.location_city_outlined),
              suffixIcon: const Icon(Icons.arrow_drop_down),
              border: const OutlineInputBorder(),
            ),
            onTap: () => _showCitiesBottomSheet(cities),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a city';
              }
              return null;
            },
          );
        } else if (state is CityError) {
          return TextFormField(
            enabled: false,
            decoration: InputDecoration(
              labelText: 'Failed to load cities',
              errorText: state.message,
              prefixIcon: const Icon(Icons.error_outline),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
