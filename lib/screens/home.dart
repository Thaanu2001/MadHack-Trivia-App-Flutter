import 'package:flutter/material.dart';
import 'package:madhack_trivia/screens/trivia_screen.dart';
import 'package:madhack_trivia/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff05A8E1),
      body: SafeArea(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18),
                        child: Image.asset('assets/logo.png'),
                      ),
                      Text(
                        'MadHack Trivia',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xff224A93),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CustomButton(
              title: 'Start Trivia',
              onTap: () {
                Route route = MaterialPageRoute(
                  builder: (context) => TrivaScreen(),
                );
                Navigator.push(context, route);
              },
            ),
          ],
        ),
      ),
    );
  }
}
