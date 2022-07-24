import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manka_reading/widgets/detailsscreen.dart';

class GridModel extends StatelessWidget {
  const GridModel(
      {Key? key,
      required this.length,
      required this.images,
      required this.titles,
      required this.urls})
      : super(key: key);
  final int length;
  final dynamic images, titles, urls;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 0.7),
      itemCount: length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => DetailsScreen(image: images[index], title: titles[index] , url: urls[index])));
          },
          child: Padding(
            padding: EdgeInsets.all(4.r),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.network(
                    images[index],
                    height: 145.h,
                    width: 200.w,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  titles[index],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
