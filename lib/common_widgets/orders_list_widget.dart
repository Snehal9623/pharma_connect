import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_connect/screens/dashboard/data/order_data.dart';
import 'package:pharma_connect/utils/app_color.dart';
import 'package:pharma_connect/utils/app_constants.dart';
import 'package:pharma_connect/utils/app_images.dart';

class OrdersListWidget extends StatefulWidget {
  final Function onTapItem;
  final List<Order> orders;

  const OrdersListWidget({
    Key? key,
    required this.onTapItem,
    required this.orders,
  }) : super(key: key);

  @override
  State<OrdersListWidget> createState() => _OrdersListWidgetState();
}

class _OrdersListWidgetState extends State<OrdersListWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTapItem();
      },
      child: ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: widget.orders.length,
        scrollDirection: Axis.vertical,
        // shrinkWrap: true,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 15.w,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
                color: AppColors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 10.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order: #${widget.orders[index].orderId}',
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor4,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_outlined,
                          color: AppColors.arrowBlueColor,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 2.h,
                    decoration: BoxDecoration(color: AppColors.dividerColor),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 10.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.yellowColor,
                              borderRadius: BorderRadius.circular(
                                5.r,
                              )),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.w,
                              vertical: 5.h,
                            ),
                            child: Image.asset(
                              widget.orders[index].imageUrl,
                              height: 22.h,
                              width: 30.w,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 5.h,
                            horizontal: 10.w,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: widget.orders[index].status ==
                                              "Delivered"
                                          ? MyOrderScreenConstants.DELIVERED
                                          : MyOrderScreenConstants.IN_TRANSIT,
                                      style: TextStyle(
                                        fontWeight:
                                            widget.orders[index].status ==
                                                    "Delivered"
                                                ? FontWeight.w400
                                                : FontWeight.w500,
                                        fontSize: 11.sp,
                                        color: widget.orders[index].status ==
                                                "Delivered"
                                            ? AppColors.greenStatusColor
                                            : AppColors.darkGreyColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: widget.orders[index].deliveryDate,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.h,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        5.r,
                                      ),
                                      border: Border.all(
                                        color: AppColors.lightGreyColor,
                                        width: 0.5.w,
                                      )),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 5.h,
                                      horizontal: 10.w,
                                    ),
                                    child: Text(
                                      widget.orders[index].numberOfItems,
                                      style: TextStyle(
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        if (widget.orders[index].status == "In transit") ...[
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 20.h,
                              horizontal: 10.w,
                            ),
                            child: Text(
                              MyOrderScreenConstants.TRACK_ORDER,
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textColor5,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
