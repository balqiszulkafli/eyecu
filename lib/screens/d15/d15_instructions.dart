import 'package:eyecu/constants.dart';
import 'package:eyecu/screens/d15/d15.dart';
import 'package:flutter/material.dart';

class D15Instructions extends StatelessWidget {
  const D15Instructions({Key? key}) : super(key: key);

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
                '1. This test requires you to arrange 15 colored blocks in order of hue, from light to dark.\n\n2. To take the test, you will be presented with a set of 15 colored squares in a random order.\n\n3. To arrange the blocks, click and drag each block to the appropriate position on the test plate.\n\n4. You must arrange the blocks in order of hue, from lightest to darkest.\n\n\nOnce you have arranged the blocks to the best of your ability, you will be given a score based on your performance.',
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
                    MaterialPageRoute(builder: (context) => const D15()),
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
