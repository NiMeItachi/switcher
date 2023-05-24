import 'package:flutter/material.dart';

class AnimationOnOff extends StatefulWidget {
  const AnimationOnOff({Key? key}) : super(key: key);

  @override
  State<AnimationOnOff> createState() => _AnimationOnOffState();
}

class _AnimationOnOffState extends State<AnimationOnOff>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> animation;

  Alignment myAlignment = Alignment.centerLeft;
  Color myColor = Colors.green;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));

    animation = ColorTween(begin: Colors.green, end: Colors.red).animate(controller);

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.forward();
      }
    });

    controller.addListener(() {
      setState(() {
        myColor = animation.value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            if (myAlignment == Alignment.centerLeft) {
              myAlignment = Alignment.centerRight;
            } else {
              myAlignment = Alignment.centerLeft;
            }
            if (controller.status == AnimationStatus.completed ||
                controller.status == AnimationStatus.forward) {
              controller.reset();
            } else {
              controller.forward();
            }
            myColor = animation.value!;
            setState(() {});
          },
          child: Container(
            width: 300,
            height: 100,
            decoration: BoxDecoration(
                color: animation.value, borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(offset: const Offset(0, 1), blurRadius: 50, color: animation.value!)
              ]
            ),

            child: AnimatedAlign(
              alignment: myAlignment,
              duration: const Duration(milliseconds: 300),
              child: const Icon(
                Icons.circle,
                color: Colors.white,
                size: 100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
