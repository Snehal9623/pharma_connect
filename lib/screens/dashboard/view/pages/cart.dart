import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_connect/screens/dashboard/data/medicine_data.dart';
import 'package:pharma_connect/utils/app_color.dart';
import 'package:pharma_connect/utils/app_constants.dart';
import 'package:pharma_connect/utils/app_images.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<CartScreen> createState() => _TakeAwayScreenState();
}

class _TakeAwayScreenState extends State<CartScreen> {
  late PageController _pageController;
  int activePage = 1;

  List<String> images = [
    AppImages.bp_monitor_img,
    AppImages.bp_monitor_img,
    AppImages.bp_monitor_img
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Container(
          decoration: BoxDecoration(
            color: AppColors.themeColor,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(
                  15.r,
                ),
                bottomLeft: Radius.circular(
                  15.r,
                )),
            gradient: LinearGradient(
              colors: [AppColors.themeColor, AppColors.linearGradientColor],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppName.APP_NAME,
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                ),
                IconButton(
                  icon: Badge(
                    child: const Icon(
                      Icons.notifications_sharp,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Text(
          "Cart",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.themeColor,
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
          ),
        ),
      ),
    );
  }
}
