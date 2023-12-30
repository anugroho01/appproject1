import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/infoDelivery/bindings/info_delivery_binding.dart';
import '../modules/infoDelivery/views/info_delivery_view.dart';
import '../modules/landingPage/bindings/landing_page_binding.dart';
import '../modules/landingPage/views/landing_page_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/oosMidik/bindings/oos_midik_binding.dart';
import '../modules/oosMidik/views/oos_midik_view.dart';
import '../modules/pageDriver/bindings/page_driver_binding.dart';
import '../modules/pageDriver/views/page_driver_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/scanItem/bindings/scan_item_binding.dart';
import '../modules/scanItem/views/scan_item_view.dart';
import '../modules/trackingDelivery/bindings/tracking_delivery_binding.dart';
import '../modules/trackingDelivery/views/tracking_delivery_view.dart';

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
        page: () => HomeView(),
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
    GetPage(
      name: _Paths.INFO_DELIVERY,
      page: () => InfoDeliveryView(),
      binding: InfoDeliveryBinding(),
    ),
    GetPage(
      name: _Paths.TRACKING_DELIVERY,
      page: () => TrackingDeliveryView(),
      binding: TrackingDeliveryBinding(),
    ),
    GetPage(
      name: _Paths.PAGE_DRIVER,
      page: () => PageDriverView(),
      binding: PageDriverBinding(),
    ),
  ];
}
