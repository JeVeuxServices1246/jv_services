part of 'countries_list_bloc.dart';

abstract class CountriesListEvent extends Equatable {
  const CountriesListEvent();
}

class CountriesInitialEvent extends CountriesListEvent {
  final List<Country> countries;

  const CountriesInitialEvent({required this.countries});
  @override
  List<Object> get props => [countries];
}
