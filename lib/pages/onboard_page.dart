import 'package:coffee_shop_ui/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  void nextPage() {
    if (currentIndex < 1) {
      _controller.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      Navigator.pushReplacementNamed(context, '/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (index) => setState(() => currentIndex = index),
        children: [
          _buildPage(
            imagePath: 'assets/bg1.png',
            title: 'Brewed with Passion, Served with Love!',
            subtitle:
            'Experience a rich aroma and the art of handcrafted brews',
            buttonText: 'Next',
          ),
          _buildPage(
            imagePath: 'assets/bg.png',
            title: 'Fall in Love with Coffee in Blissful Delight!',
            subtitle: ' Welcome to our cozy coffee corner, where every cup is a delight for you.zzz',
            buttonText: 'Get Started',
          ),
        ],
      ),
    );
  }

  Widget _buildPage({
    required String imagePath,
    required String title,
    required String subtitle,
    required String buttonText,
  }) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            imagePath,
            width: 1.sw,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Color(0xff050505),
                  Color(0xff050505),
                  Color(0xff050505),
                  Color(0xff050505),
                ],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 60.h),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 28.sp,
                    color: Colors.white,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp,
                    color: const Color(0xffA2A2A2),
                  ),
                ),
                SizedBox(height: 30.h),
                ButtonPrimary(
                  title: buttonText,
                  onTap: nextPage,
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


