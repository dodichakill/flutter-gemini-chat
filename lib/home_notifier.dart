import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:myapp/models/chat_new_model.dart';

class HomeNotifier extends ChangeNotifier {
  final BuildContext context;
  HomeNotifier({required this.context}){
    // getData();
  }
  
  TextEditingController chat = TextEditingController();

  // ai
  final Gemini gemini = Gemini.instance;

  int no = 1;
  List<String> listChat = [];
  submit(String value) {
    no++;
    ChatNewModel chats = ChatNewModel(
      id: no, 
      posisi: "kanan", 
      chat: chat.text, 
      createdDate: DateTime.now().toString(), 
      type: "text", 
      status: "receive");

      list = [chats, ...list];
    // listChat.add(chat.text);
    chat.clear();
    gemini.streamGenerateContent(chats.chat).listen((e){
      ChatNewModel resp = ChatNewModel(
        id: no+1, 
        posisi: "kiri", 
        chat: e.content!.parts?.fold("", (before,after) => " $before ${after.text}") ?? "", 
        createdDate: DateTime.now().toString(), 
        type: "text", 
        status: "receive");
    list = [resp, ...list];
    notifyListeners();
    });
  }

  List <ChatNewModel>list = [];
  getData() async {
    Dio dio = Dio();
    list.clear();
    final response = await dio.get("https://tegaldev.metimes.id/chat-sample");
    final data = jsonDecode(response.data);
    
    for (Map<String, dynamic> i in data['data']) {
      list.add(ChatNewModel.fromJson(i)
      );
    }

    notifyListeners();
  }
}

