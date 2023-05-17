part of 'countries_list_bloc.dart';

class CountriesListState {
  List<Country> countries = [];
  final Country? selectedCountry;

  CountriesListState({this.countries = const [], this.selectedCountry});

  CountriesListState copyWith(
          {List<Country>? countries, Country? selectedCounty}) =>
      CountriesListState(
          countries: countries ?? this.countries,
          selectedCountry: selectedCountry ?? selectedCountry);
}
