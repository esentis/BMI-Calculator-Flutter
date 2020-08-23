import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  ThemeData themeSelector() {
    return ThemeData.dark().copyWith(
      primaryColor: const Color(0xFF2c003e),
      scaffoldBackgroundColor: const Color(0xFF2c003e),
    );
  }

  @override
  Widget build(BuildContext context) {
    // LOCK THE ORIENTATION
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: themeSelector(),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
      },
    );
  }
}
