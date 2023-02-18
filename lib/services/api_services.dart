import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:madhack_trivia/model/question_model.dart';

class ApiServices {
  Future<List<Question>> fetchQuestions() async {
    final response = await http.get(Uri.parse(
        'https://us-central1-madhacktrivia.cloudfunctions.net/app/questions'));

    if (response.statusCode == 200) {
      List tempList = (json.decode(response.body)['data']) as List;
      return tempList
          .map(
            (e) => Question(
              e['id'],
              e['question'],
              e['answer_a'],
              e['answer_b'],
              e['answer_c'],
              e['answer_d'],
              e['correct_answer'],
            ),
          )
          .toList();
    } else {
      return [];
    }
  }
}
