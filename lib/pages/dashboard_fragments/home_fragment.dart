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
  String searchQuery = '';
  List<Coffee> filteredCoffee = [];

  final List<String> categories = [
    'All Coffee',
    'Cappuccino',
    'Creamy Roast',
    'Hot Coffee',
    'Americano',
    'Espresso',
  ];

  @override
  void initState() {
    super.initState();
    _filterCoffeeList();
  }

  void _filterCoffeeList() {
    List<Coffee> result = [];

    if (categorySelected == 'All Coffee') {
      result = listGridCoffee;
    } else {
      result = listGridCoffee
          .where((coffee) =>
      coffee.type.toLowerCase() == categorySelected.toLowerCase())
          .toList();
    }

    if (searchQuery.isNotEmpty) {
      result = result
          .where((coffee) => coffee.name
          .toLowerCase()
          .contains(searchQuery.toLowerCase()))
          .toList();
    }

    setState(() {
      filteredCoffee = result;
    });
  }

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
                  child:
                  buildGridCoffee(constraints.maxWidth, filteredCoffee),
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
        Text('Location',
            style: TextStyle(fontSize: 12.sp, color: Color(0xffA2A2A2))),
        Row(
          children: [
            Text(
              'Noida, India',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                color: Color(0xffD8D8D8),
              ),
            ),
            Gap(4.w),
            Image.asset('assets/ic_arrow_down.png',
                height: 14.h, width: 14.w),
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
                    onChanged: (query) {
                      searchQuery = query;
                      _filterCoffeeList();
                    },
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      isDense: true,
                      border: InputBorder.none,
                      hintText: 'Search coffee',
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xffA2A2A2),
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
    return SizedBox(
      height: 34.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        itemBuilder: (_, index) {
          final category = categories[index];
          final isSelected = categorySelected == category;

          return GestureDetector(
            onTap: () {
              setState(() {
                categorySelected = category;
                _filterCoffeeList();
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 8.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: isSelected ? Color(0xffC67C4E) : Colors.grey[200],
                borderRadius: BorderRadius.circular(8.r),
              ),
              alignment: Alignment.center,
              child: Text(
                category,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildGridCoffee(double width, List<Coffee> coffeeList) {
    final isWide = width > 900;
    final crossAxisCount = isWide ? 4 : width > 600 ? 3 : 2;

    return GridView.builder(
      itemCount: coffeeList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: 250.h,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 24.h,
      ),
      itemBuilder: (_, index) {
        final coffee = coffeeList[index];

        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/detail', arguments: coffee);
          },
          child: Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset(
                    coffee.image,
                    height: 120.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Gap(8.h),
                Text(
                  coffee.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  coffee.type,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
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
                      ).format(coffee.price),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                    Container(
                      height: 32.h,
                      width: 32.w,
                      decoration: BoxDecoration(
                        color: Color(0xffC67C4E),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child:
                      const Icon(Icons.add, color: Colors.white, size: 16),
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







