import 'dart:math';

import 'package:flutter/material.dart';

import 'package:eyecu/constants.dart';
import 'package:eyecu/models/ishihara_list.dart';
import 'package:eyecu/models/question_model.dart';
import 'package:eyecu/screens/ishihara/ishihara_result.dart';
import 'package:eyecu/widgets/question_widget.dart';

class Ishihara extends StatefulWidget {
  const Ishihara({super.key});

  @override
  State<Ishihara> createState() => _IshiharaState();
}

class _IshiharaState extends State<Ishihara> {
  //define the datas
  List<Question> questionList = getQuestions();
  var userAnswer = <Check>[];
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;
  bool isPassed = false;
  String result = "";

  @override
  void initState() {
    fisherYatesShuffle(questionList);
    super.initState();
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                QuestionWidget(
                    currentQuestionIndex: currentQuestionIndex,
                    totalQuestions: questionList.length,
                    imgUrl: questionList[currentQuestionIndex].questionText),
                const SizedBox(height: 16),
                const Text(
                  "Choose an answer :",
                  style: TextStyle(
                    color: mainTheme,
                    fontFamily: 'DM Sans Regular',
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                _answerList(),
                const SizedBox(height: 16),
                selectedAnswer == null
                    ? Visibility(
                        visible: selectedAnswer == null,
                        child: const Text(
                          "Select an answer to continue",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                              fontFamily: 'DM Sans Regular'),
                        ))
                    : const Text("  "),
                const SizedBox(
                  height: 150,
                ),
                SizedBox(
                  //width: MediaQuery.of(context).size.width * 1.0,
                  width: 250,
                  height: 48,
                  child: Row(
                    children: <Widget>[
                      _previousButton(),
                      const SizedBox(
                        width: 10,
                      ),
                      _nextButton(),
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }

  _answerList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: questionList[currentQuestionIndex]
          .answersList
          .map(
            (e) => _answerButton(e),
          )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return SizedBox(
      width: 70,
      height: 70,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            side: const BorderSide(width: 1, color: mainTheme),
            backgroundColor: isSelected ? mainTheme : whitebutnotwhite,
            foregroundColor: isSelected ? whitebutnotwhite : mainTheme),
        onPressed: () {
          if (selectedAnswer == null) {
            // First answer selection
            userAnswer.add(Check(
                questionList[currentQuestionIndex].id, answer.answerText));
            if (answer.isCorrect) {
              score++;
            }
            setState(() {
              selectedAnswer = answer;
            });
          } else if (selectedAnswer == answer) {
            // Same answer selected again
            userAnswer.removeLast();
            if (answer.isCorrect) {
              score--;
            }
            setState(() {
              selectedAnswer = null;
            });
          } else {
            // Different answer selected
            userAnswer.removeLast();
            userAnswer.add(Check(
                questionList[currentQuestionIndex].id, answer.answerText));
            if (selectedAnswer?.isCorrect == true) {
              score--;
            }
            if (answer.isCorrect) {
              score++;
            }
            setState(() {
              selectedAnswer = answer;
            });
          }
        },
        child: Text(
          answer.answerText,
          style: const TextStyle(fontSize: 20, fontFamily: 'DM Sans Regular'),
        ),
      ),
    );
  }

  _previousButton() {
    return currentQuestionIndex != 0
        ? Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: whitebutnotwhite,
                  side: const BorderSide(color: mainTheme)),
              onPressed: () {
                setState(() {
                  selectedAnswer = null;
                  currentQuestionIndex--;
                });
              },
              child: const Text(
                "Previous",
                style: TextStyle(
                  color: mainTheme,
                  fontFamily: 'DM Sans Regular',
                  fontSize: 16,
                ),
              ),
            ),
          )
        : const SizedBox();
  }

  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }
    return Expanded(
      child: Opacity(
        opacity: selectedAnswer == null ? 0.5 : 1,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              backgroundColor: whitebutnotwhite,
              side: const BorderSide(color: mainTheme)),
          onPressed: selectedAnswer != null ? _onNextButtonPressed : null,
          child: Text(
            isLastQuestion ? "Submit" : "Next",
            style: const TextStyle(
              color: mainTheme,
              fontFamily: 'DM Sans Regular',
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  _onNextButtonPressed() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }
    if (isLastQuestion) {
      _checkResult();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              IshiharaResult(score: score, isPassed: isPassed, result: result),
        ),
      );
    } else {
      setState(() {
        selectedAnswer = null;
        currentQuestionIndex++;
      });
    }
  }

  _checkResult() {
    userAnswer.sort((a, b) => int.parse(a.getID)
        .compareTo(int.parse(b.getID))); //sort userAnser by ID

    if (score >= 10) {
      isPassed = true;
      result = "normal";
    } //if score more than 10, is Passed is true, result "Normal"
    else if (score < 10 || score <= 7) {
      for (int i = 0; i < userAnswer.length; i++) {
        if (userAnswer[i].getID == "23" || userAnswer[i].getID == "24") {
          if (userAnswer[i].getUserAnswer == "2" ||
              userAnswer[i].getUserAnswer == "5") {
            result = "a Protan defient";
          } else if (userAnswer[i].getUserAnswer == "4" ||
              userAnswer[i].getUserAnswer == "3") {
            result = "a Deutan defient";
          }
        } else {
          result = "a color defient";
        }
      }
    } /*If the score is less than 10 or equal to 7, it will check for checks the ID of the element "23" or "24",and it will assign result to the suitable result*/

    else if (score < 2) {
      result = "a fully color defient";
    } /*If the score is less than 2,  result is full colour blind*/
  }

  void fisherYatesShuffle(List<Question> list) {
    var random = Random();
    for (var i = list.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);
      var temp = list[i];
      list[i] = list[n];
      list[n] = temp;
    }
  }
}
