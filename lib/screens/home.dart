import 'package:eyecu/constants.dart';
import 'package:eyecu/screens/d15/d15_onboarding.dart';
import 'package:eyecu/screens/falant/falant_onboarding.dart';
import 'package:eyecu/screens/ishihara/ishihara_onboarding.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          //Container for big title
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text("Welcome to \nEyeCu",
                style: TextStyle(
                    color: mainTheme,
                    fontFamily: 'DM Sans Regular',
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold)),
          ),

          //Container for description
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: const Text(
                "Colour vision deficiency affecting around 1 in 12 males and 1 in 200 females worldwide",
                style: TextStyle(
                    fontFamily: 'DM Sans Regular',
                    color: mainTheme,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold)),
          ),
          Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: 170,
                              height: 170,
                              child: Card(
                                color: softPurple,
                                child: InkWell(
                                  splashColor: Colors.black26,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const IshiharaOnboarding()),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Ink.image(
                                        image: (const AssetImage(
                                            "assets/images/ishihara-test.png")),
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                        colorFilter: const ColorFilter.mode(
                                            mainTheme, BlendMode.srcIn),
                                      ),
                                      const SizedBox(height: 8),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              'Pseudo-isochromatic \nPlates (PiP)',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'DM Sans Regular',
                                  fontSize: 16,
                                  color: blackbutnotblack,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: 170,
                              height: 170,
                              child: Card(
                                color: softPurple,
                                child: InkWell(
                                  splashColor: Colors.black26,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const D15Onboarding()),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Ink.image(
                                        image: (const AssetImage(
                                            "assets/images/arrangement-test.png")),
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                        colorFilter: const ColorFilter.mode(
                                            mainTheme, BlendMode.srcIn),
                                      ),
                                      const SizedBox(height: 6),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              'Arrangment Test',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'DM Sans Regular',
                                  fontSize: 16,
                                  color: blackbutnotblack,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 170,
                          height: 170,
                          child: Card(
                            color: softPurple,
                            child: InkWell(
                              splashColor: Colors.black26,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const FalantOnboarding()),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Ink.image(
                                    image: (const AssetImage(
                                        "assets/images/lantern-test.png")),
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                    colorFilter: const ColorFilter.mode(
                                        mainTheme, BlendMode.srcIn),
                                  ),
                                  const SizedBox(height: 6),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          'Lantern Test',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'DM Sans Regular',
                              fontSize: 16,
                              color: blackbutnotblack,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
