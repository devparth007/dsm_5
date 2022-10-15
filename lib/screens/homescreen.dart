import 'package:dsm_5/screens/contact_us_screen.dart';
import 'package:dsm_5/screens/drawer/drawer.dart';
import 'package:dsm_5/screens/mood_screen.dart';
import 'package:dsm_5/screens/profile/profile_screen.dart';
import 'package:dsm_5/screens/result/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../common/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  final List _navigationQueue = [];

  final List bottomList = [
    {"name": "Home", "img": "assets/home_images/bottomBar_home.svg"},
    {"name": "Result", "img": "assets/home_images/bottomBar_result.svg"},
    {"name": "Profile", "img": "assets/home_images/bottomBar_profile.svg"},
  ];

  // final List _children = [
  //   const HomeScreen(),
  //   const ResultScreen(),
  //   const ProfileScreen(),
  // ];

  List dr = [
    {
      'name': "Dr. Parth vaghasiya",
      'degree': "M.A Psychology, Care+",
      'exp': "7 yrs of exp.",
      'lan': "English, Hindi",
    },
    {
      'name': "Dr. Hardik Kothiya",
      'degree': "MBBS, MD",
      'exp': "5 yrs of exp.",
      'lan': "English, Hindi, Gujarati",
    },
    {
      'name': "Dr. Jaimin trivedi",
      'degree': "BHMS, Skin care",
      'exp': "10 yrs of exp.",
      'lan': "English, Hindi",
    },
  ];

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
        key: _scaffoldKey,
        appBar: _currentIndex == 0
            ? AppBar(
                title: Text(
                  'DSM',
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
              )
            : null,
        drawer: DrawerScreen(scafold: _scaffoldKey),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppTheme.mainColor,
            selectedItemColor: AppTheme.whiteColor,
            unselectedItemColor: const Color(0xFFC29EF6),
            selectedFontSize: 16,
            unselectedFontSize: 14,
            iconSize: 25,
            selectedLabelStyle: const TextStyle(
                fontFamily: "space", fontWeight: FontWeight.w600),
            currentIndex: _currentIndex,
            onTap: (v) {
              setState(() {
                _currentIndex = v;
              });
            },
            // onTap: (value) {
            //   if (value != _currentIndex) {
            //     _navigationQueue.removeWhere((element) => element == value);
            //     _navigationQueue.add(value);
            //     setState(() {
            //       _currentIndex = value;
            //     });
            //   }
            //   if (_currentIndex == 2) {
            //     // SharedPreferences.getInstance().then((prefs) {
            //     //   Provider.of<MarketPageProvider>(context, listen: false)
            //     //       .getWebSocketSelectCoinMarketData(
            //     //           marketId: prefs.getInt("marketID")!,
            //     //           coinId: prefs.getInt("coinId")!);
            //     // }
            //     // );
            //   }
            //   if (_currentIndex == 3) {
            //     Provider.of<HomeProvider>(context, listen: false)
            //         .arrowVisible();
            //   } else {
            //     Provider.of<HomeProvider>(context, listen: false)
            //         .arrowNotVisible();
            //   }
            // },
            items: List.generate(
              bottomList.length,
              (index) => BottomNavigationBarItem(
                label: bottomList[index]["name"],
                icon: SvgPicture.asset(bottomList[index]["img"],
                    color: _currentIndex == index
                        ? AppTheme.whiteColor
                        : const Color(0xFFC29EF6)),
              ),
            )),
        body: _currentIndex == 1
            ? const ResultScreen()
            : _currentIndex == 2
                ? const ProfileScreen()
                : SizedBox(
                    height: height,
                    width: width,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 165,
                                width: width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                  color: AppTheme.lightMainColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  'assets/home_images/dr_consult.svg',
                                  height: 140,
                                  width: 140,
                                ),
                              ),
                              Positioned(
                                top: 15,
                                left: 30,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Welcome',
                                      style: AppTheme.black16w600,
                                    ),
                                    Text(
                                      'Hardik',
                                      style: AppTheme.black16w300,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 15, left: 15, top: 15),
                            child: Text(
                              'Mood Tracker',
                              style: AppTheme.black16w600,
                            ),
                          ),
                          Container(
                            width: width,
                            margin: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppTheme.lightMainColor,
                              ),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'How are you feeling today ?',
                                  style: AppTheme.black13w500,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/home_images/level5mood.svg',
                                      ),
                                      SvgPicture.asset(
                                        'assets/home_images/level4mood.svg',
                                      ),
                                      SvgPicture.asset(
                                        'assets/home_images/level3mood.svg',
                                      ),
                                      SvgPicture.asset(
                                        'assets/home_images/level2mood.svg',
                                      ),
                                      SvgPicture.asset(
                                        'assets/home_images/level1mood.svg',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'Know Yourself?',
                              style: AppTheme.black16w600,
                            ),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                height: 165,
                                width: width,
                                margin: const EdgeInsets.only(
                                    top: 15, left: 15, right: 15, bottom: 25),
                                decoration: BoxDecoration(
                                  color: AppTheme.lightMainColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  'assets/home_images/writing_men.svg',
                                  height: 140,
                                  width: 140,
                                ),
                              ),
                              Positioned(
                                top: 30,
                                left: 25,
                                child: Opacity(
                                  opacity: 0.2,
                                  child: SvgPicture.asset(
                                    'assets/home_images/dumble.svg',
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 15,
                                right: 20,
                                child: Opacity(
                                  opacity: 0.2,
                                  child: SvgPicture.asset(
                                    'assets/home_images/clock.svg',
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 35,
                                left: 25,
                                child: Opacity(
                                  opacity: 0.2,
                                  child: SvgPicture.asset(
                                    'assets/home_images/shoes.svg',
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 30,
                                right: 25,
                                child: Opacity(
                                  opacity: 0.2,
                                  child: SvgPicture.asset(
                                    'assets/home_images/pad.svg',
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MoodScreen(),
                                        ));
                                  },
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 40),
                                    ),
                                  ),
                                  child: const Text('Begin Test'),
                                ),
                              )
                            ],
                          ),
                          Divider(
                            color: AppTheme.lightMainColor,
                            thickness: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'Let’s Have A Conversation',
                              style: AppTheme.black16w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5, right: 15, left: 15, bottom: 15),
                            child: Text(
                              'Chat with our doctors and help us understand...',
                              style: AppTheme.black13w500,
                            ),
                          ),
                          Container(
                            height: 130,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: ListView.builder(
                              itemCount: dr.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Container(
                                height: 120,
                                width: width / 1.4,
                                padding: const EdgeInsets.all(10),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: AppTheme.lightBlueColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                        'assets/home_images/drimage.png'),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 15),
                                        Text(
                                          dr[index]['name'],
                                          style: AppTheme.black16w600,
                                          softWrap: false,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          dr[index]['degree'],
                                          style: AppTheme.black14w400,
                                          softWrap: false,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          dr[index]['exp'],
                                          style: AppTheme.black14w400,
                                          softWrap: false,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          dr[index]['lan'],
                                          style: AppTheme.black14w400,
                                          softWrap: false,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.justify,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ContactUsScreen(),
                                        ));
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        AppTheme.blueColor),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 40),
                                    ),
                                  ),
                                  child: const Text("Let's chat"),
                                ),
                              ]),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15, right: 15, left: 15),
                            child: Text(
                              'Tip of the day',
                              style: AppTheme.black16w600,
                            ),
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 125,
                                width: width,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 15),
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: AppTheme.lightBrownColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              Positioned(
                                  top: 30,
                                  left: 50,
                                  child: SvgPicture.asset(
                                      'assets/home_images/bulb.svg')),
                              Positioned(
                                top: 70,
                                left: 55,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Apple a day keep',
                                      style: AppTheme.brown16w600,
                                    ),
                                    Text(
                                      'doctors away!',
                                      style: AppTheme.brown16w600,
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                  top: 20,
                                  right: 50,
                                  child: SvgPicture.asset(
                                      'assets/home_images/buib_setting.svg')),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}
