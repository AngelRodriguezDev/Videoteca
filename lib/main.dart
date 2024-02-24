import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:videoteca/general/theme.dart';
import 'package:videoteca/view/bookmark_layout.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Videoteca',
      theme: themeAX,
      home: const BookMarkPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
