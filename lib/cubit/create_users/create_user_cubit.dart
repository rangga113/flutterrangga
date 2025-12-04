import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:backend_rpl/repository/auth_repository.dart';

part 'create_user_state.dart';
part 'create_user_cubit.freezed.dart';

class CreateUserCubit extends Cubit<CreateUserCubitState> {
  final AuthRepository _authRepository;

  CreateUserCubit(this._authRepository) : super(CreateUserCubitState.initial());

  Future<void> createUser({
    required String nama,
    required String username,
    required String password,
  }) async {
    emit(CreateUserCubitState.loading());
    
    try {
      final response = await _authRepository.createUser(
        nama: nama,
        username: username,
        password: password,
      );
      emit(CreateUserCubitState.success(response));
    } catch (error) {
      emit(CreateUserCubitState.failure(error.toString()));
    }
  }
}