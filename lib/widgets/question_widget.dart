//This is question widget

import 'package:eyecu/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {Key? key,
      required this.currentQuestionIndex,
      required this.totalQuestions,
      required this.imgUrl})
      : super(key: key);

  //Ishihara question title , total number of questions, index
  final String imgUrl;
  final int currentQuestionIndex, totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LinearProgressIndicator(
          value: (currentQuestionIndex + 1) / totalQuestions,
          backgroundColor: Colors.grey,
          valueColor: const AlwaysStoppedAnimation<Color>(mainTheme),
        ),
        const SizedBox(height: 20),
        Text(
          "Q: ${currentQuestionIndex + 1}/${totalQuestions.toString()}",
          style: const TextStyle(
            fontFamily: 'DM Sans Regular',
            color: mainTheme,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: softPurple,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade600,
                    spreadRadius: 1,
                  )
                ]),
            child: GestureDetector(
              onTap: () {
                showImageViewer(context, Image.asset(imgUrl).image,
                    swipeDismissible: false);
              }, //to view image in full screen
              child: Image(
                image: AssetImage(imgUrl),
                height: 200,
                width: 200,
              ),
            ))
      ],
    );
  }
}
