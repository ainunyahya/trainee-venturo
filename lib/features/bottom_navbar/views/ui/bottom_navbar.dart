import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainee/features/bottom_navbar/features/list/views/ui/pesanan_view.dart';
import 'package:trainee/features/bottom_navbar/features/list/views/ui/profile_view.dart';

import '../../features/list/views/ui/list_item_view.dart';
import '../../controllers/bottom_navbar_controller.dart';

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
            PesananView(), 
            ProfileView(), 
          ],
        );
        }),
        bottomNavigationBar: Obx(() {
            return BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            backgroundColor: Colors.black, 
            onTap: (index) {
              controller.changeTab(index);
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
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
          );
        }),
      );
  }
}