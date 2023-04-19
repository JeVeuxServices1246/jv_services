import 'package:jv_services/view_models/base_vm.dart';

class PersonalUserVM extends BaseViewModel{
  int _controlValue = 0;

  List categoryList = [
    'Women salon',
    "Men's salon",
    "Spa for women",
    "Massage for men",
    "Advanced Facials",
    "Nail studio"
  ];

  int get controlValue => _controlValue;

  set controlValue(int value) {
    _controlValue = value;
    notifyListeners();
  }
}