//play ground
import 'dart:math';

import 'package:eyecu/constants.dart';
import 'package:eyecu/models/box.dart';
import 'package:eyecu/models/d15_list.dart';
import 'package:eyecu/models/boxes.dart';
import 'package:eyecu/screens/d15/d15_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';

class D15 extends StatefulWidget {
  const D15({super.key});
  //member

  //constructor

  @override
  State<D15> createState() => _D15State();
}

class _D15State extends State<D15> {
  //members
  late List<Box> boxes = [];
  late List<Box> opaqueBoxes = []; //to be filled
  late List<Box> choiceBoxes = []; //user will select from this list
  var userInput = [];
  String result = "";
  int mismatches = 0;
  int currentBox = 1;

  //disposal
  @override
  void dispose() {
    super.dispose();
  }

  //initial
  @override
  void initState() {
    super.initState();
//level from widget passed in consructor

    //get all level boxes
    boxes.addAll(Boxes().getBoxes(Boxes().numberOfBoxes(1)));
    opaqueBoxes.addAll(boxes); //to be filled

//choice
    choiceBoxes.addAll(boxes);
    fisherYatesShuffle(choiceBoxes);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Scaffold(
          backgroundColor: whitebutnotwhite,
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Arrangment Test",
                  style: TextStyle(
                      color: mainTheme,
                      fontFamily: 'DM Sans Regular',
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Center(
                  child: SizedBox(
                    height: 320,
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            GridView.count(
                                shrinkWrap: true,
                                crossAxisCount: 6,
                                children: List.generate(1, (index) {
                                  return Container(
                                    margin: const EdgeInsets.only(
                                        right: 4, bottom: 2),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF3781C1),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(4)),
                                      border: Border.all(color: Colors.black12),
                                    ),
                                  );
                                })),
                          ],
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 6,
                          children: List.generate(opaqueBoxes.length,
                              (index) => _generateOpaque(index)),
                        ),
                      ],
                    ),
                  ),
                ),
                const Text(
                  "Drag the colored boxes below:",
                  style: TextStyle(
                    color: mainTheme,
                    fontFamily: 'DM Sans Regular',
                    fontSize: 16,
                  ),
                ),
                //choice boxes'
                SizedBox(
                  height: 260,
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 6,
                    children: List.generate(choiceBoxes.length,
                        (index) => _generateChoiceBox(index)),
                  ),
                ),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: whitebutnotwhite,
                        side: const BorderSide(color: mainTheme)),
                    onPressed: _reset,
                    child: const Text(
                      "Reset",
                      style: TextStyle(
                        color: mainTheme,
                        fontFamily: 'DM Sans Regular',
                        fontSize: 16,
                      ),
                    ))
              ],
            ),
          )),
    );
  }

  Widget _generateOpaque(int index) {
    return DragTarget<Box>(
      builder: (BuildContext context, List<dynamic> accepted,
          List<dynamic> rejected) {
        return opaqueBoxes.elementAt(index).filled
            ? _filledBox(index)
            : _opaqueBox(index);
      },
      onWillAccept: (data) {
        //Calcualate score
        //result();

        return true;
      },
      onAccept: (data) {
        //once box is accepted call back
        if (index + 1 != currentBox) {
          Flushbar(
            message: "Please fill the boxes in sequence",
            duration: const Duration(seconds: 2),
          ).show(context);
          return;
        }
        if (!opaqueBoxes[index].filled) {
          setState(() {
            var box = Box(
              color: data.color,
              name: data.name,
              filled: true,
            );
            opaqueBoxes[index] = box;
            userInput.add(data.name);
            choiceBoxes.removeWhere((element) => element.name == data.name);
            currentBox++;
          });
        }
        if (isLevelEnd()) {
          _evaluate();
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultScreen(
                  result: result,
                  mismatches: mismatches,
                  total: userInput.length,
                ),
              ));
        }
      },
    );
  }

  _filledBox(int index) {
    return Container(
      margin: const EdgeInsets.only(right: 4, bottom: 2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        color: opaqueBoxes.elementAt(index).color,
      ),
    );
  }

  _opaqueBox(int index) {
    return Container(
      margin: const EdgeInsets.all(2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(color: Colors.grey),
      ),
      child: Text(
        opaqueBoxes.elementAt(index).name,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  bool isLevelEnd() {
    //ends only  if no more choice
    return choiceBoxes.isEmpty;
  }

  Widget _generateChoiceBox(int index) {
    return Draggable<Box>(
      data: choiceBoxes.elementAt(index),
      feedback: Container(
        width: 80,
        height: 80,
        margin: const EdgeInsets.only(right: 4, bottom: 2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: Colors.grey),
          color: choiceBoxes[index].color,
        ),
      ),
      childWhenDragging: Container(),
      child: Container(
        width: 80,
        height: 80,
        margin: const EdgeInsets.only(right: 4, bottom: 2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: Colors.grey),
          color: choiceBoxes[index].color,
        ),
      ),
    );
  }

  void _evaluate() {
    for (int i = 0; i < userInput.length; i++) {
      if (userInput[i] != normalList[i]) {
        mismatches++;
      }
    } //check errors made by user
    if (mismatches == 0) {
      if (userInput.toString().toLowerCase() ==
          normalList.toString().toLowerCase()) {
        result = "Normal";
      }
    } //no error, user is Normal
    else if (mismatches <= 2) {
      result = "Normal with \nMinor Error";
    } // if user made error less than 2 or 2, user might be Normal with just minor error
    else {
      if (userInput.toString().toLowerCase() ==
          protanList.toString().toLowerCase()) {
        result = "Protan";
      } else if (userInput.toString().toLowerCase() ==
          deutanList.toString().toLowerCase()) {
        result = "Deutan";
      } else if (userInput.toString().toLowerCase() ==
          tritanList.toString().toLowerCase()) {
        result = "Tritan";
      } else {
        result = "Color Defient";
      }
    } // if user made erroe more 2 , user is Color Defient
  }

  void _reset() {
    setState(() {
      opaqueBoxes = Boxes().getBoxes(Boxes().numberOfBoxes(1));
      choiceBoxes = Boxes().getBoxes(Boxes().numberOfBoxes(1));
      // reset the state of the boxes here
      for (int i = 0; i < opaqueBoxes.length; i++) {
        opaqueBoxes[i] = Box(
            color: opaqueBoxes[i].color,
            name: opaqueBoxes[i].name,
            filled: false);
      }
      // clear the userInput list
      userInput.clear();
      currentBox = 1;
      fisherYatesShuffle(choiceBoxes);
    });
  }

  void fisherYatesShuffle(List<Box> list) {
    var random = Random();
    for (var i = list.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);
      var temp = list[i];
      list[i] = list[n];
      list[n] = temp;
    }
  }
}
