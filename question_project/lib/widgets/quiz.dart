import 'package:flutter/material.dart';
import 'package:question_project/widgets/answer_button.dart';
import 'package:question_project/widgets/question_title.dart';

class Quiz extends StatelessWidget {
  final int selectedQuestion;
  final void Function(int) onAnswer;
  final List<Map<String, Object>> questions;

  Quiz({
    Key key,
    @required this.selectedQuestion,
    @required this.questions,
    @required this.onAnswer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<AnswerButton> answerButtons =
        (questions[selectedQuestion]['answers'] as List<Map<String, Object>>)
            .map(
              (element) => AnswerButton(
                text: element['text'],
                onPressed: () {
                  onAnswer(element['pontuation']);
                },
              ),
            )
            .toList();

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          QuestionTitle(
            text: questions[selectedQuestion]['text'],
          ),
          ...answerButtons,
        ],
      ),
    );
  }
}
