import 'package:dsm_5/screens/popular_test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../common/theme.dart';
import '../drawer/drawer.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Result',
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
      body: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: width,
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: AppTheme.lightMainColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deperession',
                      style: AppTheme.black16w400,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Test Name',
                      style: AppTheme.mainColor16w600,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'The Depression Use Disorders Identification Test (AUDIT)',
                      style: AppTheme.mainColor16w600,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      width: width,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: AppTheme.lightBlueColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Date : ',
                                style: AppTheme.black16w400,
                              ),
                              Text(
                                '12/09/2022',
                                style: AppTheme.black16w400,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                'Gender : ',
                                style: AppTheme.black16w400,
                              ),
                              Text(
                                'Male',
                                style: AppTheme.black16w400,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                'Age : ',
                                style: AppTheme.black16w400,
                              ),
                              Text(
                                '26',
                                style: AppTheme.black16w400,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                'Result : ',
                                style: AppTheme.black16w400,
                              ),
                              Text(
                                'Addiction likely',
                                style: AppTheme.black16w400,
                                softWrap: false,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 3,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 150,
                          width: width,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: AppTheme.lightGreenColor, width: 22),
                          ),
                        ),
                        CircularPercentIndicator(
                          animationDuration: 1000,
                          animateFromLastPercent: true,
                          radius: 60,
                          backgroundWidth: 20,
                          lineWidth: 18,
                          percent:
                              0.633, //data.isEmpty ? 0 : data[0]['perinvoice'] / 100,
                          progressColor: AppTheme.greenRingColor,
                          // data.isEmpty
                          //     ? AppTheme.mainBlurColor
                          //     : data[0]['perinvoice'] < 75.0
                          //         ? AppTheme.mainBlurColor
                          //         : AppTheme.failedColor,
                          backgroundColor: Colors.transparent,
                          circularStrokeCap: CircularStrokeCap.round,
                          animation: true,
                        ),
                        Text(
                          '63%',
                          style: AppTheme.black18w600,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Popular Tests',
                  style: AppTheme.black16w600,
                ),
              ),
              Container(
                width: width,
                padding: const EdgeInsets.only(
                    top: 15, right: 15, left: 15, bottom: 40),
                decoration: BoxDecoration(
                    color: AppTheme.whiteColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      // Shadow for top-left corner
                      BoxShadow(
                        color: Color(0xFFBDBDBD),
                        offset: Offset(0, 2),
                        blurRadius: 3,
                        spreadRadius: 0.1,
                      ),
                      // Shadow for bottom-right corner
                      BoxShadow(
                        color: Colors.white12,
                        offset: Offset(-2, -2),
                        blurRadius: 3,
                        spreadRadius: 0.1,
                      ),
                    ]),
                child: Column(
                  children: [
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since.",
                      style: AppTheme.black14w400,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 30),
                                child: SvgPicture.asset(
                                    'assets/mood_images/alcohol.svg'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const PopularTestScreen(),
                                      ));
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  shadowColor: MaterialStateProperty.all(
                                      AppTheme.darkBlueColor),
                                  foregroundColor: MaterialStateProperty.all(
                                      AppTheme.darkBlueColor),
                                  backgroundColor: MaterialStateProperty.all(
                                      AppTheme.darkBlueColor),
                                  padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 25),
                                  ),
                                ),
                                child: Text('Begin Test',
                                    style: AppTheme.white14w600),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 30),
                                child: SvgPicture.asset(
                                    'assets/mood_images/ciggarate.svg'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const PopularTestScreen(),
                                      ));
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  shadowColor: MaterialStateProperty.all(
                                      AppTheme.darkOrangeColor),
                                  foregroundColor: MaterialStateProperty.all(
                                      AppTheme.darkOrangeColor),
                                  backgroundColor: MaterialStateProperty.all(
                                      AppTheme.darkOrangeColor),
                                  padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 25),
                                  ),
                                ),
                                child: Text('Begin Test',
                                    style: AppTheme.white14w600),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      width: width,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppTheme.lightMainColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  'assets/result_images/download.svg'),
                              const SizedBox(
                                width: 10,
                              ),
                              Text('Download', style: AppTheme.mainColor16w600),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 50,
                      width: width,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppTheme.lightMainColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/result_images/share.svg',
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text('Share', style: AppTheme.mainColor16w600),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: AppTheme.commonButtonStyle,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/result_images/call.svg',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('Call now', style: AppTheme.white14w600),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
