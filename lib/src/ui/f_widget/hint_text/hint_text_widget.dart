import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class HintTextWidget extends StatefulWidget {
  const HintTextWidget({Key? key}) : super(key: key);

  @override
  _HintTextWidgetState createState() => _HintTextWidgetState();
}

class _HintTextWidgetState extends State<HintTextWidget> {
  late Widget _animatedWidget;

  @override
  void initState() {
    doIt();
  }

  int key = 0;

  void doIt() {
    setState(
      () {
        key = (key + 1) % 2;
        _animatedWidget = Text(Faker().person.name(), key: ValueKey(key));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        doIt();
      },
      child: Card(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(
              child: child,
              scale: animation,
            );
          },
          child: _animatedWidget,
        ),
      ),
    );
  }
}
