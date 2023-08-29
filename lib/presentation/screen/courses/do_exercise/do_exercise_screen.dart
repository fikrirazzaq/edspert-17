import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:learning/domain/entity/question_answer.dart';

import 'package:learning/domain/entity/question_list_response_entity.dart';
import 'package:learning/presentation/screen/courses/do_exercise/do_exercise_controller.dart';
import 'package:learning/values/colors.dart';

import '../widgets/option_widget.dart';
import '../widgets/questions_number_widget.dart';

class DoExerciseScreen extends StatelessWidget {
  const DoExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoExerciseController>(
      builder: (controller) {
        print('questionList: ${controller.questionList}');
        List<QuestionListDataEntity> questions = controller.questionList;
        int activeQuestionIndex = controller.activeQuestionIndex;
        QuestionListDataEntity activeQuestion = questions[activeQuestionIndex];
        List<QuestionAnswer> questionAnswers = controller.questionAnswers;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Latihan Soal'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              QuestionsNumberWidget(
                questions: questions,
                activeQuestionIndex: activeQuestionIndex,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Text('Soal Nomor ${activeQuestionIndex + 1}'),
                    HtmlWidget(
                      activeQuestion.questionTitle,
                    ),
                    OptionWidget(
                      onTap: () {
                        controller.updateAnswerToQuestion(
                          questionId: activeQuestion.questionId,
                          answer: 'A',
                        );
                      },
                      isSelected:
                          questionAnswers.any((e) => e.questionId == activeQuestion.questionId && e.answer == 'A'),
                      optionLetter: 'A',
                      optionContent: activeQuestion.optionA,
                    ),
                    OptionWidget(
                      onTap: () {
                        controller.updateAnswerToQuestion(
                          questionId: activeQuestion.questionId,
                          answer: 'B',
                        );
                      },
                      isSelected:
                          questionAnswers.any((e) => e.questionId == activeQuestion.questionId && e.answer == 'B'),
                      optionLetter: 'B',
                      optionContent: activeQuestion.optionB,
                    ),
                    OptionWidget(
                      onTap: () {
                        controller.updateAnswerToQuestion(
                          questionId: activeQuestion.questionId,
                          answer: 'C',
                        );
                      },
                      isSelected:
                          questionAnswers.any((e) => e.questionId == activeQuestion.questionId && e.answer == 'C'),
                      optionLetter: 'C',
                      optionContent: activeQuestion.optionC,
                    ),
                    OptionWidget(
                      onTap: () {
                        controller.updateAnswerToQuestion(
                          questionId: activeQuestion.questionId,
                          answer: 'D',
                        );
                      },
                      isSelected:
                          questionAnswers.any((e) => e.questionId == activeQuestion.questionId && e.answer == 'D'),
                      optionLetter: 'D',
                      optionContent: activeQuestion.optionD,
                    ),
                    OptionWidget(
                      onTap: () {
                        controller.updateAnswerToQuestion(
                          questionId: activeQuestion.questionId,
                          answer: 'E',
                        );
                      },
                      isSelected:
                          questionAnswers.any((e) => e.questionId == activeQuestion.questionId && e.answer == 'E'),
                      optionLetter: 'E',
                      optionContent: activeQuestion.optionE,
                    ),
                    if (activeQuestionIndex < 9)
                      ElevatedButton(
                        onPressed: () {
                          controller.navigateToQuestionIndex(activeQuestionIndex + 1);
                        },
                        child: Text('Selanjutnya'),
                      )
                    else
                      ElevatedButton(
                        onPressed: () {
                          Get.bottomSheet(
                            Wrap(
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Kumpulkan latihan soal sekarang?'),
                                    Row(
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text('Nanti dulu'),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            controller.submitAnswers();
                                          },
                                          child: Text('Ya'),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            backgroundColor: Colors.white,
                          );
                        },
                        child: Text('Kumpulin'),
                      ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
