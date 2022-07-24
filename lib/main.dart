import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manka_reading/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) =>  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage()
    ),
    designSize: const Size(360.0, 764.0),
    );
  }
}