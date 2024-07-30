import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_connect/common_widgets/grid_list_widget.dart';
import 'package:pharma_connect/screens/dashboard/data/medicine_data.dart';
import 'package:pharma_connect/screens/dashboard/view/pages/cart.dart';
import 'package:pharma_connect/screens/order_item/view/order_item_screen.dart';

import 'package:pharma_connect/utils/app_color.dart';
import 'package:pharma_connect/utils/app_constants.dart';
import 'package:pharma_connect/utils/app_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int currentPage = 0;

  List<String> images = [
    AppImages.sliderImage,
    AppImages.sliderImage,
    AppImages.sliderImage
  ];

  List<Medicines> medicine = [
    Medicines(
      productId: 1,
      imageUrl: AppImages.bp_monitor_img,
      containerColor: AppColors.peachColor,
      textBgcolor: AppColors.darkPeachColor,
      titles: MyHomeScreenConstants.REVITAL_TITLE,
      specifications: [
        "It has a portable design which makes it easy to carry anywhere at any time",
        "It has an automatic shutdown function which saves power",
        "It can support 2 users at a time with 120 memories each",
        "It helps to measure irregular heartbeat as well",
        "It comes with a large LED display",
        "It has dual power modes i.e. it is chargeable with a USB power source or it can be powered with 4 AA alkaline batteries",
        "It has an average value function that helps to analyze blood pressure variation",
        "It has a one-button easy operation",
      ],
      directionsForUse: "Use as directed on the label",
      safetyInfo: [
        "Store in a cool and dry place away from direct sunlight.",
        "Read the product manual carefully before use.",
        "Keep out of reach of children.",
      ],
      productInfo:
          "Dr. Odin BPCBOA 3H Blood Pressure Machine is a fully automatic digital blood pressure monitor device that enables a high-speed and reliable measurement of systolic and diastolic blood pressure as well as the pulse through the oscillometric method.",
      uses: "It is used for measuring the blood pressure of individuals.",
      units: 12,
    ),
    Medicines(
      productId: 2,
      imageUrl: AppImages.accu_chek_img,
      containerColor: AppColors.yellowColor,
      textBgcolor: AppColors.darkYellowColor,
      titles: MyHomeScreenConstants.ORG_TITLE,
      specifications: [
        "It has a portable design which makes it easy to carry anywhere at any time",
        "It has an automatic shutdown function which saves power",
        "It can support 2 users at a time with 120 memories each",
        "It helps to measure irregular heartbeat as well",
        "It comes with a large LED display",
        "It has dual power modes i.e. it is chargeable with a USB power source or it can be powered with 4 AA alkaline batteries",
        "It has an average value function that helps to analyze blood pressure variation",
        "It has a one-button easy operation",
      ],
      directionsForUse: "Use as directed on the label",
      safetyInfo: [
        "Store in a cool and dry place away from direct sunlight.",
        "Read the product manual carefully before use.",
        "Keep out of reach of children.",
      ],
      productInfo:
          "Dr. Odin BPCBOA 3H Blood Pressure Machine is a fully automatic digital blood pressure monitor device that enables a high-speed and reliable measurement of systolic and diastolic blood pressure as well as the pulse through the oscillometric method.",
      uses: "It is used for measuring the blood pressure of individuals.",
      units: 12,
    ),
    Medicines(
      productId: 3,
      imageUrl: AppImages.revital_img,
      containerColor: AppColors.blueColor,
      textBgcolor: AppColors.darkBlueColor,
      titles: MyHomeScreenConstants.BP_MONITOR_TITLE,
      specifications: [
        "It has a portable design which makes it easy to carry anywhere at any time",
        "It has an automatic shutdown function which saves power",
        "It can support 2 users at a time with 120 memories each",
        "It helps to measure irregular heartbeat as well",
        "It comes with a large LED display",
        "It has dual power modes i.e. it is chargeable with a USB power source or it can be powered with 4 AA alkaline batteries",
        "It has an average value function that helps to analyze blood pressure variation",
        "It has a one-button easy operation",
      ],
      directionsForUse: "Use as directed on the label",
      safetyInfo: [
        "Store in a cool and dry place away from direct sunlight.",
        "Read the product manual carefully before use.",
        "Keep out of reach of children.",
      ],
      productInfo:
          "Dr. Odin BPCBOA 3H Blood Pressure Machine is a fully automatic digital blood pressure monitor device that enables a high-speed and reliable measurement of systolic and diastolic blood pressure as well as the pulse through the oscillometric method.",
      uses: "It is used for measuring the blood pressure of individuals.",
      units: 12,
    ),
    Medicines(
      productId: 4,
      imageUrl: AppImages.org_img,
      containerColor: AppColors.greenColor,
      textBgcolor: AppColors.darkGreenColor,
      titles: MyHomeScreenConstants.ODIN_BP_MONITOR_TITLE,
      specifications: [
        "It has a portable design which makes it easy to carry anywhere at any time",
        "It has an automatic shutdown function which saves power",
        "It can support 2 users at a time with 120 memories each",
        "It helps to measure irregular heartbeat as well",
        "It comes with a large LED display",
        "It has dual power modes i.e. it is chargeable with a USB power source or it can be powered with 4 AA alkaline batteries",
        "It has an average value function that helps to analyze blood pressure variation",
        "It has a one-button easy operation",
      ],
      directionsForUse: "Use as directed on the label",
      safetyInfo: [
        "Store in a cool and dry place away from direct sunlight.",
        "Read the product manual carefully before use.",
        "Keep out of reach of children.",
      ],
      productInfo:
          "Dr. Odin BPCBOA 3H Blood Pressure Machine is a fully automatic digital blood pressure monitor device that enables a high-speed and reliable measurement of systolic and diastolic blood pressure as well as the pulse through the oscillometric method.",
      uses: "It is used for measuring the blood pressure of individuals.",
      units: 12,
    ),
    Medicines(
      productId: 5,
      imageUrl: AppImages.bp_monitor_img,
      containerColor: AppColors.peachColor,
      textBgcolor: AppColors.darkPeachColor,
      titles: MyHomeScreenConstants.REVITAL_TITLE,
      specifications: [
        "It has a portable design which makes it easy to carry anywhere at any time",
        "It has an automatic shutdown function which saves power",
        "It can support 2 users at a time with 120 memories each",
        "It helps to measure irregular heartbeat as well",
        "It comes with a large LED display",
        "It has dual power modes i.e. it is chargeable with a USB power source or it can be powered with 4 AA alkaline batteries",
        "It has an average value function that helps to analyze blood pressure variation",
        "It has a one-button easy operation",
      ],
      directionsForUse: "Use as directed on the label",
      safetyInfo: [
        "Store in a cool and dry place away from direct sunlight.",
        "Read the product manual carefully before use.",
        "Keep out of reach of children.",
      ],
      productInfo:
          "Dr. Odin BPCBOA 3H Blood Pressure Machine is a fully automatic digital blood pressure monitor device that enables a high-speed and reliable measurement of systolic and diastolic blood pressure as well as the pulse through the oscillometric method.",
      uses: "It is used for measuring the blood pressure of individuals.",
      units: 12,
    ),
    Medicines(
      productId: 6,
      imageUrl: AppImages.accu_chek_img,
      containerColor: AppColors.yellowColor,
      textBgcolor: AppColors.darkYellowColor,
      titles: MyHomeScreenConstants.ORG_TITLE,
      specifications: [
        "It has a portable design which makes it easy to carry anywhere at any time",
        "It has an automatic shutdown function which saves power",
        "It can support 2 users at a time with 120 memories each",
        "It helps to measure irregular heartbeat as well",
        "It comes with a large LED display",
        "It has dual power modes i.e. it is chargeable with a USB power source or it can be powered with 4 AA alkaline batteries",
        "It has an average value function that helps to analyze blood pressure variation",
        "It has a one-button easy operation",
      ],
      directionsForUse: "Use as directed on the label",
      safetyInfo: [
        "Store in a cool and dry place away from direct sunlight.",
        "Read the product manual carefully before use.",
        "Keep out of reach of children.",
      ],
      productInfo:
          "Dr. Odin BPCBOA 3H Blood Pressure Machine is a fully automatic digital blood pressure monitor device that enables a high-speed and reliable measurement of systolic and diastolic blood pressure as well as the pulse through the oscillometric method.",
      uses: "It is used for measuring the blood pressure of individuals.",
      units: 12,
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: EdgeInsets.all(3),
        width: 7.w,
        height: 7.h,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.dotUnselectedColor, width: 1.w),
            color: currentIndex == index
                ? AppColors.white
                : AppColors.dotUnselectedColor,
            shape: BoxShape.circle),
      );
    });
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (images.isNotEmpty) ...[
            SizedBox(
              height: 180.h,
              width: ScreenUtil().screenWidth,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 10.h,
                ),
                child: CarouselSlider(
                  options: CarouselOptions(
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      viewportFraction: 1,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 2),
                      onPageChanged: (value, _) {
                        setState(() {
                          currentPage = value;
                        });
                      }),
                  items: List.generate(
                    images.length ?? 0,
                    (index) => Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          10.r,
                        ),
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.cover,
                          width: ScreenUtil().screenWidth,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(images.length, currentPage),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
            ),
            child: Text(
              MyHomeScreenConstants.DRUG_HEADING_TEXT,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
            ),
            child: Text(
              MyHomeScreenConstants.DRUG_SUB_TEXT,
              style: TextStyle(
                color: AppColors.textColor3,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
            ),
          ),
          // Text(
          //   "Home",
          //   style: TextStyle(
          //     color: AppColors.themeColor,
          //     fontWeight: FontWeight.w500,
          //     fontSize: 12.sp,
          //   ),

          // ),
          GridListWidget(
            onTapItem: () {
              print("ontap- home ");

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => OrderItemScreen(
                    onTapItem: () {},
                    title: medicine[1].titles,
                    image: medicine[1].imageUrl,
                    productInfo: medicine[1].productInfo,
                    uses: medicine[1].uses,
                    specifications: medicine[1].specifications,
                    directionsForUse: medicine[1].directionsForUse,
                    units: medicine[1].units,
                    directionForUse: medicine[1].directionsForUse,
                    safetyIndo: medicine[1].safetyInfo,
                  ),
                ),
              );
            },
            medicine: medicine,
          ),
        ],
      ),
    );
  }
}
