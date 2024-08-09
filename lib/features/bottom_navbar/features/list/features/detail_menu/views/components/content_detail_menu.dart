import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trainee/features/bottom_navbar/features/list/features/detail_menu/views/components/custom_devider.dart';
import 'package:trainee/features/bottom_navbar/features/list/features/detail_menu/views/components/menu_option_row.dart';

import '../widgets/level_picker.dart';
import '../widgets/note_input.dart';
import '../widgets/topping_picker.dart';

class ContentDetailMenu extends StatefulWidget {
  const ContentDetailMenu({super.key});

  @override
  State<ContentDetailMenu> createState() => _ContentDetailMenuState();
}

class _ContentDetailMenuState extends State<ContentDetailMenu> {
  String selectedLevel = '';
  String selectedTopping = '';
  String note = '';

  void _showLevelPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return LevelPicker(
          selectedLevel: selectedLevel,
          onLevelSelected: (level) {
            setState(() {
              selectedLevel = level;
            });
          },
        );
      },
    );
  }

  void _showToppingPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return ToppingPicker(
          selectedTopping: selectedTopping,
          onToppingSelected: (topping) {
            setState(() {
              selectedTopping = topping;
            });
          },
        );
      },
    );
  }

  void _showNoteInput(BuildContext context) {
  TextEditingController noteController = TextEditingController();
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8, // Set height to 80% of the screen
        ),
        child: NoteInput(
          noteController: noteController,
          onSave: () {
            // Handle save action
            Navigator.pop(context);
          },
        ),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> menu = Get.arguments;
    final RxInt quantity = 0.obs;
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 25.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.r),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(111, 24, 24, 24),
            blurRadius: 15,
            spreadRadius: -1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          Row(
            children: [
              Text(
                menu['name'],
                style: const TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.bold
                ),
              ),
              const Spacer(), // Spacer untuk mengisi ruang antara teks dan Obx
              // quantity control
              Obx(() {
                return quantity.value == 0
                  ? IconButton(
                      icon: Icon(Icons.add, size: 20.w),
                      onPressed: () {
                        quantity.value++;
                      },
                    )
                  : Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove, size: 20.w),
                          onPressed: () {
                            if (quantity.value > 0) {
                              quantity.value--;
                            }
                          },
                        ),
                        Text(
                          '${quantity.value}',
                          style: Get.textTheme.bodyMedium,
                        ),
                        IconButton(
                          icon: Icon(Icons.add, size: 20.w),
                          onPressed: () {
                            quantity.value++;
                          },
                        ),
                      ],
                    );
              }),
            ],
          ),
          SizedBox(
            width: 280,
            child: Text(
              menu['deskripsi'],
              style: const TextStyle(
                fontSize: 12, 
                fontWeight: FontWeight.w400
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 30),
          const CustomDivider(
            color: Colors.grey, 
            thickness: 0.5, // Ketebalan divider
            indent: 0, // Jarak dari awal
            endIndent: 0, // Jarak dari akhir
          ),
          Row(
            children: [
              const Icon(
                Icons.money
              ),
              const SizedBox(width: 8),
              const Text(
                'Harga',
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.w600
                ),
              ),
              const Spacer(),
              Text(
                'Rp ${menu['harga']}',
                style: const TextStyle(
                  color: Color(0xFF009AAD),
                  fontSize: 18, 
                  fontWeight: FontWeight.w700
                ),
              ),
            ],
          ),
          const CustomDivider(
            color: Colors.grey,
            thickness: 0.5,
            indent: 0,
            endIndent: 0,
          ),
          MenuOptionRow(
            icon: Icons.local_fire_department,
            title: 'Level',
            value: selectedLevel.isEmpty ? '' : selectedLevel,
            onTap: () => _showLevelPicker(context),
          ),
          const CustomDivider(
            color: Colors.grey,
            thickness: 0.5,
            indent: 0,
            endIndent: 0,
          ),
          MenuOptionRow(
            icon: Icons.restaurant,
            title: 'Topping',
            value: selectedTopping.isEmpty ? '' : selectedTopping,
            onTap: () => _showToppingPicker(context),
          ),
          const CustomDivider(
            color: Colors.grey,
            thickness: 0.5,
            indent: 0,
            endIndent: 0,
          ),
          MenuOptionRow(
            icon: Icons.note,
            title: 'Catatan',
            value: note.isEmpty ? '' : note,
            onTap: () => _showNoteInput(context),
          ),
          const CustomDivider(
            color: Colors.grey,
            thickness: 0.5,
            indent: 0,
            endIndent: 0,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                WidgetStateProperty.all<Color>(const Color(0xFF009AAD)),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
              minimumSize: WidgetStateProperty.all<Size>(
                const Size(double.infinity, 50),
              ),
            ),
            onPressed: () {
                  
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Tambahkan Ke Pesanan",
                  style: TextStyle(
                  color: Colors.white,
                    fontSize: 18, 
                    fontWeight: FontWeight.w700
                  ),
                ),
                Container(
                  width: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}