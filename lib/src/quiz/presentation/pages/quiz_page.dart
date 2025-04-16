import 'package:flutter/material.dart';
import 'package:neoflex_quiz/src/quiz/_quiz.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final LocalQuizSource _localQuizSource = LocalQuizSource();

  List<QuizDTO> questions = [];

  bool isLoading = true;

  bool isShowResult = false;

  Map<String, bool> result = {};

  @override
  void initState() {
    super.initState();

    _getData();
  }

  Future<void> _getData() async {
    questions = await _localQuizSource.getQuestions();
    await Future<void>.delayed(const Duration(seconds: 1));

    setState(() {
      isLoading = false;
    });
  }

  Future<bool> _onPressed(String value) async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator.adaptive()),
      );
    }

    if (isShowResult) {
      return const Scaffold(body: Center(child: Text('Result')));
    }

    return Scaffold(
      body: PageView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions.elementAt(index);

          return NeonchikQuiz(
            title: question.title,
            answers: question.answers,
            onPressed: _onPressed,
            timeToShowAnswer: const Duration(seconds: 2),
          );
        },
      ),
    );
  }
}
