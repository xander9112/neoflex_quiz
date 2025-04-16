// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:neoflex_quiz/src/quiz/_quiz.dart';

class QuizDTO {
  QuizDTO({
    required this.code,
    required this.title,
    required this.answer,
    this.answers = const [],
  });

  final String code;
  final String title;
  final String answer;
  final List<QuizDTOAnswer> answers;

  QuizDTO copyWith({
    String? code,
    String? title,
    String? answer,
    List<QuizDTOAnswer>? answers,
  }) {
    return QuizDTO(
      code: code ?? this.code,
      title: title ?? this.title,
      answer: answer ?? this.answer,
      answers: answers ?? this.answers,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'title': title,
      'answer': answer,
      'answers': answers.map((x) => x.toMap()).toList(),
    };
  }

  factory QuizDTO.fromMap(Map<String, dynamic> map) {
    return QuizDTO(
      code: map['code'] as String,
      title: map['title'] as String,
      answer: map['answer'] as String,
      answers: List<QuizDTOAnswer>.from(
        (map['answers'] as List<dynamic>).map<QuizDTOAnswer>(
          (e) => QuizDTOAnswer.fromMap(e as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizDTO.fromJson(String source) =>
      QuizDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuizDTO(code: $code, title: $title, answer: $answer, answers: $answers)';
  }

  @override
  bool operator ==(covariant QuizDTO other) {
    if (identical(this, other)) return true;

    return other.code == code &&
        other.title == title &&
        other.answer == answer &&
        listEquals(other.answers, answers);
  }

  @override
  int get hashCode {
    return code.hashCode ^ title.hashCode ^ answer.hashCode ^ answers.hashCode;
  }
}
