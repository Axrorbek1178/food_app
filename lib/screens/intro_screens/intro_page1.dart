import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.amber.shade700, Colors.limeAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Text(
            "Welcome to the App",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.aclonica().fontFamily,
            ),
          ),
          SizedBox(height: 30),
          Center(child: Image.asset(width: 350, 'assets/images/splash1.png')),
        ],
      ),
    );
  }
}
