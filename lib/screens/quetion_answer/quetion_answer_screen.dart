import 'package:dsm_5/provider/home_provider.dart';
import 'package:dsm_5/screens/homescreen.dart';
import 'package:dsm_5/screens/quetions_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../common/theme.dart';

class QuetionAndAnswerScreen extends StatefulWidget {
  const QuetionAndAnswerScreen({Key? key}) : super(key: key);

  @override
  State<QuetionAndAnswerScreen> createState() => _QuetionAndAnswerScreenState();
}

class _QuetionAndAnswerScreenState extends State<QuetionAndAnswerScreen> {
  final PageController _pageController = PageController();

  popup() {
    return showDialog(
      barrierColor: AppTheme.whiteColor,
      context: context,
      builder: (context) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const QuetionsResultScreen(),
              ));
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
                  "congratulations You have completed this exam!",
                  style: AppTheme.black16w600,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List data = [
    {
      "quetion":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      "ans1": "Answer 1",
      "ans2": "Answer 2",
      "ans3": "Answer 3",
      "ans4": "Answer 4",
    },
    {
      "quetion":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      "ans1": "Answer 1",
      "ans2": "Answer 2",
      "ans3": "Answer 3",
      "ans4": "Answer 4",
    },
    {
      "quetion":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      "ans1": "Answer 1",
      "ans2": "Answer 2",
      "ans3": "Answer 3",
      "ans4": "Answer 4",
    },
    {
      "quetion":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      "ans1": "Answer 1",
      "ans2": "Answer 2",
      "ans3": "Answer 3",
      "ans4": "Answer 4",
    },
    {
      "quetion":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      "ans1": "Answer 1",
      "ans2": "Answer 2",
      "ans3": "Answer 3",
      "ans4": "Answer 4",
    },
  ];

  List anss = [];
  int _value = -1;

  void nextPage() {
    _pageController.animateToPage(_pageController.page!.toInt() + 1,
        duration: const Duration(milliseconds: 10), curve: Curves.easeIn);
  }

  void previousPage() {
    _pageController.animateToPage(_pageController.page!.toInt() - 1,
        duration: const Duration(milliseconds: 10), curve: Curves.easeIn);
  }

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
    final result = Provider.of<HomeProvider>(context).result;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Quetions',
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
        body: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            itemCount: data.length,
            itemBuilder: (context, index) => Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Quetion ${index + 1} / ${data.length}',
                    style: AppTheme.black20w600, textAlign: TextAlign.center),
                Text(
                  "${index + 1}. ${data[index]['quetion']}",
                  style: AppTheme.black16w600,
                ),
                Column(
                  children: [
                    common(
                      width: width,
                      radioValue: 1,
                      ans: "${data[index]['ans1']}",
                    ),
                    common(
                      width: width,
                      radioValue: 2,
                      ans: "${data[index]['ans2']}",
                    ),
                    common(
                      width: width,
                      radioValue: 3,
                      ans: "${data[index]['ans3']}",
                    ),
                    common(
                      width: width,
                      radioValue: 4,
                      ans: "${data[index]['ans4']}",
                    ),
                  ],
                ),
                index == 0
                    ? ElevatedButton(
                        style: AppTheme.commonButtonStyle,
                        onPressed: () {
                          if (_value == -1) {
                            return;
                          } else {
                            Provider.of<HomeProvider>(context, listen: false)
                                .addToList(value: _value);
                            setState(() {
                              _value = -1;
                            });
                            nextPage();
                          }
                        },
                        child: Text('Next', style: AppTheme.white14w600),
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: AppTheme.commonButtonStyle,
                              onPressed: () {
                                previousPage();
                                result.removeLast();
                              },
                              child:
                                  Text('Previous', style: AppTheme.white14w600),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              style: AppTheme.commonButtonStyle,
                              onPressed: () {
                                if (_value == -1) {
                                  return;
                                } else {
                                  Provider.of<HomeProvider>(context,
                                          listen: false)
                                      .addToList(value: _value);

                                  setState(() {
                                    _value = -1;
                                  });
                                  index == data.length - 1
                                      ? popup()
                                      : nextPage();
                                }
                              },
                              child: Text('Next', style: AppTheme.white14w600),
                            ),
                          ),
                        ],
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }

  common({
    required double width,
    required int radioValue,
    required String ans,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = radioValue;
        });
      },
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: AppTheme.lightMainColor,
          border: Border.all(
            color:
                _value == radioValue ? AppTheme.mainColor : AppTheme.whiteColor,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Radio(
              value: radioValue,
              groupValue: _value,
              onChanged: (value) {
                setState(() {
                  _value = radioValue;
                });
              },
              fillColor: MaterialStateColor.resolveWith(
                (states) => AppTheme.mainColor,
              ),
            ),
            Expanded(
              child: Text(
                ans,
                style: AppTheme.black14w400,
                softWrap: false,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
