// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClientDetailsModel _$ClientDetailsModelFromJson(Map<String, dynamic> json) {
  return _ClientDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$ClientDetailsModel {
  String? get address => throw _privateConstructorUsedError;
  int? get clientId => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get recommended => throw _privateConstructorUsedError;
  String? get tariff => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientDetailsModelCopyWith<ClientDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientDetailsModelCopyWith<$Res> {
  factory $ClientDetailsModelCopyWith(
          ClientDetailsModel value, $Res Function(ClientDetailsModel) then) =
      _$ClientDetailsModelCopyWithImpl<$Res, ClientDetailsModel>;
  @useResult
  $Res call(
      {String? address,
      int? clientId,
      String? phoneNumber,
      String? recommended,
      String? tariff});
}

/// @nodoc
class _$ClientDetailsModelCopyWithImpl<$Res, $Val extends ClientDetailsModel>
    implements $ClientDetailsModelCopyWith<$Res> {
  _$ClientDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? clientId = freezed,
    Object? phoneNumber = freezed,
    Object? recommended = freezed,
    Object? tariff = freezed,
  }) {
    return _then(_value.copyWith(
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      clientId: freezed == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      recommended: freezed == recommended
          ? _value.recommended
          : recommended // ignore: cast_nullable_to_non_nullable
              as String?,
      tariff: freezed == tariff
          ? _value.tariff
          : tariff // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientDetailsModelImplCopyWith<$Res>
    implements $ClientDetailsModelCopyWith<$Res> {
  factory _$$ClientDetailsModelImplCopyWith(_$ClientDetailsModelImpl value,
          $Res Function(_$ClientDetailsModelImpl) then) =
      __$$ClientDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? address,
      int? clientId,
      String? phoneNumber,
      String? recommended,
      String? tariff});
}

/// @nodoc
class __$$ClientDetailsModelImplCopyWithImpl<$Res>
    extends _$ClientDetailsModelCopyWithImpl<$Res, _$ClientDetailsModelImpl>
    implements _$$ClientDetailsModelImplCopyWith<$Res> {
  __$$ClientDetailsModelImplCopyWithImpl(_$ClientDetailsModelImpl _value,
      $Res Function(_$ClientDetailsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? clientId = freezed,
    Object? phoneNumber = freezed,
    Object? recommended = freezed,
    Object? tariff = freezed,
  }) {
    return _then(_$ClientDetailsModelImpl(
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      clientId: freezed == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      recommended: freezed == recommended
          ? _value.recommended
          : recommended // ignore: cast_nullable_to_non_nullable
              as String?,
      tariff: freezed == tariff
          ? _value.tariff
          : tariff // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientDetailsModelImpl extends _ClientDetailsModel {
  _$ClientDetailsModelImpl(
      {this.address,
      this.clientId,
      this.phoneNumber,
      this.recommended,
      this.tariff})
      : super._();

  factory _$ClientDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientDetailsModelImplFromJson(json);

  @override
  final String? address;
  @override
  final int? clientId;
  @override
  final String? phoneNumber;
  @override
  final String? recommended;
  @override
  final String? tariff;

  @override
  String toString() {
    return 'ClientDetailsModel(address: $address, clientId: $clientId, phoneNumber: $phoneNumber, recommended: $recommended, tariff: $tariff)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientDetailsModelImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.recommended, recommended) ||
                other.recommended == recommended) &&
            (identical(other.tariff, tariff) || other.tariff == tariff));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, address, clientId, phoneNumber, recommended, tariff);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientDetailsModelImplCopyWith<_$ClientDetailsModelImpl> get copyWith =>
      __$$ClientDetailsModelImplCopyWithImpl<_$ClientDetailsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientDetailsModelImplToJson(
      this,
    );
  }
}

abstract class _ClientDetailsModel extends ClientDetailsModel {
  factory _ClientDetailsModel(
      {final String? address,
      final int? clientId,
      final String? phoneNumber,
      final String? recommended,
      final String? tariff}) = _$ClientDetailsModelImpl;
  _ClientDetailsModel._() : super._();

  factory _ClientDetailsModel.fromJson(Map<String, dynamic> json) =
      _$ClientDetailsModelImpl.fromJson;

  @override
  String? get address;
  @override
  int? get clientId;
  @override
  String? get phoneNumber;
  @override
  String? get recommended;
  @override
  String? get tariff;
  @override
  @JsonKey(ignore: true)
  _$$ClientDetailsModelImplCopyWith<_$ClientDetailsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
