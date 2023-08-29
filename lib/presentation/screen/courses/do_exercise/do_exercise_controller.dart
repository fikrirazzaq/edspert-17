import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:learning/data/model/submit_answer_request_model.dart';
import 'package:learning/domain/entity/exercise_result_response_entity.dart';
import 'package:learning/domain/entity/question_list_response_entity.dart';

import '../../../../domain/entity/question_answer.dart';
import '../../../../domain/repository/course_repository.dart';
import '../../../router/routes.dart';

class DoExerciseController extends GetxController {
  final CourseRepository courseRepository;

  DoExerciseController(this.courseRepository);

  // Currently set to static
  late String exerciseId;

  @override
  void onInit() {
    super.onInit();

    exerciseId = Get.arguments as String;
    Future.delayed(const Duration(milliseconds: 100)).then((value) async {
      await getQuestions();
    });
  }

  /// Questions
  List<QuestionListDataEntity> questionList = [];

  /// Get Dari API Get Questions
  Future<void> getQuestions() async {
    QuestionListResponseEntity result = await courseRepository.getQuestionsByExercise(exerciseId);
    questionList = result.data;
    if (questionList.isNotEmpty) {
      // Init jawaban yang sudah diisi
      _initStudentAnsweredQuestions();

      // Set soal aktif ke nomor 1
      activeQuestionId = questionList.first.questionId;
    }
    update();
  }

  void _initStudentAnsweredQuestions() {
    for (QuestionListDataEntity data in questionList) {
      if (questionAnswers.any((element) => element.questionId == data.questionId)) {
        int indexToUpdate = questionAnswers.indexWhere((element) => element.questionId == data.questionId);
        questionAnswers[indexToUpdate] = QuestionAnswer(questionId: data.questionId, answer: data.studentAnswer);
      } else {
        questionAnswers.add(QuestionAnswer(questionId: data.questionId, answer: data.studentAnswer));
      }
      update();
    }
  }

  /// Answers
  List<QuestionAnswer> questionAnswers = List.empty(growable: true); // []
  int activeQuestionIndex = 0;
  String activeQuestionId = '';
  bool submitAnswerLoading = false;

  void navigateToQuestionIndex(int index) {
    activeQuestionIndex = index;
    try {
      activeQuestionId = questionList[activeQuestionIndex].questionId ?? '';
    } catch (e) {
      // Ignore
    }
    update();
  }

  void updateAnswerToQuestion({required String questionId, required String answer}) {
    /// Check dulu, apakah jawabannya ada?
    if (questionAnswers.any((element) => element.questionId == questionId)) {
      int indexToUpdate = questionAnswers.indexWhere((element) => element.questionId == questionId);
      questionAnswers[indexToUpdate] = QuestionAnswer(questionId: questionId, answer: answer);
    } else {
      print('question: $questionId');
      questionAnswers.add(QuestionAnswer(questionId: questionId, answer: answer));
    }
    update();
  }

  double scoreResult = 0;
  Future<void> submitAnswers() async {
    String? email = FirebaseAuth.instance.currentUser?.email;
    submitAnswerLoading = true;
    update();

    if (questionAnswers.length == 10) {
      List<String> questionIds = questionAnswers.map((element) => element.questionId).toList();
      // ["Q1", "Q2", ....]
      List<String> answers = questionAnswers.map((e) => e.answer).toList();
      // ["A", "C", ....]

      /// Submit Answer API Call
      bool submitAnswersResult = await courseRepository.submitExerciseAnswer(SubmitAnswerRequestModel(
        userEmail: email ?? '',
        exerciseId: exerciseId,
        questionIds: questionIds,
        answers: answers,
      ));

      if (submitAnswersResult == true) {
        /// Get Exercise Result API Call
        ExerciseResultResponseEntity? exerciseResult = await courseRepository.getExerciseResult(exerciseId);
        scoreResult = double.tryParse(exerciseResult.data.result.jumlahScore ?? '0') ?? 0;
        Get.back(); // Close Bottomsheet Yes/No Kumpulin
        Get.back(); // Close DoExercise Page
        Get.toNamed(Routes.exerciseResult);
      }
      submitAnswerLoading = false;
      update();
    } else {
      Get.snackbar('Semua harus diisi!', 'Periksa kembali jawaban anda.', snackPosition: SnackPosition.BOTTOM);
    }
  }
}
