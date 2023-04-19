import 'dart:convert';

import '../../models/user_model.dart';

extension OnString on String{
  UserModel userModel(){
    return UserModel.fromJson(json.decode(this));
  }


}