import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Content extends StatelessWidget implements PreferredSizeWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> arg = Get.arguments;
    
    return Container(
      // alignment: Alignment.center,
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                arg['promoName'],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 8),
              Text(
                "Discount: ${arg['discountNominal']}%",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 20),
              const Text(
                "Syarat dan ketentuan",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do\n"
                "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut\n" 
                "enim ad minim veniam, quis nostrud exercitation ullamco\n" 
                "laboris nisi ut aliquip ex eavommodo consequat." ,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "1.",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipisicing elit,\n" 
                            "sed do eiusmod tempor incididunt ut labore et\n",
                            style: 
                              TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "2.",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipisicing\n" 
                            "elit, sed do eiusmod tempor incididunt ut labore et\n",
                            style: 
                              TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "3.",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipisicing\n" 
                            "elit, sed do eiusmod tempor incididunt ut labore et\n",
                            style: 
                              TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do\n" 
                "eiusmod tempor incididunt ut labore et dolore magna aliqua.\n" ,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}