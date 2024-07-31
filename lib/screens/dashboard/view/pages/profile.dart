import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
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
  late DatabaseReference dbRef;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final idController = TextEditingController();
  final addressController = TextEditingController();
  var nameValue = "";
  var phoneValue = "";
  var emailValue = "";
  var idValue = "";
  var addressValue = "";
  var keyValue = "";

  @override
  void initState() {
    dbRef = FirebaseDatabase.instance.ref().child('pharma_users');
    // createRecord();
    readData();
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
      body: SingleChildScrollView(
        child: Padding(
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
                                nameValue == ""
                                    ? "No data present in DB"
                                    : nameValue,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: AppColors.textColor6,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  updateData();
                                },
                                child: Container(
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
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
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
                      ),
                      child: TextField(
                        controller: nameController,
                        autofocus: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: AppColors.textColor8,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          hintText: nameValue == "" ? "User Name" : nameValue,
                        ),
                      )),
                  // Text(
                  //   "Dr. Rachel Green",
                  //   style: TextStyle(
                  //     color: AppColors.textColor8,
                  //     fontSize: 14.sp,
                  //     fontWeight: FontWeight.w400,
                  //   ),
                  // ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
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
                      ),
                      child: TextField(
                        controller: phoneController,
                        maxLength: 10,
                        autofocus: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: AppColors.textColor8,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            hintText: phoneValue == "" ? "Phone" : phoneValue,
                            counterText: ""),
                      )),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
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
                      ),
                      child: TextField(
                        controller: emailController,
                        autofocus: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: AppColors.textColor8,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          hintText: emailValue == "" ? "Email" : emailValue,
                        ),
                      )),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
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
                      ),
                      child: TextField(
                        controller: idController,
                        autofocus: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: AppColors.textColor8,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          hintText: idValue == "" ? "Practitioner ID" : idValue,
                        ),
                      )),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
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
                      ),
                      child: TextField(
                        controller: addressController,
                        autofocus: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: AppColors.textColor8,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          hintText: addressValue == ""
                              ? "Billing Address"
                              : addressValue,
                        ),
                      )),
                ),
              ],
            )),
      ),
    );
  }

  void createRecord() {
    Map<String, String> pharma_users = {
      'name': 'John Doe',
      'phone': '1234567890',
      'email': 'johndoe@example.com',
      'id': '1234',
      'address': "Pune",
    };
    print(dbRef.push().set(pharma_users));

    dbRef.push().set(pharma_users);
  }

  void readData() {
    // DatabaseReference databaseReference =
    //     FirebaseDatabase.instance.ref().child('pharma_users');
    dbRef.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      Map values = dataSnapshot.value as Map;
      values.forEach((key, values) {
        setState(() {
          nameValue = values['name'];
          phoneValue = values['phone'];
          emailValue = values['email'];
          idValue = values['id'];
          addressValue = values['address'];
          keyValue = key;
        });
        print('Key: $key');
        print('Name: ${values['name']}');
        print('Email: ${values['email']}');
        print('Address: ${values['address']}');
        print('Id: ${values['id']}');
        print('phone: ${values['phone']}');
      });
    });
  }

  void updateData() {
    // DatabaseReference databaseReference =
    //     FirebaseDatabase.instance.ref().child('pharma_users');

    String recordKey = keyValue; // Replace with your record key

    dbRef.child(recordKey).update({
      'name': nameController.text,
      'phone': phoneController.text,
      'email': emailController.text,
      'id': idController.text,
      'address': addressController.text,
    });

    print("data updated");
  }
}
