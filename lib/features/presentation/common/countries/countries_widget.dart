import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jv_services/features/data/models/common/country.dart';
import 'package:jv_services/features/presentation/common/countries/bloc/countries_list_bloc.dart';

class CountriesDialogWidget extends StatelessWidget {
  final Function(Country) selectedCounty;
  const CountriesDialogWidget({super.key, required this.selectedCounty});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountriesListBloc, CountriesListState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(12),
          child: ListView.builder(
            itemCount: state.countries.length,
            itemBuilder: (context, index) {
              final Country country = state.countries[index];
              return ListTile(
                onTap: () {
                  selectedCounty(country);
                  Navigator.pop(context);
                },
                title: Text("(${country.dailCode}) ${country.name}"),
                leading: Image.asset(
                  country.flag,
                  height: 35,
                  width: 35,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
