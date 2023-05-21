import 'package:eyecu/constants.dart';
import 'package:eyecu/models/ishihara_list.dart';
import 'package:eyecu/models/question_model.dart';
import 'package:eyecu/screens/falant/falant.dart';
import 'package:eyecu/screens/home.dart';
import 'package:flutter/material.dart';

class FalantResult extends StatefulWidget {
  final int score;
  final bool isPassed;
  final String result;

  const FalantResult({
    Key? key,
    required this.score,
    required this.isPassed,
    required this.result,
  }) : super(key: key);

  @override
  State<FalantResult> createState() => _FalantResultState();
}

class _FalantResultState extends State<FalantResult> {
  List<Question> questionList = getQuestions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitebutnotwhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: const [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20)),
                Text(
                  "Your Result ",
                  style: TextStyle(
                      color: mainTheme,
                      fontFamily: 'DM Sans Regular',
                      fontSize: 36,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20)),
                Text(
                  "You have ${widget.result.toLowerCase()} the test!",
                  style: const TextStyle(
                      color: mainTheme,
                      fontFamily: 'DM Sans Regular',
                      fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 326,
              height: 326,
              child: Card(
                color: softPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  //set border radius more than 50% of height and width to make circle
                ),
                child: Center(
                  child: Text(
                    widget.result,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: mainTheme,
                        fontFamily: 'DM Sans Regular',
                        fontSize: 48,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Please consult with your specialist for\nconfirmation",
              style: TextStyle(
                color: mainTheme,
                fontFamily: 'DM Sans Regular',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 50, //height of button
                    width: 130, //width of button
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor:
                                const Color.fromARGB(220, 255, 255, 255),
                            side: const BorderSide(color: mainTheme)),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        },
                        child: const Text(
                          "Continue",
                          style: TextStyle(color: mainTheme),
                        )),
                  ),
                  SizedBox(
                    height: 50, //height of button
                    width: 130,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: mainTheme,
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Falant()));
                        },
                        child: const Text(
                          "Reset",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'DM Sans Regular',
                            fontSize: 16,
                          ),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
