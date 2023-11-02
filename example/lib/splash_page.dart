import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pytorch_lite_example/choose_demo.dart';
import 'package:pytorch_lite_example/constants.dart';
import 'package:pytorch_lite_example/on_boarding_screen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({key});

  @override
  Widget build(BuildContext context) {
    // Setting the constants present in the constants file for the screen size
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return AnimatedSplashScreen(
      duration: 2000,
      splash: Column(
        children: [
          Text("Welcome to",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                // fontSize: 35, height: 1.2
              )),
          const SizedBox(
            height: 3,
          ),
          Text("The Eye of Aeron",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  height: 1.2)),
          const SizedBox(
            height: 3,
          ),
          const Text(
            "Detect UAVs right from the ease of your phone",
            style: TextStyle(fontSize: 10, color: Colors.white),
          )
        ],
      ),
      backgroundColor: backgroundColor,
      nextScreen: const OnBoardingScreen(),
    );
  }
}
