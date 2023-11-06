import 'dart:async';

import 'package:dio/dio.dart';

import '../../constants/apiToken.dart';
import '../../models/client_details_model/client_details_model.dart';
import '../dio.dart';

class ClientDetailsRepository {
  static Future<ClientDetailsModel> getClientDetails(String userName) async {
    final res = await dio.post(
      '/getClientDetails?api_token=${ApiKey.apiToken}',
        data: {
          'user_name': '093618102',
        },
    );
    return ClientDetailsModel.fromJson(res.data);
  }
}
