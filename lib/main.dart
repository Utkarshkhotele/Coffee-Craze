import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/coffee.dart';
import 'pages/dashboard_page.dart';
import 'pages/detail_page.dart';
import 'pages/onboard_page.dart';
import 'pages/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Coffee Shop',
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xffF9F9F9),
            textTheme: GoogleFonts.soraTextTheme().apply(
              bodyColor: Colors.black,
              displayColor: Colors.black,
            ),
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xffC67C4E),
              brightness: Brightness.light,
            ),
          ),
          initialRoute: '/',
          onGenerateRoute: (settings) {
            if (settings.name == '/detail') {
              final coffee = settings.arguments as Coffee;
              return MaterialPageRoute(
                builder: (context) => DetailPage(coffee: coffee),
              );
            }
            return null;
          },
          routes: {
            '/': (context) => const SplashScreen(),
            '/onboard': (context) => const OnboardPage(),
            '/dashboard': (context) => const DashboardPage(),
          },
        );
      },
    );
  }
}


