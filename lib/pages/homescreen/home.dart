import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manka_reading/functions/functions.dart';
import 'package:manka_reading/pages/homescreen/gridlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    fetchmanga();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 16,top: 10).r,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: Text('Mankas',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700
              ),
              ),
          ),
            actions: [
              IconButton(
                onPressed: (){}, 
                icon: Icon(Icons.search,
                color: Colors.white,
                size: 34.sp,
                )
                ),
            ],
        ),
        body: Functions.mangaloded == false ? const Center(child:CircularProgressIndicator(color: Colors.white,strokeWidth: 10,)): Column(
          children:[
            SizedBox(height:30.h),
            const GridList()
          ],
        )
      ),
    );
  }
  fetchmanga()async{
     await Functions.fetchManga();
     setState(() {});
  }
}