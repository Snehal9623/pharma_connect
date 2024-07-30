import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_connect/utils/app_color.dart';

class BulletListWidget extends StatefulWidget {
  final List<String> list;

  const BulletListWidget({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  State<BulletListWidget> createState() => BulletListWidgetState();
}

class BulletListWidgetState extends State<BulletListWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: widget.list.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 1.h,
                    ),
                    child: Text(
                      "\u2022",
                      style: TextStyle(
                        color: AppColors.textColor11,
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 1.h,
                    ),
                    child: Text(
                      widget.list[index],
                      style: TextStyle(
                        color: AppColors.textColor11,
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                ],
              ));
        });
  }
}
