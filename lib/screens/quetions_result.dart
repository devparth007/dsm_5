import 'package:dsm_5/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../common/theme.dart';

class QuetionsResultScreen extends StatefulWidget {
  const QuetionsResultScreen({Key? key}) : super(key: key);

  @override
  State<QuetionsResultScreen> createState() => _QuetionsResultScreenState();
}

class _QuetionsResultScreenState extends State<QuetionsResultScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  List description = [
    {
      "text":
          "1 . Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since."
    },
    {
      "text":
          "2 . Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since."
    },
    {
      "text":
          "3 . Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since."
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
  void initState() {
    tabController = TabController(vsync: this, length: 3, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final result = Provider.of<HomeProvider>(context).result;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Result',
            style: AppTheme.black16w600,
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ));
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
        body: SizedBox(
          height: height,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 30, bottom: 10, right: 15, left: 15),
                child: Text(
                  'Depression',
                  style: AppTheme.main14w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5, right: 15, left: 15),
                child: Text(
                  'The Depression Use Disorders Identification Test (AUDIT)',
                  style: AppTheme.black14w600,
                ),
              ),
              Container(
                height: 50,
                width: width,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 10, top: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppTheme.lightMainColor,
                      width: 0.5,
                    ),
                  ),
                ),
                child: TabBar(
                  labelColor: AppTheme.whiteColor,
                  indicatorWeight: 1,
                  labelStyle: AppTheme.black13w500,
                  unselectedLabelColor: AppTheme.blackColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      color: AppTheme.mainColor,
                      borderRadius: BorderRadius.circular(5)),
                  indicatorColor: AppTheme.whiteColor,
                  isScrollable: false,
                  controller: tabController,
                  onTap: (value) {},
                  tabs: const [
                    Tab(text: "Description"),
                    Tab(text: "Facts"),
                    Tab(text: "About"),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    ListView.builder(
                      itemCount: description.length,
                      itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          children: [
                            Text(
                              description[index]['text'],
                              style: AppTheme.black16w300,
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListView.builder(
                      itemCount: description.length,
                      itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          children: [
                            Text(
                              description[index]['text'],
                              style: AppTheme.black16w300,
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListView.builder(
                      itemCount: description.length,
                      itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          children: [
                            Text(
                              description[index]['text'],
                              style: AppTheme.black16w300,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
