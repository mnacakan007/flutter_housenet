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

  late final _$getClientDetailsAsyncAction =
      AsyncAction('_ClientDetails.getClientDetails', context: context);

  @override
  Future<void> getClientDetails(String userName) {
    return _$getClientDetailsAsyncAction
        .run(() => super.getClientDetails(userName));
  }

  @override
  String toString() {
    return '''
clientDetails: ${clientDetails}
    ''';
  }
}
