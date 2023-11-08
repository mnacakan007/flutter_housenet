// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_details_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ClientDetails on _ClientDetails, Store {
  Computed<ClientDetailsModel?>? _$clientDetailsComputed;

  @override
  ClientDetailsModel? get clientDetails => (_$clientDetailsComputed ??=
          Computed<ClientDetailsModel?>(() => super.clientDetails,
              name: '_ClientDetails.clientDetails'))
      .value;
  Computed<bool>? _$phoneNumberNotFoundComputed;

  @override
  bool get phoneNumberNotFound => (_$phoneNumberNotFoundComputed ??=
          Computed<bool>(() => super.phoneNumberNotFound,
              name: '_ClientDetails.phoneNumberNotFound'))
      .value;
  Computed<bool>? _$thereIsClientDataComputed;

  @override
  bool get thereIsClientData => (_$thereIsClientDataComputed ??= Computed<bool>(
          () => super.thereIsClientData,
          name: '_ClientDetails.thereIsClientData'))
      .value;

  late final _$_clientDetailsAtom =
      Atom(name: '_ClientDetails._clientDetails', context: context);

  @override
  ClientDetailsModel? get _clientDetails {
    _$_clientDetailsAtom.reportRead();
    return super._clientDetails;
  }

  @override
  set _clientDetails(ClientDetailsModel? value) {
    _$_clientDetailsAtom.reportWrite(value, super._clientDetails, () {
      super._clientDetails = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ClientDetails.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorAtom = Atom(name: '_ClientDetails.error', context: context);

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$notFoundErrorAtom =
      Atom(name: '_ClientDetails.notFoundError', context: context);

  @override
  String get notFoundError {
    _$notFoundErrorAtom.reportRead();
    return super.notFoundError;
  }

  @override
  set notFoundError(String value) {
    _$notFoundErrorAtom.reportWrite(value, super.notFoundError, () {
      super.notFoundError = value;
    });
  }

  late final _$getClientDetailsAsyncAction =
      AsyncAction('_ClientDetails.getClientDetails', context: context);

  @override
  Future<void> getClientDetails(String userName) {
    return _$getClientDetailsAsyncAction
        .run(() => super.getClientDetails(userName));
  }

  late final _$_ClientDetailsActionController =
      ActionController(name: '_ClientDetails', context: context);

  @override
  void startLoading() {
    final _$actionInfo = _$_ClientDetailsActionController.startAction(
        name: '_ClientDetails.startLoading');
    try {
      return super.startLoading();
    } finally {
      _$_ClientDetailsActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopLoading() {
    final _$actionInfo = _$_ClientDetailsActionController.startAction(
        name: '_ClientDetails.stopLoading');
    try {
      return super.stopLoading();
    } finally {
      _$_ClientDetailsActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErrorsValue(Exception exception) {
    final _$actionInfo = _$_ClientDetailsActionController.startAction(
        name: '_ClientDetails.setErrorsValue');
    try {
      return super.setErrorsValue(exception);
    } finally {
      _$_ClientDetailsActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setClientDetailsValue(ClientDetailsModel clientDetails) {
    final _$actionInfo = _$_ClientDetailsActionController.startAction(
        name: '_ClientDetails.setClientDetailsValue');
    try {
      return super.setClientDetailsValue(clientDetails);
    } finally {
      _$_ClientDetailsActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
error: ${error},
notFoundError: ${notFoundError},
clientDetails: ${clientDetails},
phoneNumberNotFound: ${phoneNumberNotFound},
thereIsClientData: ${thereIsClientData}
    ''';
  }
}
