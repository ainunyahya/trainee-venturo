import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainee/modules/features/list/views/ui/pesanan_view.dart';
import 'package:trainee/modules/features/list/views/ui/profile_view.dart';

import '../features/list/views/ui/list_item_view.dart';



class BottomNavbarController extends GetxController {
  var currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }
}

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavbarController controller = Get.put(BottomNavbarController());
    
    return Scaffold(
        body: Obx (() {
          return IndexedStack(
          index: controller.currentIndex.value,
          children:  const [
            // Routes to your views
            ListItemView(),
            PesananView(), // assuming OrdersView is a widget
            ProfileView(), // assuming ProfileView is a widget
          ],
        );
        }),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            controller.changeTab(index);
          //   switch (index) {
          //   case 0:
          //     Get.offNamed(MainRoute.list);
          //     break;
          //   case 1:
          //     Get.offNamed(MainRoute.pesanan);
          //     break;
          //   case 2:
          //     Get.offNamed(MainRoute.profile);
          //     break;
          // }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Pesanan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
        ),
      );
  }
}