import 'package:flutter/material.dart';
import 'package:marvel_portal/pages/home.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      theme: ThemeData(
        fontFamily: 'Roboto',
        primaryColor: const Color(0xFFD42026),
      ),
    );
  }
}
