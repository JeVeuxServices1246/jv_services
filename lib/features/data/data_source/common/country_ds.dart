import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:jv_services/features/data/models/common/country.dart';

abstract class CountryDS {
  Future<List<Country>> readJson();
}

class CountyDsImpl implements CountryDS {
  @override
  Future<List<Country>> readJson() async {
    final String data =
        await rootBundle.loadString('assets/jsons/countries.json');
    final List response = await json.decode(data);
    return response.map((e) => Country.fromJson(e)).toList();
  }
}
