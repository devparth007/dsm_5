import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common/theme.dart';
import 'homescreen.dart';

class FAQSScreen extends StatefulWidget {
  const FAQSScreen({Key? key}) : super(key: key);

  @override
  State<FAQSScreen> createState() => _FAQSScreenState();
}

class _FAQSScreenState extends State<FAQSScreen> {
  int selected = -1;

  List ddd = [
    {
      "title": "Quetion 1",
      "text":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since."
    },
    {
      "title": "Quetion 2",
      "text":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since."
    },
    {
      "title": "Quetion 3",
      "text":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since."
    },
    {
      "title": "Quetion 4",
      "text":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since."
    },
    {
      "title": "Quetion 5",
      "text":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since."
    },
    {
      "title": "Quetion 6",
      "text":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since."
    },
    {
      "title": "Quetion 7",
      "text":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since."
    },
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
                    "FAQ's",
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
                child: ListView.builder(
                  key: Key('builder ${selected.toString()}'),
                  itemCount: ddd.length,
                  itemBuilder: (context, index) => ExpansionTile(
                    key: Key(index.toString()),
                    initiallyExpanded: index == selected,
                    title: Text(
                      ddd[index]['title'],
                    ),
                    childrenPadding:
                        const EdgeInsets.only(bottom: 15, right: 15, left: 15),
                    backgroundColor: AppTheme.lightMainColor,
                    iconColor: AppTheme.mainColor,
                    onExpansionChanged: ((v) {
                      if (v) {
                        setState(() {
                          selected = index;
                        });
                      } else {
                        setState(() {
                          selected = -1;
                        });
                      }
                    }),
                    children: [
                      Text(ddd[index]['text']),
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
