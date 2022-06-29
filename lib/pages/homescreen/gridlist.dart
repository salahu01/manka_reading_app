import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manka_reading/functions/functions.dart';

class GridList extends StatelessWidget {
  const GridList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top List',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          width: double.maxFinite,
          height: 220.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: Functions.images.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Image.network(
                      Functions.images[index],
                      fit: BoxFit.cover,
                      height: 200.w,
                      width: 140.w,
                    ),
                  ),
                  SizedBox(width: 10.w)
                ],
              );
            },
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          'All Mankas',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 300.h,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: Functions.titles.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                child: ListTile(
                  title: Text(
                    Functions.titles[index],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  leading: Image.network(
                    Functions.images[index],
                    fit: BoxFit.cover,
                    height: 100.h,
                    width: 50.w,
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
