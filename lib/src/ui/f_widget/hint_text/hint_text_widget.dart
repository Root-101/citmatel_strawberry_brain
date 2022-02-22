import 'dart:math';

import 'package:citmatel_strawberry_brain/src/app/brain_app_exporter.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:get/get.dart';

class HintTextWidget extends StatefulWidget {
  const HintTextWidget({Key? key}) : super(key: key);

  @override
  _HintTextWidgetState createState() => _HintTextWidgetState();
}

class _HintTextWidgetState extends State<HintTextWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
          child: child,
          scale: animation,
        );
      },
      child: _buildHint(),
    );
  }

  _buildHint() {
    BrainHintDomain hintDomain = Get.find<BrainHintUseCase>().nextHint();

    // Make the Pulse Animation, attention seeker.
    return Pulse(
      key: ValueKey(hintDomain.id), //key para que cambie con el switcher
      preferences: AnimationPreferences(
        autoPlay: AnimationPlayStates.Loop, //que se repita siempre la animacion
      ),
      // Transformación en grados.
      child: Transform.rotate(
        angle: pi / 11,
        //container para el tamaño maximo donde va a estar el hint
        child: Container(
          height: MediaQuery.of(Get.context!).size.width / 3,
          width: MediaQuery.of(Get.context!).size.width / 2,
          child: StrawberryAnimatedTextKit.typewriterAnimatedText(
              // Text of the hint.
              texts: ['${hintDomain.hint}'],
              color: Colors.black,
              fontSize: 20,
              textAlign: TextAlign.center,
              // onTap update the state so it gets a new text hint.
              onTap: () => setState(() {})),
        ),
      ),
    );
  }
}
