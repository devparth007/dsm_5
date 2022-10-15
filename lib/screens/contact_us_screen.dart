import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../common/theme.dart';
import 'homescreen.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
//==============================================================================

  Future<bool> _onWillPop() async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 35,
                width: 35,
                margin: const EdgeInsets.only(top: 42, left: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppTheme.lightMainColor,
                  ),
                ),
                child: SvgPicture.asset(
                  'assets/details_image/back_arrow.svg',
                  color: AppTheme.whiteColor,
                  alignment: Alignment.centerLeft,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Contact Us',
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
                          'Name',
                          style: AppTheme.black14w600,
                        ),
                      ),
                      TextFormField(
                        style: AppTheme.black16w600,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          isDense: true,
                          border: InputBorder.none,
                          fillColor: AppTheme.whiteColor,
                          enabledBorder: AppTheme.authTextFieldBorder,
                          hintStyle: AppTheme.grey14w500,
                          focusedBorder: AppTheme.authTextFieldBorder,
                          constraints: const BoxConstraints(maxHeight: 50),
                          filled: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 5),
                        child: Text(
                          'Mobile No.',
                          style: AppTheme.black14w600,
                        ),
                      ),
                      TextFormField(
                        style: AppTheme.black16w600,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Mobile No.',
                          isDense: true,
                          border: InputBorder.none,
                          fillColor: AppTheme.whiteColor,
                          enabledBorder: AppTheme.authTextFieldBorder,
                          hintStyle: AppTheme.grey14w500,
                          focusedBorder: AppTheme.authTextFieldBorder,
                          constraints: const BoxConstraints(maxHeight: 50),
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
                          hintStyle: AppTheme.grey14w500,
                          focusedBorder: AppTheme.authTextFieldBorder,
                          constraints: const BoxConstraints(maxHeight: 50),
                          filled: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 5),
                        child: Text(
                          'Message',
                          style: AppTheme.black14w600,
                        ),
                      ),
                      TextFormField(
                        style: AppTheme.black16w600,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        maxLines: 10,
                        decoration: InputDecoration(
                          hintText: 'Message',
                          isDense: true,
                          border: InputBorder.none,
                          fillColor: AppTheme.whiteColor,
                          enabledBorder: AppTheme.authTextFieldBorder,
                          hintStyle: AppTheme.grey14w500,
                          focusedBorder: AppTheme.authTextFieldBorder,
                          constraints: const BoxConstraints(maxHeight: 180),
                          filled: true,
                        ),
                      ),
                      const SizedBox(height: 50),
                      ElevatedButton(
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => const EmailVerify(),
                          //     ));
                        },
                        style: AppTheme.commonButtonStyle,
                        child: Text('Send', style: AppTheme.white14w600),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
