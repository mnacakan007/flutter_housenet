import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../http/repositories/client_details_repository.dart';
import '../../models/client_details_model/client_details_model.dart';

part 'client_details_state.g.dart';

class ClientDetails = _ClientDetails with _$ClientDetails;

abstract class _ClientDetails with Store {
  @observable
  ClientDetailsModel? _clientDetails;

  @computed
  ClientDetailsModel? get clientDetails => _clientDetails;

  @action
  Future<void> getClientDetails(String userName) async {
    _clientDetails = await ClientDetailsRepository.getClientDetails(userName);
    debugPrint('$_clientDetails');
  }
}
