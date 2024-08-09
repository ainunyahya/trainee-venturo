import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:trainee/configs/pages/main_page.dart';
import 'package:trainee/configs/routes/main_route.dart';
import 'package:trainee/configs/themes/main_theme.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:trainee/shared/global_bindings/global_binding.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();

    /// Localstorage init
    await Hive.initFlutter();
    await Hive.openBox("venturo");


    /// Firebase init
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    /// Sentry init
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://86e887d5dc9744c090e86f9b303e8d44@o4505368078254080.ingest.sentry.io/4505368079499264';
        options.tracesSampleRate = 1.0;
      },
      appRunner: () => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Trainee Sekeleton',
          debugShowCheckedModeBanner: false,
          initialRoute: MainRoute.initial,
          theme: mainTheme,
          defaultTransition: Transition.native,
          getPages: MainPage.main,
          initialBinding: GlobalBinding(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
