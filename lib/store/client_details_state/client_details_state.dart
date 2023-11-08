import 'package:mobx/mobx.dart';

import '../../constants/error_messages.dart';
import '../../http/repositories/client_details_repository.dart';
import '../../http/response_result_classes.dart';
import '../../models/client_details_model/client_details_model.dart';

part 'client_details_state.g.dart';

class ClientDetails = _ClientDetails with _$ClientDetails;

abstract class _ClientDetails with Store {
  @observable
  ClientDetailsModel? _clientDetails;

  @computed
  ClientDetailsModel? get clientDetails => _clientDetails;

  @computed
  bool get phoneNumberNotFound => !isLoading && notFoundError.isNotEmpty;

  @computed
  bool get thereIsClientData => clientDetails?.clientId.toString().isNotEmpty == true;

  @observable
  bool isLoading = false;

  @observable
  String error = '';

  @observable
  String notFoundError = '';

  @action
  void startLoading() {
    isLoading = true;
  }

  @action
  void stopLoading() {
    isLoading = false;
  }

  @action
  void setErrorsValue (Exception exception) {
    _clientDetails = null;

    if (exception.toString().contains( ErrorMessagesKeys.notFoundError)) {
      notFoundError = ErrorMessagesKeys.notFoundError;
    } else {
      error = ErrorMessagesKeys.tokenExpired;
    }
  }

  @action
  void setClientDetailsValue (ClientDetailsModel clientDetails) {
    _clientDetails = clientDetails;
    notFoundError = '';
    error = '';
  }

  @action
  Future<void> getClientDetails(String userName) async {
    startLoading();

    final result = await ClientDetailsRepository.getClientDetails(userName);
    switch (result) {
      case Success(value: final clientDetails): setClientDetailsValue(clientDetails);
      case Failure(exception: final exception): setErrorsValue(exception);
    }

    stopLoading();
  }
}
