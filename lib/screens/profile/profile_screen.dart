import 'package:dsm_5/screens/drawer/drawer.dart';
import 'package:dsm_5/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import '../../common/theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  popup() {
    return showDialog(
      context: context,
      builder: (context) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pop(true);
        });
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: AppTheme.blackColor)),
          backgroundColor: AppTheme.whiteColor,
          actionsAlignment: MainAxisAlignment.center,
          content: SizedBox(
            height: 140,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset('assets/lottie/done.json', height: 80, width: 80),
                const SizedBox(height: 20),
                Text(
                  "Profile Updated!",
                  style: AppTheme.black16w600,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

//==============================================================================

  Future<bool> _onWillPop() async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
    return false;
  }

//==============================================================================

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            'Profile',
            style: AppTheme.black16w600,
          ),
          leading: GestureDetector(
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            child: Container(
                height: 45,
                width: 40,
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppTheme.lightMainColor,
                  ),
                ),
                child: SvgPicture.asset(
                  'assets/home_images/drawerIcon.svg',
                )),
          ),
        ),
        drawer: DrawerScreen(scafold: _scaffoldKey),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: ElevatedButton(
            onPressed: () {
              popup();
            },
            style: AppTheme.commonButtonStyle,
            child: Text('Save', style: AppTheme.white14w600),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 5),
                        child: Text(
                          'First Name',
                          style: AppTheme.black14w600,
                        ),
                      ),
                      TextFormField(
                        style: AppTheme.black16w600,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'First Name',
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
                        padding: const EdgeInsets.only(top: 30, bottom: 5),
                        child: Text(
                          'Last Name',
                          style: AppTheme.black14w600,
                        ),
                      ),
                      TextFormField(
                        style: AppTheme.black16w600,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Last Name',
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
                        padding: const EdgeInsets.only(top: 30, bottom: 5),
                        child: Text(
                          'Weight',
                          style: AppTheme.black14w600,
                        ),
                      ),
                      TextFormField(
                        style: AppTheme.black16w600,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Weight',
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
                        padding: const EdgeInsets.only(top: 30, bottom: 5),
                        child: Text(
                          'Height',
                          style: AppTheme.black14w600,
                        ),
                      ),
                      TextFormField(
                        style: AppTheme.black16w600,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Height',
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
                        padding: const EdgeInsets.only(top: 30, bottom: 5),
                        child: Text(
                          'Age',
                          style: AppTheme.black14w600,
                        ),
                      ),
                      TextFormField(
                        style: AppTheme.black16w600,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Age',
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
                      const SizedBox(height: 50),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
