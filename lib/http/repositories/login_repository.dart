import 'dart:async';

import '../../constants/apiToken.dart';
import '../../models/login_model/login_model.dart';
import '../dio.dart';

class LoginRepository {
  static Future<LoginModel> login(String login, String password) async {
    final res = await dio.post('/login?api_token=${ApiKey.apiToken}',
      data: {
      'login': login,
      'password': password,
      },
    );
    return LoginModel.fromJson(res.data);
  }
}
