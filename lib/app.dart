import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:context_holder/context_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_connect/screens/dashboard/view/dashboard_screen.dart';
import 'package:pharma_connect/utils/app_color.dart';
import 'package:pharma_connect/utils/app_constants.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    configLoading();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ConnectivityAppWrapper(
          app: MaterialApp(
            navigatorKey: ContextHolder.key,
            debugShowCheckedModeBanner: false,
            title: AppName.APP_NAME,
            builder: EasyLoading.init(
              builder: (context, child) {
                return ConnectivityWidgetWrapper(
                  disableInteraction: true,
                  child: child!,
                );
              },
            ),
            theme: ThemeData(
              disabledColor: Colors.grey,
              fontFamily: 'Roboto',
            ),
            home: GestureDetector(
              child: child,
            ),
          ),
        );
      },
      child: const Dashboard(),
    );
  }

  void configLoading() {
    EasyLoading.instance
      // ..indicatorWidget = CustomLoaderWidget(message: "")
      ..indicatorType = EasyLoadingIndicatorType.fadingFour
      ..loadingStyle = EasyLoadingStyle.light
      ..maskColor = Colors.black26
      ..maskType = EasyLoadingMaskType.custom
      ..indicatorColor = AppColors.themeColor
      ..indicatorSize = 45.0
      ..backgroundColor = Colors.black26
      ..radius = 10.0
      ..userInteractions = true
      ..dismissOnTap = true;
  }
}
