import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_connect/common_widgets/orders_list_widget.dart';
import 'package:pharma_connect/screens/dashboard/data/order_data.dart';
import 'package:pharma_connect/utils/app_color.dart';
import 'package:pharma_connect/utils/app_constants.dart';
import 'package:pharma_connect/utils/app_images.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});
  @override
  State<OrderScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<OrderScreen> {
  bool gridItemSelected = false;
  int selectedGridIndex = -1;
  bool addToCartTap = false;
  bool orderNowTap = false;
  List<Order> orders = [
    Order(
      orderId: 123456,
      imageUrl: AppImages.bp_monitor_img,
      deliveryDate: "on 21 Apr, 24",
      numberOfItems: "+5 items",
      status: "Delivered",
    ),
    Order(
      orderId: 678901,
      imageUrl: AppImages.accu_chek_img,
      deliveryDate: "on 21 Apr, 24",
      numberOfItems: "+5 items",
      status: "In transit",
    ),
  ];
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
                  MyOrderScreenConstants.APP_BAR_TITLE,
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
          vertical: 10.h,
        ),
        child: OrdersListWidget(
          onTapItem: () {},
          orders: orders,
        ),
      ),
    );
  }
}
