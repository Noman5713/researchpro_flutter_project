import 'package:flutter/material.dart';
import 'package:researchpro/components/drawer.dart';
import 'package:researchpro/pages/login_page.dart';
import 'package:researchpro/pages/profile_page.dart';
import 'package:researchpro/pages/research_info_page.dart';
import 'package:researchpro/pages/scholarship_info_page.dart';
import 'package:researchpro/services/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final authService = AuthService();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // handle logout
  void handleLogout() {
    authService.logout();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  // navigate to profile page
  void goToProfilePage() {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "ResearchPro",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.blue,
          indicatorWeight: 3,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          tabs: const [
            Tab(text: 'Research Info'),
            Tab(text: 'Scholarship Info'),
          ],
        ),
      ),
      drawer: MyDrawer(
        onProfileTap: goToProfilePage,
        onSignOut: handleLogout,
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ResearchInfoPage(),
          ScholarshipInfoPage(),
        ],
      ),
    );
  }
}
