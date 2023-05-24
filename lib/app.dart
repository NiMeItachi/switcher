import 'package:flutter/material.dart';

import 'animation_change_color.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AnimationChangeColor(),
    );
  }
}
