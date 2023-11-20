// ignore_for_file: non_constant_identifier_names

class QuizQuestionModel {
  QuizQuestionModel({
    this.id,
    required this.question,
    required this.answer,
    required this.alternatives_list,
  });

  int? id;
  String question;
  String answer;
  String alternatives_list;
}

class QuizAnswerModel {
  QuizAnswerModel({
    this.id,
    required this.responses_list,
  });

  int? id;
  List<ResponseModel> responses_list;
}

class ResponseModel {
  ResponseModel({
    required this.question_id,
    required this.response,
  });

  int question_id;
  String response;
}

