import 'dart:math';

import 'package:flutter/material.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  String activedDiceImage = 'assets/images/dice-1.png';
  void handleRollDice() {
    setState(() {
      activedDiceImage = 'assets/images/dice-${randomizer.nextInt(6) + 1}.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // to become a block on center
      children: [
        Image.asset(
          activedDiceImage,
          width: 200,
        ),
        TextButton(
          onPressed: handleRollDice,
          style: TextButton.styleFrom(
            padding:
                const EdgeInsets.only(top: 5), //setting only to one "direction"
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 20),
          ),
          child: const Text('Rodar Dado'),
        )
      ],
    );
  }
}
