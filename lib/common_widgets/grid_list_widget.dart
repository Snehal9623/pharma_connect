import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_connect/screens/dashboard/data/medicine_data.dart';
import 'package:pharma_connect/utils/app_color.dart';
import 'package:pharma_connect/utils/app_constants.dart';

class GridListWidget extends StatefulWidget {
  final Function onTapItem;

  final List<Medicines> medicine;

  const GridListWidget(
      {Key? key, required this.onTapItem, required this.medicine})
      : super(key: key);

  @override
  State<GridListWidget> createState() => _GridListWidgetState();
}

class _GridListWidgetState extends State<GridListWidget> {
  bool completed = false;
  int selectedCard = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 5.h,
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10),
          itemCount: widget.medicine.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                  vertical: 5.h,
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: widget.medicine[index].containerColor,
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
                                    color: widget.medicine[index].textBgcolor),
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
                              widget.medicine[index].imageUrl,
                              height: 46.h,
                              width: 115.w,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              widget.onTapItem();
                              setState(() {
                                selectedCard = index;
                              });
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
                    Text(
                      widget.medicine[index].titles,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor2),
                    )
                  ],
                ));
          },
        ),
      ),
    );
  }
}
