import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/results.dart';

void main() {
  runApp(const QuizApp());
}

class Screens {
  const Screens(this.home, this.questions, this.quizResult);

  final Home home;
  final QuestionsScreen questions;
  final QuizResult quizResult;

  dynamic getProp(String key) => <String, dynamic>{
        'home': home,
        'questions': questions,
        'quizResult': quizResult,
      }[key];
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

class SwitchScreenData {
  const SwitchScreenData(this.name, [this.data]);

  final String name;
  final List<dynamic>? data;
}

class _QuizAppState extends State<QuizApp> {
  String activedScreen = 'home';
  Screens? screens;
  List<String> selectedAnswers = [''];

  @override
  void initState() {
    screens = Screens(
        Home(switchScreen),
        QuestionsScreen(switchScreen, handleChooseAnswers),
        QuizResult(switchScreen, selectedAnswers));
    super.initState();
  }

  void switchScreen(SwitchScreenData screenData) {
    print('GOING TO > ${screenData.name}');
    setState(() {
      if (activedScreen == 'home') selectedAnswers.clear();
      activedScreen = screenData.name;
    });
  }

  void handleChooseAnswers(String selectedAnswer) {
    setState(() {
      selectedAnswers.add(selectedAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: screens?.getProp(activedScreen),
      ),
    );
  }
}
