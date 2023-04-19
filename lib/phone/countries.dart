

const List<Country> countries = [
  Country(
    name: "Canada",
    flag: "🇨🇦",
    code: "CA",
    dialCode: "1",
    minLength: 10,
    maxLength: 10,
  ),
  Country(
    name: "India",
    flag: "🇮🇳",
    code: "IN",
    dialCode: "91",
    minLength: 10,
    maxLength: 10,
  ),
];

class Country {
  final String name;
  final String flag;
  final String code;
  final String dialCode;
  final String regionCode;
  final int minLength;
  final int maxLength;

  const Country({
    required this.name,
    required this.flag,
    required this.code,
    required this.dialCode,
    required this.minLength,
    required this.maxLength,
    this.regionCode = "",
  });

  String get fullCountryCode {
    return this.dialCode + this.regionCode;
  }

  String get displayCC {
    if (this.regionCode != "") {
      return "${this.dialCode} ${this.regionCode}";
    }
    return this.dialCode;
  }
}
