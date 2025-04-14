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

class _HomePageState extends State<HomePage> {
  //text controller
  final textController = TextEditingController();
  final List<Map<String, dynamic>> posts = [];
  final authService = AuthService();

  //post message
  void postMessage() {
    if (textController.text.isNotEmpty) {
      setState(() {
        posts.add({
          'Message': textController.text,
          'UserEmail': 'User',
          'TimeStamp': DateTime.now(),
          'Likes': [],
        });
        textController.clear();
      });
    }
  }

  //handle like
  void handleLike(String postId) {
    setState(() {
      final postIndex = int.parse(postId);
      if (posts[postIndex]['Likes'].contains('user@gmail.com')) {
        posts[postIndex]['Likes'].remove('user@gmail.com');
      } else {
        posts[postIndex]['Likes'].add('user@gmail.com');
      }
    });
  }

  //handle comment
  void handleComment(String postId, String comment) {
    // In a real app, you would add the comment to the post
    // For demo purposes, we'll just show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Comment added: $comment')),
    );
  }

  //handle delete
  void handleDelete(String postId) {
    setState(() {
      final postIndex = int.parse(postId);
      posts.removeAt(postIndex);
    });
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Research Info button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResearchInfoPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Research Info',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Scholarship Info button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScholarshipInfoPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Scholarship Info',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
