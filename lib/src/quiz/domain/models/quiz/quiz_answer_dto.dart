import 'dart:convert';

class QuizDTOAnswer {
  QuizDTOAnswer({
    required this.code,
    required this.title,
  });

  factory QuizDTOAnswer.fromMap(Map<String, dynamic> map) {
    return QuizDTOAnswer(
      code: map['code'] as String,
      title: map['title'] as String,
    );
  }

  factory QuizDTOAnswer.fromJson(String source) =>
      QuizDTOAnswer.fromMap(json.decode(source) as Map<String, dynamic>);

  final String code;
  final String title;

  QuizDTOAnswer copyWith({
    String? code,
    String? title,
  }) {
    return QuizDTOAnswer(
      code: code ?? this.code,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'title': title,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'QuizDTOAnswer(code: $code, title: $title)';

  @override
  bool operator ==(covariant QuizDTOAnswer other) {
    if (identical(this, other)) return true;

    return other.code == code && other.title == title;
  }

  @override
  int get hashCode => code.hashCode ^ title.hashCode;
}
