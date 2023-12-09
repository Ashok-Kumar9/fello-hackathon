class LoginRepository {
  LoginRepository();

  Future<bool> sentOtp({required String mobileNumber}) async {
    try {
      // for api call to send otp
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> verifyOtp({
    required String mobileNumber,
  }) async {
    try {
      // for api call to verify otp
      // for api call to login
      // await DioHandler().makeRequest(
      //   endpoint: EndPoints.getEndpoint(EndPoints.login),
      //   method: 'POST',
      //   data: {
      //     'mobileNumber': mobileNumber,
      //     'otp': otp,
      //   },
      // );

      await Future.delayed(const Duration(seconds: 1));
      return true;
    } catch (e) {
      return false;
    }
  }
}
