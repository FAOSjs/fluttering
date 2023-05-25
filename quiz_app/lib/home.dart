import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/gradientWidget.dart';
import 'package:quiz_app/main.dart';

class Home extends StatelessWidget {
  const Home(this.switchScreen, {super.key});
  final void Function(SwitchScreenData screenData) switchScreen;
  //final void Function() ...

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: gradientColors, begin: startAlignment, end: endAlignment),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/quiz-logo.png',
                width: 200, color: const Color.fromARGB(111, 255, 255, 255)),
            const HomeTitle(),
            OutlinedIconButton(() {
              const params = SwitchScreenData('questions');
              switchScreen(params);
            }, const Icon(Icons.arrow_right_alt), 'Começar')
          ],
        ),
      ),
    );
  }
}

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, bottom: 30),
      child: Text(
        'Flutter Quiz\nAprenda e divirta-se',
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
          textStyle: const TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}

class OutlinedIconButton extends StatelessWidget {
  const OutlinedIconButton(this.onPressed, this.icon, this.label, {super.key});

  final Icon icon;

  final String label;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.white, width: 1), //<-- SEE HERE
        padding: const EdgeInsets.only(left: 20, right: 20),
        foregroundColor: Colors.white,
      ),
      label: Text(
        label,
        style: GoogleFonts.roboto(textStyle: const TextStyle(fontSize: 16)),
      ),
      icon: icon,
    );
  }
}
