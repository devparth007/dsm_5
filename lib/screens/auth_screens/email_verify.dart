import 'dart:async';
import 'package:dsm_5/screens/auth_screens/signup_screen.dart';
import 'package:dsm_5/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../common/theme.dart';

class EmailVerify extends StatefulWidget {
  const EmailVerify({Key? key}) : super(key: key);

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  StreamController<ErrorAnimationType>? errorController;
  TextEditingController otp = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  PinTheme otpPinTheme = PinTheme(
    activeColor: AppTheme.mainColor,
    inactiveColor: AppTheme.mainColor,
    selectedColor: AppTheme.mainColor,
    selectedFillColor: AppTheme.whiteColor,
    inactiveFillColor: AppTheme.whiteColor,
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(15),
    fieldHeight: 60,
    fieldWidth: 50,
    errorBorderColor: AppTheme.redColor,
    activeFillColor: AppTheme.whiteColor,
  );

//==============================================================================

  Future<bool> _onWillPop() async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SignupScreen(),
        ));
    return Future(() => false);
  }

//==============================================================================

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: AppTheme.mainColor,
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Verify Email',
                      style: AppTheme.white20w600,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: height,
                  width: width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  decoration: BoxDecoration(
                    color: AppTheme.whiteColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 10),
                          child: Text(
                            'Verification',
                            style: AppTheme.main20w600,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          'Enter the OTP sent to your phone',
                          style: AppTheme.black16w400,
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50, bottom: 10),
                          child: Text(
                            'Enter OTP',
                            style: AppTheme.main14w600,
                          ),
                        ),
                        PinCodeTextField(
                          onChanged: (v) {},
                          appContext: context,
                          pastedTextStyle: TextStyle(
                            color: Colors.green.shade600,
                            fontWeight: FontWeight.bold,
                          ),
                          length: 6,
                          obscureText: false,
                          obscuringCharacter: '*',
                          animationType: AnimationType.fade,
                          validator: (s) {
                            if (s!.isEmpty) {
                              return "* Required";
                            } else if (s.length < 4) {
                              return "* Required";
                            }
                            return null;
                          },
                          pinTheme: otpPinTheme,
                          cursorColor: AppTheme.blackColor,
                          animationDuration: const Duration(milliseconds: 300),
                          textStyle: AppTheme.black20w600,
                          backgroundColor: AppTheme.whiteColor,
                          enableActiveFill: true,
                          errorAnimationController: errorController,
                          controller: otp,
                          keyboardType: TextInputType.number,
                          boxShadows: const [
                            BoxShadow(
                              offset: Offset(0, 1),
                              color: Colors.black12,
                              blurRadius: 10,
                            )
                          ],
                        ),
                        const SizedBox(height: 80),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ));
                            }
                          },
                          style: AppTheme.commonButtonStyle,
                          child:
                              Text('Verify Code', style: AppTheme.white14w600),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
