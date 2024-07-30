import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:pharma_connect/app.dart';
import 'package:pharma_connect/utils/app_color.dart';

import 'package:pharma_connect/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  if (kReleaseMode) {
    /// Pass all uncaught "fatal" errors from the framework to Crashlytics
    // FlutterError.onError = (errorDetails) {

    //   FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    // };
    //
    // /// Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    // PlatformDispatcher.instance.onError = (error, stack) {
    //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    //   return true;
    // };
  }

  /// change status bar color
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.themeColor,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );

  // runApp(
  //   EasyLocalization(
  //     supportedLocales: const [Locale('en', 'US'), Locale('hi', 'IN')],
  //     path: 'assets/translations',
  //     fallbackLocale: const Locale('en', 'US'),
  //     child: const Main(),
  //   ),
  // );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(
            const App(),
          ));
}
