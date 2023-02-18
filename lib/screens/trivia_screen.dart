import 'package:flutter/material.dart';
import 'package:madhack_trivia/services/api_services.dart';
import 'package:madhack_trivia/widgets/custom_answer_button.dart';
import 'package:madhack_trivia/widgets/custom_button.dart';

import '../model/question_model.dart';

class TrivaScreen extends StatefulWidget {
  const TrivaScreen({super.key});

  @override
  State<TrivaScreen> createState() => _TrivaScreenState();
}

class _TrivaScreenState extends State<TrivaScreen> {
  List<Question> question = [];
  Map<int, String> answers = {};

  @override
  void initState() {
    super.initState();
    fetchQuestionList();
  }

  void fetchQuestionList() async {
    List<Question> tempList = await ApiServices().fetchQuestions();
    setState(() {
      question = tempList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff05A8E1),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: question.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                            question[index].question,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        CustomAnswerButton(
                          text: question[index].answerA,
                          isSelected: answers[question[index].id] == 'A',
                          onTap: () {
                            setState(() {
                              if (answers[question[index].id] != 'A') {
                                answers[question[index].id] = 'A';
                              } else {
                                answers.remove(question[index].id);
                              }
                            });
                          },
                        ),
                        CustomAnswerButton(
                          text: question[index].answerB,
                          isSelected: answers[question[index].id] == 'B',
                          onTap: () {
                            setState(() {
                              if (answers[question[index].id] != 'B') {
                                answers[question[index].id] = 'B';
                              } else {
                                answers.remove(question[index].id);
                              }
                            });
                          },
                        ),
                        CustomAnswerButton(
                          text: question[index].answerC,
                          isSelected: answers[question[index].id] == 'C',
                          onTap: () {
                            setState(() {
                              if (answers[question[index].id] != 'C') {
                                answers[question[index].id] = 'C';
                              } else {
                                answers.remove(question[index].id);
                              }
                            });
                          },
                        ),
                        CustomAnswerButton(
                          text: question[index].answerD,
                          isSelected: answers[question[index].id] == 'D',
                          onTap: () {
                            setState(() {
                              if (answers[question[index].id] != 'D') {
                                answers[question[index].id] = 'D';
                              } else {
                                answers.remove(question[index].id);
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 20, bottom: MediaQuery.of(context).padding.bottom),
            child: CustomButton(
              title: 'Complete Quiz',
              onTap: () {
                int total = 0;

                for (Question question in question) {
                  if (question.correctAnswer == answers[question.id]) {
                    total += 10;
                  }
                }

                resultsPopup(total);
              },
            ),
          ),
        ],
      ),
    );
  }

  resultsPopup(int total) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Your have scored $total out of 100'),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
