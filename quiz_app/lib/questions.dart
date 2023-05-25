import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/data/gradientWidget.dart';
import 'package:quiz_app/main.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.switchScreen, this.handleChooseAnswers,
      {super.key});

  final void Function(String selectedAnswer) handleChooseAnswers;
  final void Function(SwitchScreenData screenData) switchScreen;

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;

  void onChooseAnswers(String selectedAnswer) {
    setState(() {
      widget.handleChooseAnswers(selectedAnswer);
      if (currentQuestionIndex > 4) {
        const params = SwitchScreenData('quizResult');
        widget.switchScreen(params);
      } else {
        currentQuestionIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var answers = questions[currentQuestionIndex]
        .getShuffledAnswers()
        .map((answer) => AnswersButton(answer, (selectedAnswer) {
              onChooseAnswers(selectedAnswer);
            }));

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: gradientColors, begin: startAlignment, end: endAlignment),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              QuestionTitleLabel(questions[currentQuestionIndex].title),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(children: [...answers]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionTitleLabel extends StatelessWidget {
  const QuestionTitleLabel(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
            textStyle: const TextStyle(fontSize: 25, color: Colors.white)),
      ),
    );
  }
}

class AnswersButton extends StatelessWidget {
  const AnswersButton(this.label, this.onPressed, {super.key});

  final String label;
  final void Function(String selectedAnswer) onPressed;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: 300 > screenWidth * .9 ? screenWidth * .9 : 300,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: ElevatedButton(
            onPressed: () {
              onPressed(label);
            },
            style: const ButtonStyle(
              padding:
                  MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 10)),
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 192, 59, 43)),
            ),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(color: Colors.white)),
            )),
      ),
    );
  }
}
