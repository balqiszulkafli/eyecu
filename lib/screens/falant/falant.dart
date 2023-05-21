import 'dart:math';

import 'package:eyecu/constants.dart';
import 'package:eyecu/models/falant_list.dart';
import 'package:eyecu/models/question_model.dart';
import 'package:eyecu/screens/falant/falant_result.dart';
import 'package:eyecu/widgets/question_widget.dart';
import 'package:flutter/material.dart';

class Falant extends StatefulWidget {
  const Falant({super.key});

  @override
  State<Falant> createState() => _FalantState();
}

class _FalantState extends State<Falant> {
  //define the datas
  List<Question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;
  bool isPassed = false;
  String result = '';

  @override
  void initState() {
    fisherYatesShuffle(questionList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //questionList.shuffle();
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: Scaffold(
        backgroundColor: whitebutnotwhite,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
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
                const SizedBox(height: 5),
                _answerList(),
                const SizedBox(height: 5),
                selectedAnswer == null
                    ? Visibility(
                        visible: selectedAnswer == null,
                        child: const Text(
                          "Select an answer to continue",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                              fontFamily: 'DM Sans Regular'),
                        ),
                      )
                    : const Text("  "),
                SizedBox(
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
    return Column(
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

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            side: const BorderSide(width: 1, color: mainTheme),
            backgroundColor: isSelected ? mainTheme : whitebutnotwhite,
            foregroundColor: isSelected ? whitebutnotwhite : mainTheme),
        onPressed: () {
          if (selectedAnswer == null) {
            if (answer.isCorrect) {
              score++;
            }
            setState(() {
              selectedAnswer = answer;
            });
          } else if (selectedAnswer == answer) {
            // Same answer selected again
            if (answer.isCorrect) {
              score--;
            }
            setState(() {
              selectedAnswer = null;
            });
          } else {
            // Different answer selected
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
          style: const TextStyle(
            fontFamily: 'DM Sans Regular',
            fontSize: 16,
          ),
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
                  backgroundColor: const Color.fromARGB(220, 255, 255, 255),
                  side: const BorderSide(color: mainTheme)),
              onPressed: () {
                setState(() {
                  currentQuestionIndex--;
                  selectedAnswer = null;
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
              backgroundColor: const Color.fromARGB(220, 255, 255, 255),
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

    if (score < 8) {
      isPassed = false; //failed
    } else if (score >= 8) {
      isPassed = true; //passed
    }
    result = isPassed ? "Passed " : "Failed";
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }
    if (isLastQuestion) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              FalantResult(score: score, isPassed: isPassed, result: result),
        ),
      );
    } else {
      setState(() {
        selectedAnswer = null;
        currentQuestionIndex++;
      });
    }
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
