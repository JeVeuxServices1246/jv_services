class Country {
  final String name;
  final String flag;
  final String dailCode;
  final String code;

  Country(
      {required this.name,
      required this.flag,
      required this.dailCode,
      required this.code});

  factory Country.fromJson(Map<String, dynamic> json) => Country(
      name: json['name'],
      flag: json['flag'],
      dailCode: json['dial_code'],
      code: json['code']);
}
