import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manka_reading/functions/functions.dart';
import 'package:manka_reading/widgets/grid_model.dart';

class TopListPage extends StatefulWidget {
  const TopListPage({Key? key}) : super(key: key);

  @override
  State<TopListPage> createState() => _TopListPageState();
}

class _TopListPageState extends State<TopListPage> {
  @override
  Widget build(BuildContext context) {
    fetchmanga();
    return Functions.topmangaloded != true
        ? const Center(
            child:
                CircularProgressIndicator(strokeWidth: 10, color: Colors.black))
        : Padding(
            padding: EdgeInsets.only(bottom: 50.r),
            child: GridModel(length: Functions.topTitles.length, images: Functions.topImages, titles: Functions.topTitles, urls: Functions.topUrls)
          );
  }

  fetchmanga() async {
    if (Functions.topmangaloded != true) {
      await Functions.fetchTopManga();
      setState(() {});
    }
  }
}
