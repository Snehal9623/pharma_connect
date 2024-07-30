import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_connect/screens/dashboard/view/pages/cart.dart';
import 'package:pharma_connect/screens/dashboard/view/pages/home.dart';
import 'package:pharma_connect/screens/dashboard/view/pages/orders.dart';
import 'package:pharma_connect/screens/dashboard/view/pages/profile.dart';
import 'package:pharma_connect/utils/app_color.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key,
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool selectedIcon = false;

  final _controller = PageController(
    initialPage: 0,
  );
  var _bottomNavIndex = 0; // default index of first screen

  int direction = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _bottomNavIndex,
        elevation: 15,
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.selectedMenuColor,
        unselectedItemColor: AppColors.unselectedMenuColor,
        selectedLabelStyle: TextStyle(
          color: AppColors.selectedMenuColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          color: AppColors.unselectedMenuColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
        onTap: (index) {
          _controller.animateToPage(
            index,
            duration: const Duration(
              milliseconds: 200,
            ),
            curve: Curves.bounceOut,
          );
        },
        items: const [
          BottomNavigationBarItem(
            // title: Text('Favorites'),
            icon: Icon(
              Icons.home_filled,
            ),

            label: "Home",
          ),
          BottomNavigationBarItem(
            label: "My Orders",
            icon: Icon(
              Icons.save,
            ),
          ),
          BottomNavigationBarItem(
            label: "Cart",
            icon: Icon(Icons.shopping_cart),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.face),
          ),
        ],
      ),
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(
            () {
              _bottomNavIndex = index;
            },
          );
        },
        children: const [
          HomeScreen(),
          OrderScreen(),
          CartScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
