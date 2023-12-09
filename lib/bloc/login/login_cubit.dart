import 'package:equatable/equatable.dart';
import 'package:fello/repository/login/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());

  Future<void> sendOTP({required String mobileNumber}) async {
    bool isLoggedIn =
        await LoginRepository().sentOtp(mobileNumber: mobileNumber);

    if (isLoggedIn) {
      emit(state.copyWith(status: LoginStatus.otpSent));
    } else {
      emit(state.copyWith(status: LoginStatus.failure, error: 'Invalid OTP'));
    }
  }

  Future<void> verifyOTP(String mobileNumber) async {
    emit(state.copyWith(status: LoginStatus.loading));
    bool isOtpSent =
        await LoginRepository().verifyOtp(mobileNumber: mobileNumber);
    if (isOtpSent) {
      emit(state.copyWith(status: LoginStatus.success));
    } else {
      emit(state.copyWith(
          status: LoginStatus.failure, error: 'Invalid Mobile Number'));
    }
  }
}
