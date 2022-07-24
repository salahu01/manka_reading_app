import 'package:flutter/material.dart';
import 'package:manka_reading/pages/account.dart';
import 'package:manka_reading/pages/favourite.dart';
import 'package:manka_reading/pages/home/home.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  final String hello ='';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _currentindex = 1;
  PageController controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: controller,
              onPageChanged: (page) {
                setState(() {
                  _currentindex = page;
                });
              },
              children: const [FavouritePage(), HomePage(), AccountInfoPage()],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavigationBar(
                  elevation: 0,
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.black,
                  backgroundColor: Colors.white,
                  currentIndex: _currentindex,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  onTap: (index) {
                    setState(() {
                      _currentindex = index;
                      controller.jumpToPage(index);
                    });
                  },
                  items: const [
                    BottomNavigationBarItem(
                        label: '', icon: Icon(Icons.notes_rounded)),
                    BottomNavigationBarItem(
                        label: '', icon: Icon(Icons.menu_book_sharp)),
                    BottomNavigationBarItem(
                        label: '', icon: Icon(Icons.person)),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}