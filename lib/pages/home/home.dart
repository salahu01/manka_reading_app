import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manka_reading/pages/home/components/top_list.dart';
import 'components/all_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool selectedItem = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        toolbarHeight: 70.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Row(
          children: [
            const SizedBox(width: 8),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notes_rounded,
                  color: Colors.black,
                  size: 34.sp,
                )),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: 34.sp,
              )),
          const SizedBox(width: 16)
        ],
      ),
      body: Column(
        children: [
          SizedBox(
              height: 60.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      if (selectedItem == true) {
                        setState(() {
                          selectedItem = false;
                        });
                      }
                    },
                    child: Text(
                      'Top List',
                      style: TextStyle(
                          shadows: const [
                            Shadow(color: Colors.black, offset: Offset(0, -10))
                          ],
                          decoration: selectedItem == false
                              ? TextDecoration.underline
                              : TextDecoration.none,
                          decorationThickness: 3,
                          decorationColor: Colors.black,
                          decorationStyle: TextDecorationStyle.solid,
                          color: Colors.transparent,
                          fontSize: selectedItem == false ? 25.sp : 18.sp,
                          fontWeight: selectedItem == false
                              ? FontWeight.w900
                              : FontWeight.w700),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (selectedItem == false) {
                        setState(() {
                          selectedItem = true;
                        });
                      }
                    },
                    child: Text(
                      'All List',
                      style: TextStyle(
                          shadows: const [
                            Shadow(color: Colors.black, offset: Offset(0, -10))
                          ],
                          decoration: selectedItem == true
                              ? TextDecoration.underline
                              : TextDecoration.none,
                          decorationThickness: 3,
                          decorationColor: Colors.black,
                          decorationStyle: TextDecorationStyle.solid,
                          color: Colors.transparent,
                          fontSize: selectedItem == true ? 22.sp : 18.sp,
                          fontWeight: selectedItem == true
                              ? FontWeight.w900
                              : FontWeight.w700),
                    ),
                  )
                ],
              )),
          selectedItem == false
              ? const Expanded(child: TopListPage())
              : const Expanded(child: AllListPage())
        ],
      ),
    );
  }
}