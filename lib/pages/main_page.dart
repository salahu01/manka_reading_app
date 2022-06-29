import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manka_reading/pages/account.dart';
import 'package:manka_reading/pages/favourite.dart';
import 'package:manka_reading/pages/homescreen/home.dart';
import 'package:manka_reading/widgets/glassmorphism.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentindex = 1;
  PageController controller =PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 17, 11, 33),
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: controller,
              onPageChanged: (page){
                setState(() {
                  _currentindex=page;
                });
              },
              children: const[
                FavouritePage(),
                HomePage(),
                AccountInfoPage()
              ],
            ),
        Align(
          alignment: Alignment.bottomCenter,
          child: GlassMorphism(
          blur: 0.1,
          border: 0,
          borderradius: 400.r,
          color: Colors.white,
          height: 52.h,
          width: 80.w,
          opacity: 0.2,
          child: BottomNavigationBar(
              elevation: 0,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white38,
              backgroundColor: Colors.transparent,
              currentIndex: _currentindex,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: (index){
                setState(() {
                   _currentindex =index;
                   controller.jumpToPage(index);
                });
              },
              items: const [
                BottomNavigationBarItem(label: '', icon: Icon(Icons.notes_rounded)),
                BottomNavigationBarItem(label: '', icon: Icon(Icons.menu_book_sharp)),
                BottomNavigationBarItem(label: '', icon: Icon(Icons.person)),
              ]),
              ),
        ),
          ],
        ),
      ),
    );
  }
}
