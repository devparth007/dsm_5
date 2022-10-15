import 'package:dsm_5/screens/about_us.dart';
import 'package:dsm_5/screens/auth_screens/login_screen.dart';
import 'package:dsm_5/screens/contact_us_screen.dart';
import 'package:dsm_5/screens/faqs_screen.dart';
import 'package:dsm_5/screens/popular_test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../common/theme.dart';
import '../history/history_screen.dart';

class DrawerScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scafold;

  const DrawerScreen({Key? key, required this.scafold}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DrawerHeader(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: AppTheme.lightMainColor,
                  ),
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        'assets/drawer_images/drawer.svg',
                        fit: BoxFit.contain,
                        height: 200,
                        width: width,
                      ),
                      Positioned(
                        top: 40,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Text(
                                "Hi,",
                                style: AppTheme.black20w600,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "Hardik kothiya,",
                                style: AppTheme.black20w300,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
              commonListTile(
                title: 'Home',
                svg: 'assets/drawer_images/home.svg',
                onTap: () {
                  widget.scafold.currentState?.openEndDrawer();
                },
              ),
              commonListTile(
                title: 'Popular test',
                svg: 'assets/drawer_images/popular_test.svg',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PopularTestScreen(),
                      ));
                  widget.scafold.currentState?.openEndDrawer();
                },
              ),
              commonListTile(
                title: 'History',
                svg: 'assets/drawer_images/history.svg',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HistoryScreen(),
                      ));
                  widget.scafold.currentState?.openEndDrawer();
                },
              ),
              commonListTile(
                title: 'About us',
                svg: 'assets/drawer_images/about_us.svg',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutUsScreen(),
                      ));
                  widget.scafold.currentState?.openEndDrawer();
                },
              ),
              commonListTile(
                title: 'Contact us',
                svg: 'assets/drawer_images/contact_us.svg',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ContactUsScreen(),
                      ));
                  widget.scafold.currentState?.openEndDrawer();
                },
              ),
              commonListTile(
                title: "FAQ's",
                svg: 'assets/drawer_images/faqs.svg',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FAQSScreen(),
                      ));
                  widget.scafold.currentState?.openEndDrawer();
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ));
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                      shadowColor: MaterialStateProperty.all(AppTheme.redColor),
                      foregroundColor:
                          MaterialStateProperty.all(AppTheme.redColor),
                      backgroundColor:
                          MaterialStateProperty.all(AppTheme.redColor),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                    child: Text(
                      'Logout',
                      style: AppTheme.white14w600,
                    )),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text('Version ~1.0.0', textAlign: TextAlign.start),
          )
        ],
      ),
    );
  }

  commonListTile({
    required String title,
    required String svg,
    required onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: SvgPicture.asset(svg),
        title: Text(
          title,
          style: AppTheme.black16w400,
        ),
      ),
    );
  }
}
