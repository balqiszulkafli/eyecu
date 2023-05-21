import 'package:eyecu/models/question_model.dart';

List<Question> getQuestions() {
  List<Question> falantlist = [];
  //ADD questions and answer here
  falantlist.add(Question(
    "1",
    "assets/images/falant/falant1.png",
    [
      Answer("Top : Red | Bottom : Red", true),
      Answer("Top : Red | Bottom : Green", false),
      Answer("Top : Red | Bottom : Yellow", false),
      Answer("Top : Green | Bottom : Yellow", false),
    ],
  ));
  falantlist.add(Question(
    "2",
    "assets/images/falant/falant2.png",
    [
      Answer("Top : Red | Bottom : Red", false),
      Answer("Top : Red | Bottom : Green", true),
      Answer("Top : Red | Bottom : Yellow", false),
      Answer("Top : Green | Bottom : Yellow", false),
    ],
  ));
  falantlist.add(Question(
    "3",
    "assets/images/falant/falant3.png",
    [
      Answer("Top : Red | Bottom : Red", false),
      Answer("Top : Red | Bottom : Green", false),
      Answer("Top : Red | Bottom : Yellow", true),
      Answer("Top : Green | Bottom : Yellow", false),
    ],
  ));
  falantlist.add(Question(
    "4",
    "assets/images/falant/falant4.png",
    [
      Answer("Top : Green   |   Bottom : Green", true),
      Answer("Top : Green   |   Bottom : Red", false),
      Answer("Top : Green   |   Bottom : Yellow", false),
      Answer("Top : Red     |   Bottom : Yellow", false),
    ],
  ));
  falantlist.add(Question(
    "5",
    "assets/images/falant/falant5.png",
    [
      Answer("Top : Green   |   Bottom : Green", false),
      Answer("Top : Green   |   Bottom : Red", true),
      Answer("Top : Green   |   Bottom : Yellow", false),
      Answer("Top : Red     |   Bottom : Yellow", false),
    ],
  ));
  falantlist.add(Question(
    "6",
    "assets/images/falant/falant6.png",
    [
      Answer("Top : Green   |   Bottom : Green", false),
      Answer("Top : Green   |   Bottom : Red", false),
      Answer("Top : Green   |   Bottom : Yellow", true),
      Answer("Top : Red     |   Bottom : Yellow", false),
    ],
  ));
  falantlist.add(Question(
    "7",
    "assets/images/falant/falant7.png",
    [
      Answer("Top : Yellow    |   Bottom : Yellow", true),
      Answer("Top : Yellow    |   Bottom : Red", false),
      Answer("Top : Yellow    |   Bottom : Green", false),
      Answer("Top : Red       |   Bottom : Green", false),
    ],
  ));
  falantlist.add(Question(
    "8",
    "assets/images/falant/falant8.png",
    [
      Answer("Top : Yellow    |   Bottom : Yellow", false),
      Answer("Top : Yellow    |   Bottom : Red", true),
      Answer("Top : Yellow    |   Bottom : Green", false),
      Answer("Top : Red       |   Bottom : Green", false),
    ],
  ));
  falantlist.add(Question(
    "9",
    "assets/images/falant/falant9.png",
    [
      Answer("Top : Yellow    |  Bottom : Yellow", false),
      Answer("Top : Yellow    |  Bottom : Red", false),
      Answer("Top : Yellow    |  Bottom : Green", true),
      Answer("Top : Red       |   Bottom : Green", false),
    ],
  ));

  return falantlist;
}
