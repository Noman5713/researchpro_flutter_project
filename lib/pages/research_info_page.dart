// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:researchpro/components/text_field.dart';
import 'package:researchpro/components/wall_post.dart';
import 'package:researchpro/helper/helper_methods.dart';

class ResearchInfoPage extends StatefulWidget {
  const ResearchInfoPage({super.key});

  @override
  State<ResearchInfoPage> createState() => _ResearchInfoPageState();
}

class _ResearchInfoPageState extends State<ResearchInfoPage> {
  final textController = TextEditingController();
  final List<Map<String, dynamic>> posts = [
    {
      'Message': '📢 IEEE International Conference on Computer Vision (ICCV) 2024\n\nImportant Dates:\n• Abstract Submission: March 15, 2025\n• Full Paper Submission: March 22, 2025\n• Author Notification: July 15, 2025\n• Camera Ready: August 15, 2025\n\nVenue: Paris, France\nConference Dates: October 27 - November 2, 2025\n\n#ComputerVision #ICCV2025 #ResearchConference',
      'UserEmail': 'IEEE Computer Society',
      'TimeStamp': DateTime.now().subtract(const Duration(hours: 2)),
      'Likes': ['user1@example.com', 'user2@example.com', 'user3@example.com'],
      'Comments': [
        {
          'text': 'Will there be a virtual attendance option?',
          'user': 'Eiamin Hassan',
          'time': DateTime.now().subtract(const Duration(hours: 1)),
        },
        {
          'text': 'Yes, hybrid participation will be available. Details will be announced soon.',
          'user': 'IEEE Computer Society',
          'time': DateTime.now().subtract(const Duration(minutes: 30)),
        },
        {
          'text': 'Looking forward to submitting our work on real-time object detection!',
          'user': 'Abdullah Al Noman',
          'time': DateTime.now().subtract(const Duration(minutes: 15)),
        },
        {
          'text': 'Will there be a special session on medical imaging applications?',
          'user': 'Prapti',
          'time': DateTime.now().subtract(const Duration(minutes: 5)),
        },
      ],
    },
    {
      'Message': '🚨 Call for Papers: Nature Machine Intelligence\n\nSpecial Issue: "AI for Sustainable Development"\n\nSubmission Deadline: April 30, 2025\nFirst Decision: June 15, 2025\nFinal Decision: August 1, 2025\nPublication: October 2025\n\nTopics of Interest:\n• AI for Climate Change\n• Sustainable Agriculture\n• Renewable Energy Optimization\n• Environmental Monitoring\n\n#NatureMachineIntelligence #SustainableAI #ResearchJournal',
      'UserEmail': 'Nature Publishing Group',
      'TimeStamp': DateTime.now().subtract(const Duration(days: 1)),
      'Likes': ['user1@example.com', 'user4@example.com', 'user5@example.com'],
      'Comments': [
        {
          'text': 'Is there a page limit for submissions?',
          'user': 'Abdullah Al Noman',
          'time': DateTime.now().subtract(const Duration(hours: 20)),
        },
        {
          'text': 'The recommended length is 8-12 pages, including references. Please check our submission guidelines for details.',
          'user': 'Nature Publishing Group',
          'time': DateTime.now().subtract(const Duration(hours: 18)),
        },
        {
          'text': 'Our team has been working on AI for precision agriculture. This special issue is perfect timing!',
          'user': 'Eiamin Hassan',
          'time': DateTime.now().subtract(const Duration(hours: 12)),
        },
        {
          'text': 'Will you consider review papers for this special issue?',
          'user': 'Prapti',
          'time': DateTime.now().subtract(const Duration(hours: 8)),
        },
        {
          'text': 'Yes, we welcome both original research and review papers on the specified topics.',
          'user': 'Nature Publishing Group',
          'time': DateTime.now().subtract(const Duration(hours: 6)),
        },
      ],
    },
    {
      'Message': '📝 ACM SIGCHI Conference on Human Factors in Computing Systems (CHI) 2025\n\nImportant Dates:\n• Abstract Submission: September 15, 2025\n• Full Paper Submission: September 22, 2025\n• Author Notification: January 15, 2026\n• Camera Ready: February 15, 2026\n\nVenue: Honolulu, Hawaii, USA\nConference Dates: May 11-16, 2026\n\n#HCI #CHI2024 #ResearchConference',
      'UserEmail': 'ACM SIGCHI',
      'TimeStamp': DateTime.now().subtract(const Duration(days: 2)),
      'Likes': ['user2@example.com', 'user3@example.com', 'user6@example.com', 'user7@example.com'],
      'Comments': [
        {
          'text': 'What is the expected acceptance rate this year?',
          'user': 'Jamil',
          'time': DateTime.now().subtract(const Duration(days: 1)),
        },
        {
          'text': 'The acceptance rate typically ranges between 20-25%. We encourage high-quality submissions in all areas of HCI.',
          'user': 'ACM SIGCHI',
          'time': DateTime.now().subtract(const Duration(hours: 12)),
        },
        {
          'text': 'Will there be a workshop on accessibility in HCI?',
          'user': 'Uodoy',
          'time': DateTime.now().subtract(const Duration(hours: 8)),
        },
        {
          'text': 'Yes, we\'re planning several workshops including one on accessibility. The call for workshops will be announced next month.',
          'user': 'ACM SIGCHI',
          'time': DateTime.now().subtract(const Duration(hours: 6)),
        },
        {
          'text': 'Looking forward to presenting our work on gesture-based interfaces!',
          'user': 'Prantor',
          'time': DateTime.now().subtract(const Duration(hours: 4)),
        },
      ],
    },
  ];

  //post message
  void postMessage() {
    if (textController.text.isNotEmpty) {
      setState(() {
        posts.add({
          'Message': textController.text,
          'UserEmail': 'User',
          'TimeStamp': DateTime.now(),
          'Likes': [],
          'Comments': [],
        });
        textController.clear();
      });
    }
  }

  //handle like
  void handleLike(String postId) {
    setState(() {
      final postIndex = int.parse(postId);
      if (posts[postIndex]['Likes'].contains('shanto@gmail.com')) {
        posts[postIndex]['Likes'].remove('shanto@gmail.com');
      } else {
        posts[postIndex]['Likes'].add('shanto@gmail.com');
      }
    });
  }

  //handle comment
  void handleComment(String postId, String comment) {
    setState(() {
      final postIndex = int.parse(postId);
      posts[postIndex]['Comments'].add({
        'text': comment,
        'user': 'User',
        'time': DateTime.now(),
      });
    });
  }

  //handle delete
  void handleDelete(String postId) {
    setState(() {
      final postIndex = int.parse(postId);
      posts.removeAt(postIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Research Info",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            //the wall
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          final post = posts[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: WallPost(
                              message: post['Message'],
                              user: post['UserEmail'],
                              postId: index.toString(),
                              likes: post['Likes'],
                              time: formatDate(post['TimeStamp']),
                              comments: post['Comments'],
                              onDelete: handleDelete,
                              onLike: handleLike,
                              onComment: handleComment,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //post message
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, -1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  //text field
                  Expanded(
                    child: MyTextField(
                      controller: textController,
                      hintText: 'Share your research information...',
                      obsecureText: false,
                    ),
                  ),

                  //post button
                  IconButton(
                    onPressed: postMessage,
                    icon: const Icon(Icons.arrow_circle_up),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 