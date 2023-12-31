import 'dart:async';

import '../../constants/api_token.dart';
import '../../models/login_model/login_model.dart';
import '../dio.dart';

class LoginRepository {
  static Future<LoginModel> login(String login, String password) async {
    final res = await dio.post('/login?api_token=${ApiKey.apiToken}',
      data: {
      'login': 'Admin',
      'password': '!QAZ2wsx',
      },
    );
    return LoginModel.fromJson(res.data);
  }
}
