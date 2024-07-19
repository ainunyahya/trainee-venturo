import 'package:get/route_manager.dart';
import 'package:trainee/configs/routes/main_route.dart';
import 'package:trainee/modules/features/counter/binddings/conter_bindding.dart';
import 'package:trainee/modules/features/counter/views/ui/conter_view.dart';
import 'package:trainee/modules/features/no_connection/ui/no_connection_view.dart';
import 'package:trainee/modules/features/splash_screen/splash_screen.dart';

abstract class MainPage {
  static final main = [
    /// Setup
    GetPage(
      name: MainRoute.initial,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: MainRoute.noConnection,
      page: () => const NoConnectionView(),
    ),
    GetPage(
      name: MainRoute.counter,
      page: () => const ConterView(),
      binding: ConterBindding(),
    ),
  ];
}
