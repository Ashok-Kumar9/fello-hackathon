part of 'login_cubit.dart';

enum LoginStatus { initial, loading, otpSent, success, failure }

class LoginState extends Equatable {
  final LoginStatus status;
  final String error;
  const LoginState({required this.status, required this.error});

  factory LoginState.initial() =>
      const LoginState(status: LoginStatus.initial, error: '');

  @override
  List<Object> get props => [status, error];

  @override
  String toString() => 'LoginState { status: $status, error: $error }';

  LoginState copyWith({
    LoginStatus? status,
    String? error,
  }) {
    return LoginState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
