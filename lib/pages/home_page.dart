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
  int _currentIndex = 0;

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
      ),
      drawer: MyDrawer(
        onProfileTap: goToProfilePage,
        onSignOut: handleLogout,
      ),
      body: Column(
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _currentIndex = 0;
                        _tabController.animateTo(0);
                      });
                    },
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: _currentIndex == 0 ? Colors.blue.withOpacity(0.1) : Colors.transparent,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.science,
                            color: _currentIndex == 0 ? Colors.blue : Colors.grey,
                            size: 24,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Research',
                            style: TextStyle(
                              color: _currentIndex == 0 ? Colors.blue : Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: 1,
                  color: Colors.grey.withOpacity(0.3),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _currentIndex = 1;
                        _tabController.animateTo(1);
                      });
                    },
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: _currentIndex == 1 ? Colors.blue.withOpacity(0.1) : Colors.transparent,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.school,
                            color: _currentIndex == 1 ? Colors.blue : Colors.grey,
                            size: 24,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Scholarship',
                            style: TextStyle(
                              color: _currentIndex == 1 ? Colors.blue : Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                ResearchInfoPage(),
                ScholarshipInfoPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
