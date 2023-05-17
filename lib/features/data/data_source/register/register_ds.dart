import 'dart:convert';
import 'dart:io';
import 'package:jv_services/config/base_url_config.dart';
import 'package:jv_services/core/constants/apis.dart';
import 'package:http/http.dart' as http;
import 'package:jv_services/features/data/models/register/register_resp.dart';
import 'package:jv_services/features/data/models/register/user_register_model.dart';

abstract class RegisterDS {
  Future<RegisterResourceResp> registerUser(UserRegister register);
}

class RegisterDSImpl implements RegisterDS {
  final BaseUrlConfig baseUrlConfig;

  late final Uri path;

  RegisterDSImpl({required this.baseUrlConfig}) {
    path = Uri.parse("${baseUrlConfig.remoteUrl}/register");
  }

  @override
  Future<RegisterResourceResp> registerUser(UserRegister register) async {
    try {
      final response = await http.post(path,
          headers: register.headers(), body: jsonEncode(register.toJson()));
      var body = json.decode(response.body);
      if (response.statusCode == Apis.successCode) {
        return RegisterSuccessResponse.fromJson(body);
      }
      return RegisterException.fromJson(body);
    } on HttpException {
      return RegisterException(
          exception: "404 not found", responseCode: Apis.httpException);
    } on SocketException {
      return RegisterException(
          exception: "No Internet connection",
          responseCode: Apis.socketException);
    } on FormatException {
      return RegisterException(
          exception: "Format exception", responseCode: Apis.formatException);
    } catch (e) {
      return RegisterException(
          exception: e.toString(), responseCode: Apis.unknowException);
    }
  }
}
