// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:seven_note/controls/tab_home_page.dart';
import 'package:seven_note/controls/title.dart';

void main() {
  runApp(const MainPage());
  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(600, 450);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "柒笔记";
    win.maximize();
    win.show();
  });
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WindowBorder(
            color: Colors.transparent,
            width: 1,
            child: Column(
              children: const [
                TitleWidget(),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: TabHomePage(),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
