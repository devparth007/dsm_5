import 'package:dsm_5/screens/auth_screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../common/theme.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
//==============================================================================

  Future<bool> _onWillPop() async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Forgot Password',
                    style: AppTheme.white20w600,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: height,
                width: width,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: AppTheme.whiteColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      decoration: BoxDecoration(
                        color: AppTheme.mainColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/introducind_image/lock.svg',
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                    Text(
                      'Please Enter Your Email Address To Recieve a Verification Code.',
                      style: AppTheme.grey14w500,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 5),
                      child: Text(
                        'Email',
                        style: AppTheme.black14w600,
                      ),
                    ),
                    TextFormField(
                      style: AppTheme.black16w600,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'exp@gmail.com',
                        isDense: true,
                        border: InputBorder.none,
                        fillColor: AppTheme.whiteColor,
                        enabledBorder: AppTheme.authTextFieldBorder,
                        hintStyle: AppTheme.black16w300,
                        focusedBorder: AppTheme.authTextFieldBorder,
                        constraints: const BoxConstraints(maxHeight: 50),
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 80),
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const HomeScreen(),
                        //     ));
                      },
                      style: AppTheme.commonButtonStyle,
                      child: Text('Send Code', style: AppTheme.white14w600),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
