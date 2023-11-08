import 'dart:async';

import '../../constants/api_token.dart';
import '../../models/client_details_model/client_details_model.dart';
import '../dio.dart';
import '../response_result_classes.dart';

class ClientDetailsRepository {
  static Future<Result<ClientDetailsModel, Exception>> getClientDetails(String userName) async {
    try {
      final res = await dio.post(
        '/getClientDetails?api_token=${ApiKey.apiToken}',
        data: {
          'user_name': '093618102',
        },
      );

      switch (res.statusCode) {
        case 200:
          return Success(ClientDetailsModel.fromJson(res.data));
        default:
          return Failure(Exception(res.statusMessage));
      }
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
