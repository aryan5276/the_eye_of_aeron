import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pytorch_lite_example/constants.dart';
import 'package:pytorch_lite_example/splash_page.dart';

// Future<void> main() async {
//   runApp(const SplashPage());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.apply();
    return MaterialApp(
      // To-do - Add Permitted orientations
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.montserratSubrayadaTextTheme(textTheme).apply(
              bodyColor: Colors.black,
              fontFamily:
                  GoogleFonts.montserrat(color: Colors.black).fontFamily)),
      home: const SplashPage(),
    );
  }
}
