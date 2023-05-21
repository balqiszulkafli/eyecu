import 'package:flutter/material.dart';

class DragWidget extends StatelessWidget {
  final String id;
  final Color boxColor;

  const DragWidget(this.id, this.boxColor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Draggable<Color>(
      data: boxColor,
      feedback: Material(
        child: Container(
          height: 120,
          width: 120,
          color: Colors.yellow,
        ),
      ),
      childWhenDragging: const SizedBox(
        height: 120,
        width: 120,
      ),
      child: Container(
        height: 120,
        width: 120,
        color: boxColor,
        child: Center(
          child: Text(
            id,
            style: const TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}
