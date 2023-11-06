import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_details_model.freezed.dart';
part 'client_details_model.g.dart';

@freezed
class ClientDetailsModel with _$ClientDetailsModel {
  ClientDetailsModel._();

  factory ClientDetailsModel({
    String? address,
    int? clientId,
    String? phoneNumber,
    String? recommended,
    String? tariff,
  }) = _ClientDetailsModel;

  factory ClientDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ClientDetailsModelFromJson(json);
}
