import 'package:flutter/material.dart';

class AnimationChangeColor extends StatefulWidget {
  const AnimationChangeColor({Key? key}) : super(key: key);

  @override
  State<AnimationChangeColor> createState() => _AnimationChangeColorState();
}

class _AnimationChangeColorState extends State<AnimationChangeColor>
    with SingleTickerProviderStateMixin {

  int colorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: (){
            setState(() {
              colorIndex++;
            });
          },
          child: SizedBox(
            width: 300,
            height: 300,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              color: Colors.primaries[colorIndex],
              onEnd: (){
                if(colorIndex < Colors.primaries.length - 1){
                  colorIndex++;
                } else{
                  colorIndex = 0;
                }
                setState(() {});
              },

            ),
          ),
        ),
      ),
    );
  }
}
