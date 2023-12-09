import 'package:carousel_slider/carousel_slider.dart';
import 'package:fello/Routes/routes.dart';
import 'package:fello/bloc/login/login_cubit.dart';
import 'package:fello/utils/common_fun/common_fun.dart';
import 'package:fello/utils/components/animation_dialog.dart';
import 'package:fello/utils/constants/assets.dart';
import 'package:fello/utils/size/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  late final AnimationController _animationController;
  final TextEditingController _textEditingController = TextEditingController();
  bool isKeyboardVisible = false;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.pushReplacementNamed(context, AppRoutes.navigationBar);
        }
      });
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _animationController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    setState(() {
      isKeyboardVisible = isKeyboardOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
        if ((state.status) == LoginStatus.success) {
          animationDialog(context,
              animationController: _animationController,
              jsonFileName: JsonFiles.login_success);
        } else if (state.status == LoginStatus.failure) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Login Failed'),
                content: Text(state.error.toString()),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      }, builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: SizeConfig.height * 0.08),
            Center(
              child: Image.asset(
                AppImages.logo,
                height: SizeConfig.height * 0.1,
              ),
            ),
            Text(
              'Get your goals done with Fello',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            const Spacer(),
            CarouselSlider(
              items: [
                Image.asset(
                  AppImages.carousel_1,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  AppImages.carousel_2,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  AppImages.carousel_3,
                  fit: BoxFit.cover,
                ),
              ],
              options: CarouselOptions(
                height: isKeyboardVisible
                    ? SizeConfig.height * 0.1
                    : SizeConfig.height * 0.3,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {},
              ),
            ),
            const Spacer(),
            (state.status == LoginStatus.initial)
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _textEditingController,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      maxLength: 10,
                      cursorColor:
                          Theme.of(context).textTheme.displayLarge!.color,
                      style: Theme.of(context).textTheme.bodyLarge,
                      decoration: InputDecoration(
                        hintText: 'Enter your mobile number',
                        hintStyle: Theme.of(context).textTheme.bodyLarge,
                        labelStyle: Theme.of(context).textTheme.bodyLarge,
                        filled: false,
                        // prefixIcon: const Icon(Icons.phone),
                        prefix: const Text('+91 '),
                        prefixStyle: Theme.of(context).textTheme.bodyLarge,
                        prefixIcon: const Icon(Icons.phone),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:
                                Theme.of(context).textTheme.bodyLarge!.color!,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:
                                Theme.of(context).textTheme.bodyLarge!.color!,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorStyle: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                        hintMaxLines: 1,
                      ),
                      keyboardType: TextInputType.number,
                      autocorrect: false,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: OtpTextField(
                      numberOfFields: 6,
                      borderColor:
                          Theme.of(context).textTheme.bodyLarge!.color!,
                      showFieldAsBox: true,
                      onCodeChanged: (String code) {},
                      onSubmit: (String verificationCode) {
                        // BlocProvider.of<LoginCubit>(context).verifyOTP(
                        //   _textEditingController.text,
                        // );
                      },
                    ),
                  ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16.0)
                  .copyWith(bottom: SizeConfig.height * 0.04),
              child: ElevatedButton(
                onPressed: () {
                  if (state.status == LoginStatus.otpSent) {
                    BlocProvider.of<LoginCubit>(context).verifyOTP(
                      _textEditingController.text,
                    );
                  } else {
                    if (_textEditingController.text.length == 10) {
                      BlocProvider.of<LoginCubit>(context).sendOTP(
                        mobileNumber: _textEditingController.text,
                      );
                    } else {
                      CommonFunctions()
                          .showToast('Please enter valid mobile number');
                    }
                  }
                },
                child: (state.status == LoginStatus.loading)
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator())
                    : Text(
                        (state.status == LoginStatus.otpSent)
                            ? 'Verify OTP'
                            : 'Login',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.white),
                      ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
