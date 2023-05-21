import 'package:flutter/material.dart';

class DragTargetWidget extends StatefulWidget {
  const DragTargetWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DragTargetWidgetState createState() => _DragTargetWidgetState();
}

List userAnswer = [];

class _DragTargetWidgetState extends State<DragTargetWidget> {
  Color caughtColor = Colors.red;
  String capData = '';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const DragBox(
          Offset(0.0, 0.0),
          'Box 1',
          Colors.purple,
        ),
        const DragBox(
          Offset(200.0, 0.0),
          'Box 2',
          Colors.orange,
        ),
        const DragBox(
          Offset(300.0, 0.0),
          'Box 3',
          Colors.lightGreen,
        ),
        Positioned(
          bottom: 0.0,
          child: Row(
            children: [
              DragTarget(
                onAccept: (Color color) {
                  caughtColor = color;
                },
                builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                ) {
                  return Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28.0),
                      color:
                          accepted.isEmpty ? caughtColor : Colors.grey.shade200,
                    ),
                    child: const Center(
                      child: Text(
                        "Drag Here 1!",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
              DragTarget(
                onAccept: (Color color) {
                  caughtColor = color;
                },
                builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                ) {
                  return Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28.0),
                      color:
                          accepted.isEmpty ? caughtColor : Colors.grey.shade200,
                    ),
                    child: const Center(
                      child: Text(
                        "Drag Here! 2",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}

class DragBox extends StatefulWidget {
  final Offset initPos;
  final String label;
  final Color itemColor;

  String get getDragboxLabel {
    return label;
  }

  const DragBox(this.initPos, this.label, this.itemColor, {super.key});

  @override
  DragBoxState createState() => DragBoxState();
}

class DragBoxState extends State<DragBox> {
  Offset position = const Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
    userAnswer.add(DragBox(widget.initPos, widget.label, widget.itemColor)
        .getDragboxLabel);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Draggable(
        data: widget.itemColor,
        onDraggableCanceled: (velocity, offset) {
          setState(() {
            position = offset;
          });
        },
        feedback: Container(
          width: 120.0,
          height: 120.0,
          color: widget.itemColor.withOpacity(0.5),
          child: Center(
            child: Text(
              widget.label,
              style: const TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
        child: Container(
          width: 100.0,
          height: 100.0,
          color: widget.itemColor,
          child: Center(
            child: Text(
              widget.label,
              style: const TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
