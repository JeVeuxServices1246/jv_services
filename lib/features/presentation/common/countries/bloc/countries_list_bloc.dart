import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jv_services/features/data/data_source/common/country_ds.dart';
import 'package:jv_services/features/data/models/common/country.dart';

part 'countries_list_event.dart';
part 'countries_list_state.dart';

class CountriesListBloc extends Bloc<CountriesListEvent, CountriesListState> {
  final CountryDS countryDS;

  CountriesListBloc({
    required this.countryDS,
  }) : super(CountriesListState()) {
    countryDS.readJson().then((value) {
      add(CountriesInitialEvent(countries: value));
    });
    on<CountriesInitialEvent>((event, emit) {
      emit(state.copyWith(
          countries: event.countries, selectedCounty: event.countries.first));
    });
  }
}
