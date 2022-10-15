import 'package:dsm_5/screens/auth_screens/forgot_screen.dart';
import 'package:dsm_5/screens/auth_screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../common/theme.dart';
import '../homescreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final _formKey = GlobalKey<FormState>();

//==============================================================================

  Future<bool> _onWillPop() async {
    SystemNavigator.pop();
    return false;
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
                      'Sign In',
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
                        const Image(
                          image: AssetImage(
                              "assets/introducind_image/main_logo.png"),
                          height: 110,
                          width: 110,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 5),
                          child: Text(
                            'Email',
                            style: AppTheme.black14w600,
                          ),
                        ),
                        TextFormField(
                          controller: _email,
                          style: AppTheme.black16w600,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            String pattern =
                                r"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*";
                            RegExp regex = RegExp(pattern);
                            if (value!.isEmpty) {
                              return "ⓘ Please enter email address";
                            } else if (!regex.hasMatch(value)) {
                              return "ⓘ Invalid email address";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'exp@gmail.com',
                            isDense: true,
                            border: InputBorder.none,
                            fillColor: AppTheme.whiteColor,
                            enabledBorder: AppTheme.authTextFieldBorder,
                            hintStyle: AppTheme.grey14w500,
                            focusedBorder: AppTheme.authTextFieldBorder,
                            errorBorder: AppTheme.authTextFieldBorder,
                            focusedErrorBorder: AppTheme.authTextFieldBorder,
                            filled: true,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 5),
                          child: Text(
                            'Password',
                            style: AppTheme.black14w600,
                          ),
                        ),
                        TextFormField(
                          controller: _pass,
                          style: AppTheme.black16w600,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "ⓘ Please enter password";
                            } else if (value.length < 8) {
                              return "ⓘ Password should be atleast 8 characters";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: '********',
                            isDense: true,
                            border: AppTheme.authTextFieldBorder,
                            fillColor: AppTheme.whiteColor,
                            enabledBorder: AppTheme.authTextFieldBorder,
                            hintStyle: AppTheme.grey14w500,
                            focusedBorder: AppTheme.authTextFieldBorder,
                            errorBorder: AppTheme.authTextFieldBorder,
                            focusedErrorBorder: AppTheme.authTextFieldBorder,
                            filled: true,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 50),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPasswordScreen(),
                                  ));
                            },
                            child: Text(
                              'Forgot password?',
                              style: AppTheme.main14w600,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
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
                          child: Text('Login', style: AppTheme.white14w600),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: 45,
                            width: width,
                            margin: const EdgeInsets.only(top: 20, bottom: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppTheme.mainColor,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                'Create an new account?',
                                style: AppTheme.mainColor16w600,
                              ),
                            ),
                          ),
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
