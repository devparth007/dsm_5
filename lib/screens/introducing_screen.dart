import 'package:dsm_5/screens/auth_screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../common/theme.dart';

class IntroducingScreen extends StatefulWidget {
  const IntroducingScreen({Key? key}) : super(key: key);

  @override
  State<IntroducingScreen> createState() => _IntroducingScreenState();
}

class _IntroducingScreenState extends State<IntroducingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "Onboarding 1",
          body:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          image: SvgPicture.asset('assets/introducind_image/introducing1.svg'),
          decoration: PageDecoration(
            bodyTextStyle: AppTheme.black14w400,
            titleTextStyle: AppTheme.black16w600,
          ),
        ),
        PageViewModel(
          title: "Onboarding 2",
          body:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          image: SvgPicture.asset('assets/introducind_image/introducing2.svg'),
          decoration: PageDecoration(
            bodyTextStyle: AppTheme.black14w400,
            titleTextStyle: AppTheme.black16w600,
          ),
        ),
        PageViewModel(
          title: "Onboarding 3",
          body:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          decoration: PageDecoration(
            bodyTextStyle: AppTheme.black14w400,
            titleTextStyle: AppTheme.black16w600,
          ),
          image: SvgPicture.asset('assets/introducind_image/introducing3.svg'),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      back: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          shadowColor: MaterialStateProperty.all(AppTheme.mainColor),
          foregroundColor: MaterialStateProperty.all(AppTheme.mainColor),
          backgroundColor: MaterialStateProperty.all(AppTheme.mainColor),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
        ),
        onPressed: null,
        child: Text(
          "Back",
          style: AppTheme.white14w600,
        ),
      ),
      skip: Text(
        'Skip',
        style: AppTheme.main16w600,
      ),
      next: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          shadowColor: MaterialStateProperty.all(AppTheme.mainColor),
          foregroundColor: MaterialStateProperty.all(AppTheme.mainColor),
          backgroundColor: MaterialStateProperty.all(AppTheme.mainColor),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          ),
        ),
        onPressed: null,
        child: Text(
          "Next",
          style: AppTheme.white14w600,
        ),
      ),
      done: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          shadowColor: MaterialStateProperty.all(AppTheme.mainColor),
          foregroundColor: MaterialStateProperty.all(AppTheme.mainColor),
          backgroundColor: MaterialStateProperty.all(AppTheme.mainColor),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
        ),
        onPressed: null,
        child: Text(
          "Let's start",
          style: AppTheme.white14w600,
        ),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      // controlsPadding: kIsWeb
      //     ? const EdgeInsets.all(12.0)
      //     : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: DotsDecorator(
        size: const Size(10.0, 10.0),
        color: const Color(0xFFBDBDBD),
        activeColor: AppTheme.mainColor,
        activeSize: const Size(22.0, 10.0),
        activeShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}

// class OnBoardingPage extends StatefulWidget {
//   @override
//   _OnBoardingPageState createState() => _OnBoardingPageState();
// }

// class _OnBoardingPageState extends State<OnBoardingPage> {
//   final introKey = GlobalKey<IntroductionScreenState>();

//   void _onIntroEnd(context) {
//     Navigator.of(context).push(
//       MaterialPageRoute(builder: (_) => const LoginScreen()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return IntroductionScreen(
//       key: introKey,
//       globalBackgroundColor: Colors.white,
//       pages: [
//         PageViewModel(
//           title: "Onboarding 1",
//           body:
//               "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
//           image: SvgPicture.asset('assets/introducind_image/introducing1.svg'),
//           decoration: PageDecoration(
//             bodyTextStyle: AppTheme.black14w400,
//             titleTextStyle: AppTheme.black16w600,
//           ),
//         ),
//         PageViewModel(
//           title: "Onboarding 2",
//           body:
//               "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
//           image: SvgPicture.asset('assets/introducind_image/introducing2.svg'),
//           decoration: PageDecoration(
//             bodyTextStyle: AppTheme.black14w400,
//             titleTextStyle: AppTheme.black16w600,
//           ),
//         ),
//         PageViewModel(
//           title: "Onboarding 3",
//           body:
//               "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
//           decoration: PageDecoration(
//             bodyTextStyle: AppTheme.black14w400,
//             titleTextStyle: AppTheme.black16w600,
//           ),
//           image: SvgPicture.asset('assets/introducind_image/introducing3.svg'),
//         ),
//       ],
//       onDone: () => _onIntroEnd(context),
//       showSkipButton: true,
//       skipOrBackFlex: 0,
//       nextFlex: 0,
//       back: ElevatedButton(
//         style: ButtonStyle(
//           shape: MaterialStateProperty.all(
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
//           shadowColor: MaterialStateProperty.all(AppTheme.mainColor),
//           foregroundColor: MaterialStateProperty.all(AppTheme.mainColor),
//           backgroundColor: MaterialStateProperty.all(AppTheme.mainColor),
//           padding: MaterialStateProperty.all(
//             const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//           ),
//         ),
//         onPressed: null,
//         child: Text(
//           "Back",
//           style: AppTheme.white14w600,
//         ),
//       ),
//       skip: Text(
//         'Skip',
//         style: AppTheme.main16w600,
//       ),
//       next: ElevatedButton(
//         style: ButtonStyle(
//           shape: MaterialStateProperty.all(
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
//           shadowColor: MaterialStateProperty.all(AppTheme.mainColor),
//           foregroundColor: MaterialStateProperty.all(AppTheme.mainColor),
//           backgroundColor: MaterialStateProperty.all(AppTheme.mainColor),
//           padding: MaterialStateProperty.all(
//             const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
//           ),
//         ),
//         onPressed: null,
//         child: Text(
//           "Next",
//           style: AppTheme.white14w600,
//         ),
//       ),
//       done: ElevatedButton(
//         style: ButtonStyle(
//           shape: MaterialStateProperty.all(
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
//           shadowColor: MaterialStateProperty.all(AppTheme.mainColor),
//           foregroundColor: MaterialStateProperty.all(AppTheme.mainColor),
//           backgroundColor: MaterialStateProperty.all(AppTheme.mainColor),
//           padding: MaterialStateProperty.all(
//             const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//           ),
//         ),
//         onPressed: null,
//         child: Text(
//           "Let's start",
//           style: AppTheme.white14w600,
//         ),
//       ),
//       curve: Curves.fastLinearToSlowEaseIn,
//       controlsMargin: const EdgeInsets.all(16),
//       // controlsPadding: kIsWeb
//       //     ? const EdgeInsets.all(12.0)
//       //     : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
//       dotsDecorator: DotsDecorator(
//         size: const Size(10.0, 10.0),
//         color: const Color(0xFFBDBDBD),
//         activeColor: AppTheme.mainColor,
//         activeSize: const Size(22.0, 10.0),
//         activeShape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(25.0)),
//         ),
//       ),
//     );
//   }
// }
