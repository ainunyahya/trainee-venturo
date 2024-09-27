import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:trainee/features/bottom_navbar/features/list/models/menu_model.dart';
import 'package:trainee/features/bottom_navbar/features/list/models/promo_model.dart';
import 'package:trainee/features/bottom_navbar/features/list/repositories/menu_repository.dart';
import 'package:trainee/features/bottom_navbar/features/list/repositories/promo_repository.dart';

class ListController extends GetxController {
  static ListController get to => Get.find<ListController>();
  final RxInt page = 0.obs;
  final RxList<PromoModel> promoItems = <PromoModel>[].obs;
  final RxList<MenuModel> menuItems = <MenuModel>[].obs;
  final RxList<MenuModel> selectedItems = <MenuModel>[].obs;
  final RxBool canLoadMore = true.obs;
  final RxString selectedCategory = 'Semua Makanan'.obs;
  final RxString keyword = ''.obs;
  final List<String> categories = [
    'Semua Makanan',
    'Makanan',
    'Minuman',
    'Snack',
  ];
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  void onInit() async {
    super.onInit();
    await getAllMenus();
    await getAllPromos();
    // await getListOfData();
  }

  void onRefresh() async {
    try {
      await getAllMenus();
      refreshController.refreshCompleted();
    } catch (exception, stacktrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stacktrace,
      );
      refreshController.refreshFailed();
    }
  }

  // ======== MENU Section ===========
  Future<void> getAllMenus() async {
    try {
      AllMenuAPIModel menus = await MenuRepository.getAllMenu();
      // print("menus: ${menus.toString()}");
      menuItems.value = menus.dataMenus!;
      // print("menuItems: $menuItems");
      refreshController.loadComplete();
    } catch (exception, stacktrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stacktrace,
      );
      refreshController.loadFailed();
    }
  }

  List<MenuModel> get filteredMenuList {
    return menuItems.where((item) {
      if (selectedCategory.value.toLowerCase() == 'semua makanan') {
        return true;
      } else if (selectedCategory.value.toLowerCase() == 'makanan') {
        return item.kategori == KategoriMenu.MAKANAN;
      } else if (selectedCategory.value.toLowerCase() == 'minuman') {
        return item.kategori == KategoriMenu.MINUMAN;
      } else if (selectedCategory.value.toLowerCase() == 'snack') {
        return item.kategori == KategoriMenu.SNACK;
      }
      return false;
    }).toList();
  }

  Future<void> deleteMenuItem(MenuModel item) async {
    try {
      menuItems.remove(item);
      selectedItems.remove(item);
    } catch (exception, stacktrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stacktrace,
      );
    }
  }

  // ======== Promo Section ===========
  Future<void> getAllPromos() async {
    try {
      // print("Get All Promos");
      AllPromoAPIModel promos = await PromoRepository.getAllPromo();
      // print("tesss======== " + promos.dataPromos.toString());
      promoItems.value = promos.dataPromos!;
    } catch (exception, stacktrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stacktrace,
      );
    }
  }
}
