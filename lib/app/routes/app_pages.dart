import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/landingPage/bindings/landing_page_binding.dart';
import '../modules/landingPage/views/landing_page_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/oosMidik/bindings/oos_midik_binding.dart';
import '../modules/oosMidik/views/oos_midik_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/scanItem/bindings/scan_item_binding.dart';
import '../modules/scanItem/views/scan_item_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeView(),
        binding: HomeBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: _Paths.PROFILE,
        page: () => ProfileView(),
        binding: ProfileBinding(),
        transition: Transition.fadeIn),
    GetPage(
      name: _Paths.LANDING_PAGE,
      page: () => LandingPageView(),
      binding: LandingPageBinding(),
    ),
    GetPage(
      name: _Paths.OOS_MIDIK,
      page: () => OosMidikView(),
      binding: OosMidikBinding(),
    ),
    GetPage(
      name: _Paths.SCAN_ITEM,
      page: () => const ScanItemView(),
      binding: ScanItemBinding(),
    ),
  ];
}
