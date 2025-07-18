import 'package:coffee_shop_ui/models/coffee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  String categorySelected = 'All Coffee';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    buildBackground(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        children: [
                          Gap(68.h),
                          buildHeader(),
                          Gap(30.h),
                          buildSearch(),
                          Gap(24.h),
                          buildBannerPromo(),
                        ],
                      ),
                    ),
                  ],
                ),
                Gap(24.h),
                buildCategories(),
                Gap(16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: buildGridCoffee(constraints.maxWidth),
                ),
                Gap(30.h),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildBackground() {
    return Container(
      height: 280.h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xff111111), Color(0xff313131)],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location',
          style: TextStyle(fontSize: 12.sp, color: const Color(0xffA2A2A2)),
        ),
        Row(
          children: [
            Text(
              'Noida, India',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                color: const Color(0xffD8D8D8),
              ),
            ),
            Gap(4.w),
            Image.asset(
              'assets/ic_arrow_down.png',
              height: 14.h,
              width: 14.w,
            ),
          ],
        ),
      ],
    );
  }

  Widget buildSearch() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50.h,
            decoration: BoxDecoration(
              color: const Color(0xff2A2A2A),
              borderRadius: BorderRadius.circular(12.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                const ImageIcon(
                  AssetImage('assets/ic_search.png'),
                  color: Colors.white,
                ),
                Gap(8.w),
                Expanded(
                  child: TextField(
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      isDense: true,
                      border: InputBorder.none,
                      hintText: 'Search coffee',
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xffA2A2A2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Gap(16.w),
        Container(
          height: 52.h,
          width: 52.w,
          decoration: BoxDecoration(
            color: const Color(0xffC67C4E),
            borderRadius: BorderRadius.circular(12.r),
          ),
          alignment: Alignment.center,
          child: const ImageIcon(
            AssetImage('assets/ic_filter.png'),
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget buildBannerPromo() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Image.asset(
        'assets/banner.png',
        width: double.infinity,
        height: 140.h,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildCategories() {
    final categories = [
      'All Coffee',
      'Indonesiano',
      'Machiato',
      'Latte',
      'Americano',
    ];
    return SizedBox(
      height: 29.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isActive = categorySelected == category;
          return GestureDetector(
            onTap: () => setState(() => categorySelected = category),
            child: Container(
              margin: EdgeInsets.only(
                left: index == 0 ? 24.w : 8.w,
                right: index == categories.length - 1 ? 24.w : 0,
              ),
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: isActive
                    ? const Color(0xffC67C4E)
                    : const Color(0xffEDEDED).withAlpha(90),
                borderRadius: BorderRadius.circular(6.r),
              ),
              alignment: Alignment.center,
              child: Text(
                category,
                style: TextStyle(
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                  fontSize: 14.sp,
                  color: isActive ? Colors.white : const Color(0xff313131),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildGridCoffee(double width) {
    final isWide = width > 900;
    final crossAxisCount = isWide ? 4 : width > 600 ? 3 : 2;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listGridCoffee.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: 238.h,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 24.h,
      ),
      itemBuilder: (context, index) {
        final coffee = listGridCoffee[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/detail', arguments: coffee);
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 12.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.asset(
                        coffee.image,
                        height: 128.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(6.w),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xff111111).withAlpha(77),
                              const Color(0xff313131).withAlpha(77),
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12.r),
                            bottomLeft: Radius.circular(24.r),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/ic_star_filled.png',
                              height: 12.h,
                              width: 12.w,
                            ),
                            Gap(4.w),
                            Text(
                              '${coffee.rate}',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 8.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(8.h),
                Text(
                  coffee.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: const Color(0xff242424),
                  ),
                ),
                Gap(4.h),
                Text(
                  coffee.type,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xffA2A2A2),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      NumberFormat.currency(
                        locale: 'en_IN',
                        symbol: '₹',
                        decimalDigits: 2,
                      ).format(coffee.price),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: const Color(0xff050505),
                      ),
                    ),
                    Container(
                      width: 32.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        color: const Color(0xffC67C4E),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: const Icon(Icons.add, color: Colors.white, size: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}



