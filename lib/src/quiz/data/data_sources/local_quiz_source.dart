import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:neoflex_quiz/src/quiz/domain/models/quiz/quiz_dto.dart';

class LocalQuizSource {
  Future<dynamic> _loadJsonFromFile(String fileName) async {
    try {
      final String fileContent = await rootBundle.loadString(
        'assets/$fileName.json',
      );

      return jsonDecode(fileContent);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<QuizDTO>> getQuestions([String name = 'questions']) async {
    final response = await _loadJsonFromFile(name);

    try {
      return (response as List).map((e) {
        return QuizDTO.fromMap(e as Map<String, dynamic>);
      }).toList();
    } on Exception catch (_) {
      return [];
    }
  }
}
