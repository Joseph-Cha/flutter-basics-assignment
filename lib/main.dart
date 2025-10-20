import 'package:flutter/material.dart';
import 'package:tasks/pages/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Noto_Sans_KR'),
      home: HomePage(ownerName: "동훈"),
    ),
  );
}
