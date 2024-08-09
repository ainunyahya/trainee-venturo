import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:trainee/features/bottom_navbar/features/list/models/menu_model.dart';
import 'package:trainee/features/bottom_navbar/features/list/models/promo_model.dart';
import 'package:trainee/features/bottom_navbar/features/list/repositories/menu_repository.dart';
import 'package:trainee/features/bottom_navbar/features/list/repositories/promo_repository.dart';



class ListController extends GetxController {
  static ListController get to => Get.find<ListController>();
  final RxInt page = 0.obs;
  final RxList<DataPromo> promoItems = <DataPromo>[].obs;
  final RxList<DataMenu> menuItems = <DataMenu>[].obs;
  final RxList<DataMenu> selectedItems = <DataMenu>[].obs;
  final RxBool canLoadMore = true.obs;
  final RxString selectedCategory = 'All'.obs;
  final RxString keyword = ''.obs;
  final List<String> categories = [
    'All',
    'Food',
    'Drink',
    'Snack',
  ];
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  void onInit() async {
    super.onInit();
    // print("tesssss1111111111");
    await getAllMenus();
    // print("tesssssttt");
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
      // print("get all menus");
      MenusModel menus = await MenuRepository.getAllMenu();
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

  List<DataMenu> get filteredMenuList {
    return menuItems.where((item) {
      if (selectedCategory.value.toLowerCase() == 'all') {
        return true;
      } else if (selectedCategory.value.toLowerCase() == 'food') {
        return item.kategori == KategoriMenu.MAKANAN;
      } else if (selectedCategory.value.toLowerCase() == 'drink') {
        return item.kategori == KategoriMenu.MINUMAN;
      } else if (selectedCategory.value.toLowerCase() == 'snack') {
        return item.kategori == KategoriMenu.SNACK;
      }
      return false;
    }).toList();
  }

  Future<void> deleteMenuItem(DataMenu item) async {
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
      PromosModel promos = await PromoRepository.getAllPromo();
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
