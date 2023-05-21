import 'package:flutter/material.dart';

import 'gradient_container.dart';

void main() {
  const gradientColors = [
    Color.fromARGB(255, 164, 5, 5),
    Color.fromARGB(255, 190, 45, 37)
  ];

  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(gradientColors),
      ),
    ),
  );
}
