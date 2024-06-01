import 'package:flutter/material.dart';

class HomeNotifier extends ChangeNotifier {
  final BuildContext context;

  HomeNotifier({required this.context});
  
  TextEditingController chat = TextEditingController();

  submit(String value) {
    chat.text = value;
    notifyListeners();
  }
}
