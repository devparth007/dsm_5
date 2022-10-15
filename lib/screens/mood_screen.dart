import 'package:dsm_5/screens/quetion_answer/quetion_answer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common/theme.dart';
import 'homescreen.dart';

class MoodScreen extends StatefulWidget {
  const MoodScreen({Key? key}) : super(key: key);

  @override
  State<MoodScreen> createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  int _value = -1;
  List mood = [
    "assets/mood_images/happy.svg",
    "assets/mood_images/stress.svg",
    "assets/mood_images/sleep.svg",
    "assets/mood_images/depression.svg",
    "assets/mood_images/anxiety.svg",
    "assets/mood_images/anger.svg",
  ];
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
        appBar: AppBar(
          title: Text(
            'Choose your mood',
            style: AppTheme.black16w600,
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
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
                'assets/details_image/back_arrow.svg',
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: ElevatedButton(
            style: AppTheme.commonButtonStyle,
            onPressed: () {
              if (_value != -1) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuetionAndAnswerScreen(),
                    ));
              }
            },
            child: Text(
              'Next',
              style: AppTheme.white14w600,
            ),
          ),
        ),
        body: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GridView.builder(
                  itemCount: mood.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.9,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _value = index;
                        });
                      },
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(
                              color: _value == index
                                  ? AppTheme.mainColor
                                  : Colors.transparent,
                              width: 2),
                        ),
                        child: SvgPicture.asset(
                          mood[index],
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
