import 'package:dsm_5/screens/auth_screens/login_screen.dart';
import 'package:dsm_5/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../common/theme.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _fname = TextEditingController();
  final TextEditingController _lname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confPass = TextEditingController();

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
                      'Sign Up',
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
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
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
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'First name',
                            style: AppTheme.black14w600,
                          ),
                        ),
                        TextFormField(
                          controller: _fname,
                          style: AppTheme.black16w600,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "ⓘ Please enter first name";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'First name',
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
                          padding: const EdgeInsets.only(top: 20, bottom: 5),
                          child: Text(
                            'Last name',
                            style: AppTheme.black14w600,
                          ),
                        ),
                        TextFormField(
                          controller: _lname,
                          style: AppTheme.black16w600,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "ⓘ Please enter last name";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Last name',
                            isDense: true,
                            border: InputBorder.none,
                            fillColor: AppTheme.whiteColor,
                            enabledBorder: AppTheme.authTextFieldBorder,
                            hintStyle: AppTheme.grey14w500,
                            errorBorder: AppTheme.authTextFieldBorder,
                            focusedErrorBorder: AppTheme.authTextFieldBorder,
                            focusedBorder: AppTheme.authTextFieldBorder,
                            filled: true,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 5),
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
                            errorBorder: AppTheme.authTextFieldBorder,
                            focusedErrorBorder: AppTheme.authTextFieldBorder,
                            focusedBorder: AppTheme.authTextFieldBorder,
                            filled: true,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 5),
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
                            String pattern =
                                r"(?=^.{8,}$)(?=.*\d)(?=.*[!@#$%^&*]+)(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$";
                            // String pattern = r"^(?!.* )(?=.\d)(?=.[A-Z]).{8,15}$";
                            RegExp regex = RegExp(pattern);
                            if (value!.isEmpty) {
                              return "ⓘ Required";
                            } else if (!regex.hasMatch(value)) {
                              return "ⓘ Password must contain 8 characters with at least one uppercase and one special character.";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            errorMaxLines: 3,
                            hintText: '********',
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
                          padding: const EdgeInsets.only(top: 20, bottom: 5),
                          child: Text(
                            'Re-Enter Password',
                            style: AppTheme.black14w600,
                          ),
                        ),
                        TextFormField(
                          controller: _confPass,
                          style: AppTheme.black16w600,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "ⓘ Required";
                            } else if (value != _pass.text) {
                              return "ⓘ Password does not match";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: 'Confirm password',
                            isDense: true,
                            border: InputBorder.none,
                            fillColor: AppTheme.whiteColor,
                            enabledBorder: AppTheme.authTextFieldBorder,
                            hintStyle: AppTheme.grey14w500,
                            errorBorder: AppTheme.authTextFieldBorder,
                            focusedErrorBorder: AppTheme.authTextFieldBorder,
                            focusedBorder: AppTheme.authTextFieldBorder,
                            filled: true,
                          ),
                        ),
                        const SizedBox(height: 50),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const DetailsScreen(),
                                  ));
                            }
                          },
                          style: AppTheme.commonButtonStyle,
                          child: Text('Register', style: AppTheme.white14w600),
                        ),
                        const SizedBox(height: 15),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: 45,
                            width: width,
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppTheme.mainColor,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                'Alredy have an account?',
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
