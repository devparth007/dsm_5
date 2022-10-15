import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../common/theme.dart';
import 'homescreen.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
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
                    'About Us',
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
                          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque pharetra mauris vel odio lacinia, eget cursus odio mattis. Mauris elementum vulputate risus, tincidunt maximus libero malesuada non. Fusce finibus sapien mauris, eget luctus lacus lacinia et. Duis consectetur efficitur dui, quis luctus justo facilisis tempor. Aliquam bibendum, lorem eget aliquet tempus, turpis sem semper diam, a maximus tortor nibh sed arcu. Curabitur euismod turpis vitae mauris egestas, et tempus orci mollis. Quisque rhoncus congue scelerisque. Nam feugiat aliquet sapien sit amet tristique. Morbi quis fermentum metus, sed tincidunt sapien. Praesent nisl elit, pulvinar ac pharetra laoreet, lacinia ac metus. Etiam id hendrerit enim. Mauris lacus velit, tincidunt in cursus eu, vulputate a nisi. Vestibulum ac ligula ut odio laoreet imperdiet eget vitae est.
    
    In nec ultricies dui. Sed dapibus congue dui, ut mattis urna finibus sed. Maecenas quis tellus turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In pellentesque fermentum suscipit. Vestibulum blandit aliquet odio, sed interdum est lobortis vitae. Nulla bibendum fringilla purus, vitae condimentum nisl elementum posuere. Duis quis pharetra mi.
    
    Suspendisse luctus nibh in tortor ornare pretium. Morbi mattis eu sapien id fermentum. Suspendisse accumsan vehicula augue ac pharetra. Nullam dictum facilisis arcu, in ornare neque pellentesque ut. Donec at porttitor sapien. Proin et venenatis diam, vitae egestas ex. Vestibulum sit amet porttitor dolor. Aenean sem ipsum, iaculis vel vulputate sit amet, efficitur sit amet odio. Mauris gravida elementum hendrerit. Nam quis tortor tincidunt, tincidunt quam ac, scelerisque mi.
    
    Duis lobortis pulvinar sapien vitae varius. Aenean porttitor nunc mauris, accumsan tincidunt tortor efficitur vulputate. Integer tristique sollicitudin justo a dictum. In pharetra tortor in turpis blandit accumsan quis eu urna. Praesent ut aliquam dolor. Fusce pellentesque accumsan turpis quis mattis. Ut finibus ut nisi at hendrerit. Sed porttitor quam vitae libero facilisis varius. Nam tristique tempor felis, vitae commodo libero tincidunt sit amet. Integer pharetra leo egestas mi dictum, at molestie turpis faucibus. In sed maximus felis. In hendrerit purus quis nisi faucibus mattis. Vivamus vitae lorem a orci feugiat commodo quis eu neque. Morbi ut posuere velit. Sed tellus nulla, rutrum viverra tincidunt rutrum, interdum laoreet lorem.
    
    Sed eleifend mi quis metus finibus bibendum. Nam tincidunt efficitur mauris vel varius. Maecenas vulputate magna ac est sagittis, nec dictum libero eleifend. Proin consectetur molestie augue, eget pharetra libero scelerisque sit amet. In hac habitasse platea dictumst. Quisque in pharetra ex, ac interdum turpis. Aliquam rutrum condimentum aliquet. Vivamus eu ex lacinia, porta quam eu, luctus libero. Sed dapibus sapien in massa euismod placerat. Proin euismod neque volutpat leo ornare, eu pharetra nulla pellentesque. Donec a eros vitae enim feugiat consectetur ut ut est. Duis semper porta risus, eu lacinia nisi. Morbi feugiat enim magna, ac vulputate turpis hendrerit ut.""",
                          style: AppTheme.black14w600,
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
    );
  }
}
