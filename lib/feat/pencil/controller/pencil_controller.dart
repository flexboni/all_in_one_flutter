import 'package:all_in_one_flutter/constant/constants.dart';
import 'package:all_in_one_flutter/core/utils/utils.dart';
import 'package:all_in_one_flutter/feat/pencil/controller/pencil_state.dart';
import 'package:all_in_one_flutter/feat/pencil/model/answer.dart';
import 'package:all_in_one_flutter/feat/pencil/model/exam.dart';
import 'package:all_in_one_flutter/feat/pencil/model/question.dart';
import 'package:all_in_one_flutter/gen/assets.gen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pencil_controller.g.dart';

@riverpod
class PencilController extends _$PencilController {
  Future<Exam> _getExam() async {
    final Map<String, dynamic> response =
        await FileUtils.readJsonFile(Assets.json.problems);

    return Exam.fromJson(response);
  }

  @override
  FutureOr<PencilState> build() async {
    final Exam exam = await _getExam();

    return PencilState.initial().copyWith(exam: exam);
  }

  Future<void> updateValues({int? currentIndex}) async {
    if (!state.hasValue) {
      state = AsyncError(Strings.ERROR_STATE_INFO_IS_NULL, StackTrace.current);
      return;
    }

    PencilState prevState = state.value!;

    state = AsyncData(
      prevState.copyWith(currentIndex: currentIndex ?? prevState.currentIndex),
    );
  }

  Future<void> save(Exam exam) async {
    if (!state.hasValue) {
      state = AsyncError(Strings.ERROR_STATE_INFO_IS_NULL, StackTrace.current);
      return;
    }

    List<Answer> answers = exam.questions.map((element) {
      final String? problemAnswer = element.problemAnswer;
      return Answer.initial().copyWith(
        code: element.code,
        isCorrect: problemAnswer != null &&
                element.answersCorrects.first == problemAnswer
            ? Correct.T
            : Correct.F,
      );
    }).toList();
  }

  void updateQuestion(Question question) {
    if (!state.hasValue) {
      state = AsyncError(Strings.ERROR_STATE_INFO_IS_NULL, StackTrace.current);
      return;
    }

    PencilState prevState = state.value!;

    List<Question> questions = [...prevState.exam.questions];
    final int index =
        questions.indexWhere((element) => element.code == question.code);
    questions.removeAt(index);
    questions.insert(index, question);

    state = AsyncData(
      prevState.copyWith(exam: prevState.exam.copyWith(questions: questions)),
    );
  }
}
