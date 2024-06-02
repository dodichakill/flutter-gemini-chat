import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:myapp/home_page.dart';

void main() {
  Gemini.init(apiKey: "AIzaSyCR9g8GokNugkH-ZssEQRc8LPLeTpNYW4M");
  runApp(MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    )
  );
}
