class Question {
  String name;
  String duration;
  String question;
  Map option;
  String answer;

  Question(
    this.name,
    this.duration,
    this.question,
    this.option,
    this.answer,
  );
  Question.fromJson(Map<String, dynamic> data)
      : name = data['name'],
        duration = data['duration'],
        question = data['question'],
        option = data['option'],
        answer = data['answer'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'duration': duration,
        'question': question,
        'option': option,
        'answer': answer
      };
// "name": "Ash",
//     "duration": "3:00",
//     "question": "1. What does an HTML tag do?",
//     "option": {
//       "option_a": "A",
//       "option_b": "B",
//       "option_c": "C",
//       "option_d": "D"
//     },
//     "answer": "option_c"
}
