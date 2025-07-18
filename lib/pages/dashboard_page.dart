import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:coffee_shop_ui/pages/dashboard_fragments/home_fragment.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int indexMenu = 0;

  final menu = [
    {
      'icon': 'assets/ic_home_border.png',
      'icon_active': 'assets/ic_home_filled.png',
      'fragment': const HomeFragment(),
    },
    {
      'icon': 'assets/ic_heart_border.png',
      'icon_active': 'assets/ic_heart_border.png',
      'fragment': const Center(child: Text('Favorite')),
    },
    {
      'icon': 'assets/ic_bag_border.png',
      'icon_active': 'assets/ic_bag_border.png',
      'fragment': const Center(child: Text('Bag')),
    },
    {
      'icon': 'assets/ic_notification_border.png',
      'icon_active': 'assets/ic_notification_border.png',
      'fragment': const Center(child: Text('Notification')),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final screenWidth = mq.size.width;

    // Responsive paddings and icon size
    final paddingHorizontal = screenWidth * 0.07; // ~30 on 428 width
    final iconSize = screenWidth * 0.06;           // ~24 on 428 width
    final barHeight = mq.size.height * 0.1;        // ~70px base

    return Scaffold(
      body: menu[indexMenu]['fragment'] as Widget,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
        child: SizedBox(
          height: barHeight,
          child: Row(
            children: List.generate(menu.length, (index) {
              Map item = menu[index];
              bool isActive = indexMenu == index;

              return Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      indexMenu = index;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Gap(barHeight * 0.3), // ~20
                      ImageIcon(
                        AssetImage(
                          item[isActive ? 'icon_active' : 'icon'],
                        ),
                        size: iconSize,
                        color: Color(isActive ? 0xffC67C4E : 0xffA2A2A2),
                      ),
                      if (isActive) Gap(barHeight * 0.1), // ~6
                      if (isActive)
                        Container(
                          height: barHeight * 0.07, // ~5
                          width: screenWidth * 0.025, // ~10
                          decoration: BoxDecoration(
                            color: const Color(0xffC67C4E),
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
