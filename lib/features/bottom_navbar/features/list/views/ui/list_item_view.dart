import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:trainee/features/bottom_navbar/features/list/controllers/list_controller.dart';
import 'package:trainee/features/bottom_navbar/features/list/views/components/search_app_bar.dart';
import 'package:trainee/features/bottom_navbar/features/list/views/components/slidable_card.dart';

import '../../../../../../configs/routes/main_route.dart';
import '../components/menu_chip.dart';
import '../components/promo_card.dart';
import '../components/section_header.dart';



class ListItemView extends StatelessWidget {
  const ListItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: SearchAppBar(
          onChange: (value) => ListController.to.keyword(value),
        ),
        body: NestedScrollView(
            physics: const ClampingScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(child: 22.verticalSpace),
                // list of promo
                const SliverToBoxAdapter(
                  child: SectionHeader(
                    icon: Icons.note_alt_outlined,
                    title: 'Available promo',
                  ),
                ),
                SliverToBoxAdapter(child: 22.verticalSpace),
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: 1.sw,
                    height: 188.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      itemBuilder: (context, index) {
                        return PromoCard(
                          isVoucher: ListController
                            .to.promoItems[index].type ==
                            "voucher" ? true : false,
                          enableShadow: false,
                          promoName: ListController.to.promoItems[index].nama!,
                          discountNominal: ListController
                            .to.promoItems[index].nominal.toString(),
                          thumbnailUrl:
                              "https://javacode.landa.id/img/promo/gambar_62661b52223ff.png",
                          onTap: () {
                            Get.toNamed(
                              MainRoute.detailPromo,
                              arguments: {
                                ListController.to.promoItems[index],
                              },
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, index) => 26.horizontalSpace,
                      itemCount: ListController.to.promoItems.length,
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: 22.verticalSpace),
                // Row of categories
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: 1.sw,
                    height: 45.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: ListController.to.categories.length,
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      itemBuilder: (context, index) {
                        final category = ListController.to.categories[index];
                        return Obx(() => MenuChip(
                          onTap: () {
                            ListController.to
                              .selectedCategory(category);
                          },
                          isSelected:
                            ListController.to.selectedCategory.value ==
                              category,
                          text: category,
                        ));
                      },
                      separatorBuilder: (context, index) => 13.horizontalSpace,
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: 10.verticalSpace),
              ];
            },
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() {
                  final currentCategory =
                    ListController.to.selectedCategory.value;
                  var iconSection = Icons.menu_book;
                  if (currentCategory == ListController.to.categories[1]) {
                    iconSection = Icons.food_bank;
                  } else if (currentCategory ==
                      ListController.to.categories[2]) {
                    iconSection = Icons.local_drink;
                  } else {
                    iconSection = Icons.menu_book;
                  }
                  return Container(
                    width: 1.sw,
                    height: 35.h,
                    color: Colors.grey[100],
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: SectionHeader(
                      title: currentCategory,
                      icon: iconSection,
                    ),
                  );
                }),
                Obx(
                  () => Expanded(
                    child: SmartRefresher(
                      controller: ListController.to.refreshController,
                      enablePullDown: true,
                      onRefresh: ListController.to.onRefresh,
                      enablePullUp:
                          ListController.to.canLoadMore.isTrue ? true : false,
                      onLoading: ListController.to.getAllMenus,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        itemCount: ListController.to.filteredMenuList.length,
                        itemBuilder: (context, index) {
                          final item =
                              ListController.to.filteredMenuList[index];
                          return SlidableCardComponent(item: item);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
