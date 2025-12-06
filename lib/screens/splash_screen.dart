import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ovqatlar_menyusi/screens/intro_screens/intro_page1.dart';
import 'package:ovqatlar_menyusi/screens/intro_screens/intro_page2.dart';
import 'package:ovqatlar_menyusi/screens/intro_screens/intro_page3.dart';
import 'package:ovqatlar_menyusi/screens/tabs_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = '/splash-screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // controller to keep track of pages
  final PageController _controller = PageController();

  // keep track of if we are on the last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //page view
          PageView(
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            controller: _controller,
            children: [IntroPage1(), IntroPage2(), IntroPage3()],
          ),
          // doot indicator
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                //skip
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: GoogleFonts.acme().fontFamily,
                    ),
                  ),
                ),
                // dot indicator
                SmoothPageIndicator(controller: _controller, count: 3),

                //next or done
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.of(
                            context,
                          ).pushNamed(TabsScreen.routeName); //
                        },
                        child: Text(
                          "Done",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: GoogleFonts.acme().fontFamily,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          //go to home screen
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: GoogleFonts.acme().fontFamily,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
