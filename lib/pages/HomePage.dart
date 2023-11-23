import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodfast/data/Firebase/RealtimeDatabase.dart';
import 'package:foodfast/pages/HomePageScreens/HomePageScreen.dart';
import 'package:foodfast/pages/HomePageScreens/ChatScreen.dart';
import 'HomePageScreens/ExerciseScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map<int, Widget> screens = {
    0: HomePageScreen(),
    1: const ExerciseScreen(),
    2: const ChatScreen(),
  };

  Map<int, String> titles = {
    0: "Home",
    1: "Exercise",
    2: "Chat",
  };

  Widget? selectScreen;
  int _selectedIndexBottomNavigationBar = 0;
  String? _titleAppBar;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectScreen = screens[0];
    _titleAppBar = titles[0];
    // addPlates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(leading: GestureDetector(child: Icon(CupertinoIcons.back), onTap: () => Navigator.of(context).pop(),),backgroundColor: Colors.indigo, title: Text(_titleAppBar??"", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white),), shadowColor: Colors.black,),
      body: selectScreen ?? screens[0]!,
      bottomNavigationBar: BottomNavigationBar(items: [const BottomNavigationBarItem(icon: Icon(CupertinoIcons.home, color: Colors.white,), label: ""), const BottomNavigationBarItem(icon: Icon(Icons.emoji_emotions_rounded, color: Colors.white,), label: ""), const BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble_2_fill, color: Colors.white,), label: "")], selectedFontSize: 0, backgroundColor: Colors.indigo,onTap: (value) {
        setState(() {
          selectScreen = screens[value];
          _selectedIndexBottomNavigationBar = value;
          _titleAppBar = titles[value];
        });
      }, currentIndex: _selectedIndexBottomNavigationBar),
    );
  }
}
