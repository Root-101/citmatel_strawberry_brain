import 'dart:math';

import 'package:citmatel_strawberry_brain/src/app/brain_app_exporter.dart';
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
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(
            child: child,
            scale: animation,
          );
        },
        child: _buildHint(),
      ),
    );
  }

  //este widget tree esta un poco enredado, pero no veo manera de reducirlo,
  //para eso lo comente bastante
  _buildHint() {
    double maxWidHei = MediaQuery.of(Get.context!).size.width * 3 / 4;

    BrainHintDomain hintDomain = Get.find<BrainHintUseCase>().nextHint();
    final splitedHint = hintDomain.hint.split("\n");

    //para animacion de movimiento de llamar la atencion
    return Pulse(
      key: ValueKey(hintDomain.id), //key para que cambie con el switcher
      preferences: AnimationPreferences(
        autoPlay: AnimationPlayStates.Loop, //que se repita siempre la animacion
      ),
      //transformacion de 15 grados
      child: Transform.rotate(
        angle: -pi / 12.0,
        //container para el tamaño maximo donde va a estar el hint
        child: Container(
          height: maxWidHei,
          width: maxWidHei,
          color: Colors.transparent,
          //Center para que la columna quede en el medio
          child: Center(
            //este es el container de style, aqui es donde va el fondo y la sombra y demas
            //se puede cambiar por un Card para coger cosas por defecto
            child: Container(
              color: Colors.pinkAccent,
              //columna para mostrar la lista de particiones del hint
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: splitedHint
                    .map(
                      //cada una de las lienas de texto
                      (hintPeace) => Text(
                        hintPeace,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
