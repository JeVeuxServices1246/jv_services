import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jv_services/features/data/models/common/country.dart';
import 'package:jv_services/features/presentation/common/countries/bloc/countries_list_bloc.dart';

class CountriesDialogWidget extends StatelessWidget {
  const CountriesDialogWidget({super.key});

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
