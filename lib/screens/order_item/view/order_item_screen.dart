import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_connect/screens/dashboard/data/medicine_data.dart';
import 'package:pharma_connect/utils/app_color.dart';
import 'package:pharma_connect/utils/app_constants.dart';
import 'package:pharma_connect/utils/app_images.dart';

class OrderItemScreen extends StatefulWidget {
  final Function onTapItem;
  final String title;
  final String image;
  final String productInfo;
  final String uses;
  final List<String> specifications;
  final String directionForUse;
  final List<String> safetyIndo;
  final String directionsForUse;
  final int units;

  const OrderItemScreen({
    Key? key,
    required this.onTapItem,
    required this.title,
    required this.image,
    required this.productInfo,
    required this.uses,
    required this.specifications,
    required this.directionsForUse,
    required this.units,
    required this.directionForUse,
    required this.safetyIndo,
  }) : super(key: key);
  @override
  State<OrderItemScreen> createState() => _OrderItemScreenState();
}

class _OrderItemScreenState extends State<OrderItemScreen> {
  late PageController _pageController;
  int activePage = 1;
  bool isExpanded = false;
  int itemIndex = 0;
  int currentPage = 0;

  List<int> numberOfItems = [];
  List<String> images = [
    AppImages.bp_monitor_img,
    AppImages.bp_monitor_img,
    AppImages.bp_monitor_img
  ];

  void addItems() {
    numberOfItems.add(1);
    numberOfItems.add(2);
    numberOfItems.add(3);
    numberOfItems.add(4);
    numberOfItems.add(5);
  }

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
    addItems();
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
      backgroundColor: AppColors.offWhiteBgColor,
      appBar: AppBar(
        titleSpacing: 0,
        automaticallyImplyLeading: false,
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
                Container(
                  child: Row(
                    children: [
                      GestureDetector(
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColors.white,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                        ),
                        child: Flexible(
                          child: Container(
                            width: ScreenUtil().screenWidth - 150.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                            ),
                            child: Text(
                              widget.title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16.sp,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (images.isNotEmpty) ...[
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20.h,
                  horizontal: 20.w,
                ),
                child: Container(
                  height: 200.h,
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
                            height: 180.h,
                            width: ScreenUtil().screenWidth,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicators(images.length, currentPage),
              ),
            ],
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
              ),
              child: Text(
                widget.title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
              ),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "FREE",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: AppColors.textColor9),
                        ),
                        TextSpan(
                          text: " Sample",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: AppColors.textColor9,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.lightGreenColor,
                          borderRadius: BorderRadius.circular(
                            10.r,
                          )),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 11.w,
                          vertical: 3.h,
                        ),
                        child: Text(
                          "TRIAL",
                          style: TextStyle(
                            color: AppColors.containerGreenColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 9.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              width: ScreenUtil().screenWidth,
              decoration: BoxDecoration(
                  color: AppColors.lightBlueColor,
                  border: Border.all(
                    color: AppColors.blueBorderColor,
                    width: 1.w,
                  )),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.h,
                  ),
                  child: Text(
                    "Maximum of 12 unit can be added in the cart.",
                    style: TextStyle(
                      color: AppColors.textColor10,
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
              ),
              decoration: BoxDecoration(color: AppColors.white),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      MyOrderItemScreenConstants.PRODUCT_INFO_TEXT,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.h,
                      ),
                      child: Text(
                        widget.productInfo,
                        style: TextStyle(
                          color: AppColors.textColor11,
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                    Text(
                      MyOrderItemScreenConstants.USES,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 10.sp,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 1.h,
                      ),
                      child: Text(
                        widget.uses,
                        style: TextStyle(
                          color: AppColors.textColor11,
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                    if (isExpanded) ...[
                      Text(
                        MyOrderItemScreenConstants.FEATURES_HEADING,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sp,
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.specifications.map((strone) {
                            return Row(children: [
                              Text(
                                "\u2022",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textColor11,
                                ),
                              ), //bullet text
                              SizedBox(
                                width: 10,
                              ), //space between bullet and text
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 1.h,
                                  ),
                                  child: Text(
                                    strone,
                                    style: TextStyle(
                                      color: AppColors.textColor11,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ),
                              )
                            ]);
                          }).toList(),
                        ),
                      ),
                      Text(
                        MyOrderItemScreenConstants.DIRECTION_FOR_USE,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sp,
                        ),
                      ),
                      Text(
                        widget.directionsForUse,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                        ),
                      ),
                      Text(
                        MyOrderItemScreenConstants.SAFETY_INFO,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sp,
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.safetyIndo.map((text) {
                            return Row(children: [
                              Text(
                                "\u2022",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textColor11,
                                ),
                              ), //bullet text
                              SizedBox(
                                width: 10,
                              ), //space between bullet and text
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 1.h,
                                  ),
                                  child: Text(
                                    text,
                                    style: TextStyle(
                                      color: AppColors.textColor11,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ),
                              )
                            ]);
                          }).toList(),
                        ),
                      ),
                    ],
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              isExpanded
                                  ? MyOrderItemScreenConstants.VIEW_LESS
                                  : MyOrderItemScreenConstants.VIEW_MORE,
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.blue,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 2.h,
              ),
              child: Text(
                MyOrderItemScreenConstants.ESPECIALLY_FOR_YOU,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
              ),
              child: Text(
                MyOrderItemScreenConstants.LIST_OF_DRUGS,
                style: TextStyle(
                  color: AppColors.textColor3,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 10.h,
              ),
              child: Container(
                height: 200.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: medicine.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                        vertical: 5.h,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 130.h,
                            width: 163.w,
                            decoration: BoxDecoration(
                              color: medicine[index].containerColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(
                                  30.r,
                                ),
                                bottomLeft: Radius.circular(
                                  30.r,
                                ),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 6.h,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(
                                              10.r,
                                            ),
                                            bottomRight: Radius.circular(
                                              10.r,
                                            ),
                                          ),
                                          color: medicine[index].textBgcolor),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 5.h,
                                          horizontal: 5.w,
                                        ),
                                        child: Text(
                                          MyHomeScreenConstants.UNITS_TEXT,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11.sp,
                                            color: AppColors.unitsTextColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 2.h,
                                  ),
                                  child: Image.asset(
                                    medicine[index].imageUrl,
                                    height: 46.h,
                                    width: 115.w,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    widget.onTapItem();
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5.w,
                                      vertical: 5.h,
                                    ),
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.containerGreenColor,
                                          borderRadius: BorderRadius.circular(
                                            4.r,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 5.h,
                                            horizontal: 5.w,
                                          ),
                                          child: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: AppColors.white,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 163.w,
                              child: Text(
                                medicine[index].titles,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textColor2),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
              height: 50.h,
              decoration: BoxDecoration(color: AppColors.white, boxShadow: [
                BoxShadow(
                    color: AppColors.shadowColor2,
                    blurRadius: 8,
                    spreadRadius: 0,
                    offset: Offset(1, 0))
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 5.h,
                    ),
                    child: _shoppingItem(itemIndex),
                  ),
                  Container(
                      height: 50.h,
                      width: ScreenUtil().screenWidth - 130.w,
                      decoration:
                          BoxDecoration(color: AppColors.containerGreenColor),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              MyOrderItemScreenConstants.PLACE_ORDER,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: AppColors.white),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: AppColors.white,
                                  size: 10,
                                ))
                          ],
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

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
  Widget _shoppingItem(int itemIndex) {
    return Container(
      height: 36.h,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.counterBoxColor),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(
            5.r,
          )),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 1.w,
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment,
          children: [
            _decrementButton(itemIndex),
            Text(
              '${numberOfItems[itemIndex]}',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            _incrementButton(itemIndex),
          ],
        ),
      ),
    );
  }

  Widget _decrementButton(int index) {
    return IconButton(
      onPressed: () {
        setState(() {
          if (numberOfItems[index] > 0) {
            numberOfItems[index]--;
          }
        });
      },
      icon: const Icon(
        CupertinoIcons.minus,
        color: Colors.black,
        size: 15,
      ),
    );
  }

  Widget _incrementButton(int index) {
    return IconButton(
      onPressed: () {
        setState(() {
          if (numberOfItems[index] < 12) {
            numberOfItems[index]++;
          }
        });
      },
      icon: const Icon(
        CupertinoIcons.add,
        color: Colors.black,
        size: 15,
      ),
    );
  }
}
