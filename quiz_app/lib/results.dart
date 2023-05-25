import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/gradientWidget.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/home.dart';
import 'package:quiz_app/main.dart';

class QuizResult extends StatelessWidget {
  const QuizResult(this.switchScreen, this.selectedAnswers, {super.key});
  final void Function(SwitchScreenData screenData) switchScreen;
  final List<String> selectedAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].title,
          'correct_answer': questions[i].options[0],
          'user_answer': selectedAnswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: gradientColors, begin: startAlignment, end: endAlignment),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              QuizResultTitle(selectedAnswers),
              QuizResultScroll(summaryData),
              OutlinedIconButton(() {
                const params = SwitchScreenData('home');
                switchScreen(params);
              }, const Icon(Icons.replay_outlined), 'Recomeçar')
            ],
          ),
        ),
      ),
    );
  }
}

class QuizResultTitle extends StatelessWidget {
  const QuizResultTitle(this.selectedAnswers, {super.key});

  final List<String> selectedAnswers;

  int checkCorrectAnswers() {
    int correctAnswersAmount = 0;

    for (var i = 0; i < selectedAnswers.length; i++) {
      print([selectedAnswers[i], questions[i].options[0]]);

      if (selectedAnswers[i] == questions[i].options[0]) {
        correctAnswersAmount++;
      }
    }

    return correctAnswersAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Você acertou ${checkCorrectAnswers()} de 6 questões respondidas!',
      textAlign: TextAlign.center,
      style: GoogleFonts.roboto(
        textStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}

class QuizResultScroll extends StatelessWidget {
  const QuizResultScroll(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: summaryData.map(
            (data) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 40,
                      child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white)),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(data['question'] as String,
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(data['user_answer'] as String,
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white)),
                          Text(data['correct_answer'] as String,
                              style:
                                  const TextStyle(color: Colors.greenAccent)),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
