import 'package:chat_flutter/pages/chat_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: ChatScreen(),
    debugShowCheckedModeBanner: false,
    title: "Chat Flutter",
    theme: ThemeData(
      primarySwatch: Colors.blue,
      iconTheme: IconThemeData(
        color: Colors.blue
      )
    ),
  ));
}
