part of 'create_user_cubit.dart';

@freezed
abstract class CreateUserCubitState with _$CreateUserCubitState {
  factory CreateUserCubitState.initial() = _Initial;
  factory CreateUserCubitState.loading() = _Loading;
  factory CreateUserCubitState.success(Map<String, dynamic> data) = _Success;
  factory CreateUserCubitState.failure(String errorMessage) = _Failure;
}
