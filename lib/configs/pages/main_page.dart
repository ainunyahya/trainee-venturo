import 'package:get/route_manager.dart';
import 'package:trainee/configs/routes/main_route.dart';
import 'package:trainee/modules/features/bottom_navbar/bindings/bottom_navbar_binding.dart';
import 'package:trainee/modules/features/detail_menu/views/ui/detail_menu_view.dart';
import 'package:trainee/modules/features/forgot_password/bindings/forgot_password_binding.dart';
import 'package:trainee/modules/features/forgot_password/bindings/otp_binding.dart';
import 'package:trainee/modules/features/forgot_password/views/ui/forgot_password_view.dart';
import 'package:trainee/modules/features/forgot_password/views/ui/otp_view.dart';
import 'package:trainee/modules/features/list/bindings/list_binding.dart';
import 'package:trainee/modules/features/list/views/ui/list_item_view.dart';
import 'package:trainee/modules/features/list/views/ui/pesanan_view.dart';
import 'package:trainee/modules/features/list/views/ui/profile_view.dart';
import 'package:trainee/modules/features/no_connection/views/ui/no_connection_view.dart';
import 'package:trainee/modules/features/sign_in/bindings/sign_in_binding.dart';
import 'package:trainee/modules/features/sign_in/views/ui/sign_in_view.dart';
import 'package:trainee/modules/features/splash_screen/bindings/splash_screen_binding.dart';
import 'package:trainee/modules/features/splash_screen/view/ui/splash_screen.dart';

import '../../modules/features/bottom_navbar/views/ui/bottom_navbar.dart';
import '../../modules/features/detail_promo/views/ui/detail_promo_view.dart';
import '../../modules/features/initial/bindings/initial_binding.dart';
import '../../modules/features/initial/views/ui/get_location_screen.dart';

abstract class MainPage {
  static final main = [
    /// Setup
    GetPage(
      name: MainRoute.initial,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: MainRoute.noConnection,
      page: () => const NoConnectionView(),
    ),
    GetPage(
      name: MainRoute.signIn,
      page: () => const SignInView(),
      binding: SignInBindding(),
    ),
    GetPage(
      name: MainRoute.forgotPassword,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: MainRoute.otpPassword,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: MainRoute.getLocationScreen,
      page: () => const GetLocationScreen(),
      binding: GetInitialBinding(),
    ),
    // GetPage(
    //   name: MainRoute.counter,
    //   page: () => const ConterView(),
    //   binding: ConterBindding(),
    // ),
    GetPage(
      name: MainRoute.bottomNavBar,
      page: () => const BottomNavbar(),
      binding: BottomNavbarBinding(),
    ),
    GetPage(
      name: MainRoute.list,
      page: () => const ListItemView(),
      binding: ListBinding(),
    ),
    GetPage(
      name: MainRoute.pesanan,
      page: () => const PesananView(),
      // binding: ListBinding(),
    ),
    GetPage(
      name: MainRoute.profile,
      page: () => const ProfileView(),
      // binding: ListBinding(),
    ),
    GetPage(
      name: MainRoute.detailPromo,
      page: () => const PromoDetailView(),
      // binding: ListBinding(),
    ),
    GetPage(
      name: MainRoute.detailMenu,
      page: () => const DetailMenuView(),
      // binding: ListBinding(),
    ),
  ];
}
