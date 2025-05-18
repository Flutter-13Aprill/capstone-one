import 'dart:async';

import 'package:aleef/style/style_color.dart';
import 'package:aleef/widget/add_question.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// AskAleefScreen displays common questions and answers for pet owners.
class AskAleefScreen extends StatefulWidget {
  /// AskAleefScreen displays a grid of common questions.
  const AskAleefScreen({super.key});

  @override
  State<AskAleefScreen> createState() => _AskAleefScreenState();
}

class _AskAleefScreenState extends State<AskAleefScreen> {
  // List of frequently asked questions displayed in the grid
  List<String> questions = [
    "هل في طريقة أتابع مواعيد تطعيمات أو زيارات العيادة؟",
    "كيف أقدر أوفر وقت لرعاية قطتي وأنا مشغول؟",
    "How do I travel with my cat safely?",
    "Why isn’t my cat using the litter box?",
    "هل ممكن أترك قطتي لحاله بالبيت؟ وكم ساعة؟",
    "إيش أفضل نوع أكل للقطط حسب عمره أو نوعه؟",
    "How often should I clean my cat’s litter box?",
    "How can I stop my cat from scratching the furniture?",
  ];
  TextEditingController questionController = TextEditingController();

  // Controls whether the skeleton loading animation is shown
  bool _enabled = true;
  @override
  void initState() {
    super.initState();
    // Disable skeleton effect after 3 seconds to show actual content
    Future.delayed(Duration(seconds: 3), () {
      _enabled = !_enabled;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Skeletonizer(
              enabled: _enabled, // Show skeleton animation when enabled
              enableSwitchAnimation: true,
              child: GridView.builder(
                itemCount: questions.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1,
                ),
                itemBuilder:
                    (context, index) => Card(
                      color: StyleColor.sand,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              questions[index],
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Icon(
                              Icons.comment_rounded,
                              color: StyleColor.lightSoft,
                            ),
                          ],
                        ),
                      ),
                    ),
              ),
            ),
          ),
        ],
      ),
      // Button to add new question
      floatingActionButton: AddQuestion(
        questionController: questionController,
        onTab: () {
          questions.add(questionController.text);
          setState(() {});
          questionController.clear();
          Navigator.pop(context);
        },
      ),
    );
  }
}
