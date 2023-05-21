import 'package:eyecu/constants.dart';
import 'package:eyecu/screens/ishihara/ishihara.dart';
import 'package:flutter/material.dart';

class IshiharaInstructions extends StatelessWidget {
  const IshiharaInstructions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whitebutnotwhite,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: mainTheme,
        ),
      ),
      body: Container(
        color: whitebutnotwhite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Instructions',
                style: TextStyle(
                  color: mainTheme,
                  fontFamily: 'DM Sans Regular',
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '1. Check that your device settings are normal (brightness, contrast, and color).\n\n2. Take the test in a well-lit room with no glare or reflections on the screen.\n\n3. Hold your device at a comfortable viewing distance and angle.\n\n4. Follow the on-screen instructions to identify the numbers in the colored circles. If you have trouble seeing the numbers, consult an eye doctor.\n\n\n\nAfter the test, your results will be displayed and saved for future reference.',
                style: TextStyle(
                  color: mainTheme,
                  fontFamily: 'DM Sans Regular',
                  fontSize: 18.0,
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            SizedBox(
              height: 58,
              width: 326,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: mainTheme,
                  side: const BorderSide(color: mainTheme),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Ishihara()),
                  );
                },
                child: const Text(
                  'Start Test',
                  style: TextStyle(
                    color: whitebutnotwhite,
                    fontFamily: 'DM Sans Regular',
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
