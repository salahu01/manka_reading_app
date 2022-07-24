import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../functions/functions.dart';
import '../../../widgets/grid_model.dart';

class AllListPage extends StatefulWidget {
  const AllListPage({Key? key}) : super(key: key);
  @override
  State<AllListPage> createState() => _AllListPageState();
}

class _AllListPageState extends State<AllListPage> {
  @override
  Widget build(BuildContext context) {
    fetchmanga();
    return Functions.allmangaloded != true
        ? const Center(
            child:
                CircularProgressIndicator(strokeWidth: 10, color: Colors.black))
        : Padding(
            padding: EdgeInsets.only(bottom: 50.r),
            child:  GridModel(length: Functions.allTitles.length, images: Functions.allImages, titles: Functions.allTitles, urls: Functions.allUrls)
          );
  }

  fetchmanga() async {
    if (Functions.allmangaloded != true) {
      await Functions.fetchAllManga();
      setState(() {});
    }
  }
}
