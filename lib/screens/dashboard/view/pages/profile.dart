import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_connect/utils/app_color.dart';
import 'package:pharma_connect/utils/app_constants.dart';
import 'package:pharma_connect/utils/app_images.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhiteBgColor,
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
              colors: [
                AppColors.themeColor,
                AppColors.linearGradientColor,
              ],
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
                  MyProfileScreenConstants.APP_BAR_TITLE,
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
      body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.containerColor1,
                  borderRadius: BorderRadius.circular(
                    10.r,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 10.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        child: Image.asset(
                          AppImages.dr_img,
                        ),
                        radius: 30.r,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 10.h,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              textAlign: TextAlign.start,
                              MyProfileScreenConstants.DR_NAME,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                                color: AppColors.textColor6,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    5.r,
                                  ),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1.w,
                                  )),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 3.h,
                                ),
                                child: Text(
                                  textAlign: TextAlign.start,
                                  MyProfileScreenConstants.EDIT_DETAILS,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
                child: Text(
                  MyProfileScreenConstants.NAME_LABEL,
                  style: TextStyle(
                    color: AppColors.textColor7,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                width: ScreenUtil().screenWidth,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(
                    10.r,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowColor,
                      blurRadius: 2.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: Text(
                    "Dr. Rachel Green",
                    style: TextStyle(
                      color: AppColors.textColor8,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
                child: Text(
                  MyProfileScreenConstants.PHONE_LABEL,
                  style: TextStyle(
                    color: AppColors.textColor7,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                width: ScreenUtil().screenWidth,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(
                    10.r,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowColor,
                      blurRadius: 2.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: Text(
                    "1-800-555-1234",
                    style: TextStyle(
                      color: AppColors.textColor8,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
                child: Text(
                  MyProfileScreenConstants.EMAIL_LABEL,
                  style: TextStyle(
                    color: AppColors.textColor7,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                width: ScreenUtil().screenWidth,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(
                    10.r,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowColor,
                      blurRadius: 2.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: Text(
                    "rachelgreen@nihmss.com",
                    style: TextStyle(
                      color: AppColors.textColor8,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
                child: Text(
                  MyProfileScreenConstants.PRACTITIONER_ID_LABEL,
                  style: TextStyle(
                    color: AppColors.textColor7,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                width: ScreenUtil().screenWidth,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(
                    10.r,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowColor,
                      blurRadius: 2.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: Text(
                    "WERTY26464YY",
                    style: TextStyle(
                      color: AppColors.textColor8,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
                child: Text(
                  MyProfileScreenConstants.ADDRESS_LABEL,
                  style: TextStyle(
                    color: AppColors.textColor7,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                width: ScreenUtil().screenWidth,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(
                    10.r,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowColor,
                      blurRadius: 2.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: Text(
                    "1234 Health St., Med City, State 56789, USA",
                    style: TextStyle(
                      color: AppColors.textColor8,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
