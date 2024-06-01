import 'package:flutter/material.dart';
import 'package:myapp/home_notifier.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => HomeNotifier(context: context),
    child: Consumer<HomeNotifier>(builder: (context, value, child) => Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top:0,left: 0,right:0,bottom: 0,
            child: Image.asset("assets/pattern.png", repeat: ImageRepeat.repeat,),),
            Positioned(top: 0, left:0, right:0, child: Container(
              color: Colors.white,
              height: 60, 
              child: Row(
                children: [
                  Icon(Icons.arrow_back),
                  SizedBox(width: 16,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(360),
                    child: Image.asset("assets/cat.jpg", fit: BoxFit.cover, height: 40, width: 40)
                  ),
                  SizedBox(width: 16,),
                  Text("Dodi"),
                  Spacer(),
                  Icon(Icons.video_call),
                  SizedBox(width: 16,),
                  Icon(Icons.call_outlined),
                  SizedBox(width: 16,),
                ],
              ))),
              Positioned(left:0, right:0, bottom:0, child: Container(
                height: 70,
                color: Colors.white,
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 8,),
                    Expanded(child: TextField(
                      controller: value.chat,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: ()=> value.submit(value.chat.text),
                          child: Icon(Icons.send)),
                        fillColor: Colors.grey[300],
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide.none
                        )
                      ),
                    )),
                    SizedBox(width: 16,),
                    Icon(Icons.camera_alt),
                    SizedBox(width: 8,),
                    Icon(Icons.mic)
                  ],
                )
              ))
          ]
        ),
      ),
    ),),);
  }
}