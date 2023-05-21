import 'package:eyecu/screens/d15/d15_instructions.dart';
import 'package:flutter/material.dart';

import 'package:eyecu/constants.dart';

class D15Onboarding extends StatelessWidget {
  const D15Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whitebutnotwhite,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: mainTheme, // Set color of back button to black
        ),
      ),
      body: Container(
        color: whitebutnotwhite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: const [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20)),
                Text("Arrangment Test",
                    style: TextStyle(
                        color: mainTheme,
                        fontFamily: 'DM Sans Regular',
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: const [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20)),
                Flexible(
                  child: SizedBox(
                    width: 310,
                    child: Text(
                        textAlign: TextAlign.justify,
                        "Farnsworth D15 is a type of arrangement test that is used to assess color vision deficiency by evaluating the ability to arrange colored tiles in a specific order.",
                        style: TextStyle(
                          color: mainTheme,
                          fontFamily: 'DM Sans Regular',
                          fontSize: 15.0,
                        )),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 326,
              height: 326,
              child: Card(
                color: softPurple,
                child: InkWell(
                  splashColor: mainTheme,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Ink.image(
                        image: (const AssetImage(
                            "assets/images/arrangement-test.png")),
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                        colorFilter:
                            const ColorFilter.mode(mainTheme, BlendMode.srcIn),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
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
                    side: const BorderSide(color: mainTheme)),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const D15Instructions()),
                  );
                },
                child: const Text(
                  'Get Started',
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
