import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:neoflex_quiz/src/quiz/_quiz.dart';

class NeonchikQuizHeader extends StatefulWidget {
  const NeonchikQuizHeader({
    required this.title,
    required this.answers,
    required this.timeToShowAnswer,
    super.key,
  });

  final String title;

  final List<QuizDTOAnswer> answers;

  final Duration timeToShowAnswer;

  @override
  State<NeonchikQuizHeader> createState() => _NeonchikQuizHeaderState();
}

class _NeonchikQuizHeaderState extends State<NeonchikQuizHeader> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: bgDecoration,
      child: Column(
        children: [
          Text(widget.title, style: const TextStyle(fontSize: 18))
              .animate(delay: 300.ms)
              .fadeIn(duration: 600.ms, delay: 300.ms)
              .moveY(
                duration: 600.ms,
                begin: size.height / 2,
                delay: widget.timeToShowAnswer,
              ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              childAspectRatio: 3,
              children:
                  widget.answers.mapIndexed((i, element) {
                    return Text(
                          '${element.code}. ${element.title}',
                          style: const TextStyle(fontSize: 16),
                        )
                        .animate(
                          delay:
                              (widget.timeToShowAnswer + 900.ms) + (i * 300).ms,
                        )
                        .fadeIn(duration: 600.ms);
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
