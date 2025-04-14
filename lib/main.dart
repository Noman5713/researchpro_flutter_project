import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:researchpro/firebase_options.dart';
import 'package:researchpro/pages/home_page.dart';
import 'package:researchpro/pages/login_page.dart';
import 'package:researchpro/services/auth_service.dart';
import 'package:researchpro/screens/splash_screen.dart';
import 'package:researchpro/controllers/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    
    return Obx(() => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeController.lightTheme,
      darkTheme: themeController.darkTheme,
      themeMode: themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: '/home', page: () => const AuthWrapper()),
      ],
    ));
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    // Check if user is logged in
    if (authService.isLoggedIn) {
      return const HomePage();
    } else {
      return const LoginPage();
    }
  }
}
