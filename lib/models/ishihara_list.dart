import 'package:eyecu/models/question_model.dart';

List<Question> getQuestions() {
  List<Question> list = [];
  //ADD questions and answer here
  list.add(Question(
    "1",
    "assets/images/ishihara/plate1.jpg",
    [
      Answer("1", false),
      Answer("2", false),
      Answer("12", true),
      Answer("21", false),
    ],
  )); //1

  list.add(Question(
    "2",
    "assets/images/ishihara/plate2.jpg",
    [
      Answer("8", true),
      Answer("3", false),
      Answer("83", false),
      Answer("38", false),
    ],
  )); //2

  list.add(Question(
    "3",
    "assets/images/ishihara/plate3.jpg",
    [
      Answer("5", false),
      Answer("56", false),
      Answer("65", false),
      Answer("6", true),
    ],
  )); //3

  list.add(Question(
    "6",
    "assets/images/ishihara/plate6.jpg",
    [
      Answer("5", true),
      Answer("2", false),
      Answer("52", false),
      Answer("25", false),
    ],
  )); //4
  list.add(Question(
    "7",
    "assets/images/ishihara/plate7.jpg",
    [
      Answer("5", false),
      Answer("3", true),
      Answer("53", false),
      Answer("35", false),
    ],
  )); //5
  list.add(Question(
    "12",
    "assets/images/ishihara/plate12.jpg",
    [
      Answer("79", false),
      Answer("97", true),
      Answer("9", false),
      Answer("-", false),
    ],
  )); //5
  list.add(Question(
    "13",
    "assets/images/ishihara/plate13.jpg",
    [
      Answer("5", false),
      Answer("4", false),
      Answer("45", true),
      Answer("-", false),
    ],
  )); //6
  list.add(Question(
    "16",
    "assets/images/ishihara/plate16.jpg",
    [
      Answer("6", false),
      Answer("16", true),
      Answer("61", false),
      Answer("-", false),
    ],
  )); //
  list.add(Question(
    "17",
    "assets/images/ishihara/plate17.jpg",
    [
      Answer("73", true),
      Answer("3", false),
      Answer("7", false),
      Answer("-", false),
    ],
  )); //8
  list.add(Question(
    "20",
    "assets/images/ishihara/plate20.jpg",
    [
      Answer("5", false),
      Answer("4", false),
      Answer("45", false),
      Answer("-", true),
    ],
  )); //9
  list.add(Question(
    "23",
    "assets/images/ishihara/plate23.jpg",
    [
      Answer("4", false),
      Answer("2", false),
      Answer("42", true),
      Answer("-", false),
    ],
  )); //11
  list.add(Question(
    "24",
    "assets/images/ishihara/plate24.jpg",
    [
      Answer("3", false),
      Answer("35", true),
      Answer("5", false),
      Answer("-", false),
    ],
  )); //12
  return list;
}
