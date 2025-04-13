// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:researchpro/components/text_field.dart';
import 'package:researchpro/components/wall_post.dart';
import 'package:researchpro/helper/helper_methods.dart';

class ScholarshipInfoPage extends StatefulWidget {
  const ScholarshipInfoPage({super.key});

  @override
  State<ScholarshipInfoPage> createState() => _ScholarshipInfoPageState();
}

class _ScholarshipInfoPageState extends State<ScholarshipInfoPage> {
  final textController = TextEditingController();
  final List<Map<String, dynamic>> posts = [
    {
      'Message':
          'Concordia University Scholarships 2025 in Canada (Funded)\n\nUniversity: Concordia University\nDegree level: Bachelors, Masters, PhD\nScholarship coverage: Funded\nEligible nationality: All Nationalities\nAward country: Canada\nLast Date: 1 June 2025\n\nApply Link: https://brightscholarship.com/concordia-university-scholarships-2025/\n',
      'UserEmail': 'Abdullah Al Noman',
      'TimeStamp': DateTime.now().subtract(const Duration(hours: 5)),
      'Likes': [
        'user1@example.com',
        'user2@example.com',
        'user3@example.com',
        'user8@example.com'
      ],
      'Comments': [
        {
          'text': 'What are the eligibility criteria for this scholarship?',
          'user': 'Prapti',
          'time': DateTime.now().subtract(const Duration(hours: 4)),
        },
        {
          'text':
              'You can find all eligibility requirements on our website: www.example.com/scholarships',
          'user': 'Abdullah Al Noman',
          'time': DateTime.now().subtract(const Duration(hours: 3)),
        },
        {
          'text': 'Is there a minimum GPA requirement?',
          'user': 'Eiamin',
          'time': DateTime.now().subtract(const Duration(hours: 2)),
        },
        {
          'text': 'Yes, a minimum GPA of 3.5 is required for consideration.',
          'user': 'Abdullah Al Noman',
          'time': DateTime.now().subtract(const Duration(hours: 1)),
        },
        {
          'text':
              'Can I apply if I\'m currently in my final year of undergraduate studies?',
          'user': 'Tuly',
          'time': DateTime.now().subtract(const Duration(minutes: 30)),
        },
      ],
    },
    {
      'Message':
          'Monash University Research Scholarships 2025-26 in Australia (Fully Funded)\n\nUniversity: Monash University\nDegree level: Masters, PhD\nScholarship coverage: Fully Funded\nEligible nationality: All Nationalities\nAward country: Australia\nLast Date: 31 August 2025\n\nApply Link: https://brightscholarship.com/monash-university-research-scholarships-2025-26/\n',
      'UserEmail': 'Uodoy Hossan Rafi',
      'TimeStamp': DateTime.now().subtract(const Duration(days: 1)),
      'Likes': ['user4@example.com', 'user5@example.com', 'user9@example.com'],
      'Comments': [
        {
          'text': 'Is this fellowship open to international students?',
          'user': 'Shanto',
          'time': DateTime.now().subtract(const Duration(hours: 20)),
        },
        {
          'text': 'Yes, international students are welcome to apply!',
          'user': 'Uodoy Hossan Rafi',
          'time': DateTime.now().subtract(const Duration(hours: 18)),
        },
        {
          'text': 'What kind of research projects are available?',
          'user': 'Shafin',
          'time': DateTime.now().subtract(const Duration(hours: 15)),
        },
        {
          'text':
              'We have several ongoing projects in climate change impact assessment and sustainable resource management. You can find details in the fellowship description.',
          'user': 'Uodoy Hossan Rafi',
          'time': DateTime.now().subtract(const Duration(hours: 12)),
        },
        {
          'text':
              'Is there a possibility to extend the fellowship beyond one year?',
          'user': 'Prapti',
          'time': DateTime.now().subtract(const Duration(hours: 8)),
        },
      ],
    },
    {
      'Message':
          '5000 Fully Funded Scholarships in Germany 2025 (Apply Now)\n\nUniversity: German Universities\nDegree level: Bachelors, Masters, PhD\nScholarship coverage: Fully Funded\nEligible nationality: All Nationalities\nAward country: Germany\nLast Date: Varies\n\nApply Link: https://brightscholarship.com/fully-funded-scholarships-in-germany-2025/\n',
      'UserEmail': 'Eiamin Hassan',
      'TimeStamp': DateTime.now().subtract(const Duration(days: 2)),
      'Likes': [
        'user6@example.com',
        'user7@example.com',
        'user10@example.com',
        'user11@example.com'
      ],
      'Comments': [
        {
          'text': 'What GPA is required to maintain this scholarship?',
          'user': 'Prantor',
          'time': DateTime.now().subtract(const Duration(days: 1)),
        },
        {
          'text':
              'A minimum GPA of 3.0 is required to maintain the scholarship.',
          'user': 'Eiamin Hassan',
          'time': DateTime.now().subtract(const Duration(hours: 12)),
        },
        {
          'text': 'Are there any specific STEM fields that are prioritized?',
          'user': 'Jamil',
          'time': DateTime.now().subtract(const Duration(hours: 10)),
        },
        {
          'text':
              'All STEM fields are eligible, but we particularly encourage applications from underrepresented areas like environmental science and data science.',
          'user': 'Eiamin Hassan',
          'time': DateTime.now().subtract(const Duration(hours: 8)),
        },
        {
          'text': 'Can I apply if I\'m transferring from another university?',
          'user': 'Tamal',
          'time': DateTime.now().subtract(const Duration(hours: 4)),
        },
        {
          'text':
              'Yes, transfer students are eligible as long as they meet all other requirements.',
          'user': 'Eiamin Hassan',
          'time': DateTime.now().subtract(const Duration(hours: 2)),
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
      if (posts[postIndex]['Likes'].contains('user@example.com')) {
        posts[postIndex]['Likes'].remove('uer@example.com');
      } else {
        posts[postIndex]['Likes'].add('user@example.com');
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
          "Scholarship Info",
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
                      hintText: 'Share scholarship information...',
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
