import 'package:all_in_one_flutter/constant/constants.dart';
import 'package:all_in_one_flutter/core/utils/toast_utils.dart';
import 'package:all_in_one_flutter/core/utils/utils.dart';
import 'package:all_in_one_flutter/core/widgets/error_default.dart';
import 'package:all_in_one_flutter/core/widgets/parents.dart';
import 'package:all_in_one_flutter/core/widgets/progress_bar.dart';
import 'package:all_in_one_flutter/feat/pencil/controller/pencil_controller.dart';
import 'package:all_in_one_flutter/feat/pencil/controller/pencil_state.dart';
import 'package:all_in_one_flutter/feat/pencil/model/exam.dart';
import 'package:all_in_one_flutter/feat/pencil/model/question.dart';
import 'package:all_in_one_flutter/feat/pencil/screen/app_pencil_kit.dart';
import 'package:all_in_one_flutter/feat/pencil/screen/view/problem_view.dart';
import 'package:all_in_one_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pencil_kit/pencil_kit.dart';

class PencilScreen extends ConsumerStatefulWidget {
  const PencilScreen({super.key});

  @override
  ConsumerState<PencilScreen> createState() => _PencilScreenState();
}

class _PencilScreenState extends ConsumerState<PencilScreen>
    with TickerProviderStateMixin {
  PencilKitController? _controller;

  final double _previousScale = 1.0;
  final double _scale = 1.0;

  final Offset _prevPosition = Offset.zero;
  final Offset _position = Offset.zero;

  void init() async {
    ref.listenManual(
      pencilControllerProvider,
      (previous, next) {
        if (next.hasError) {
          ToastUtils.error(next.error.toString());
        }
      },
    );

    ref.listenManual(
      pencilControllerProvider.select((value) => value.value?.currentIndex),
      (previous, next) async {
        if (previous != next && next != null) {
          final Question? question =
              ref.read(pencilControllerProvider).value?.exam.questions[next];
          if (question != null && _controller != null) {
            final String path =
                await FileUtils.createDocumentPath(endpoint: question.code);
            _controller!.load(uri: path, withBase64Data: true);
          }
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();

    init();
  }

  void onResult({required Question question, required String? value}) {
    ref
        .read(pencilControllerProvider.notifier)
        .updateQuestion(question.copyWith(problemAnswer: value));
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<PencilState> asyncPencil =
        ref.watch(pencilControllerProvider);

    return Parents(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: const Text('Pencil'),
        actions: [
          Builder(
            builder: (ctx) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(ctx).openEndDrawer();
                },
                icon: Assets.images.pencil.collect24.image(),
              );
            },
          ),
        ],
        bottom: _controller != null
            ? PreferredSize(
                preferredSize: Size.fromHeight(32.w),
                child: PencilToolKit(
                  controller: _controller!,
                  mainColor: Colors.black,
                ),
              )
            : null,
      ),
      body: asyncPencil.when(
        data: (data) {
          final Question question = data.exam.questions[data.currentIndex];

          return Stack(
            children: [
              Stack(
                children: [
                  const ProblemView(),
                  AppPencilKit(
                    onPencilKitViewCreated: (controller) {
                      setState(() {
                        _controller = controller;
                      });
                    },
                  ),
                ],
              ),
              Positioned(
                top: 30,
                right: 30,
                child: question.answers.length == 5
                    ? MultipleAnswerInput(
                        width: MediaQuery.of(context).size.width * 0.2,
                        question: question,
                        onResult: (String? value) =>
                            onResult(question: question, value: value),
                      )
                    : SubjectiveAnswerInput(
                        question: question,
                        onResult: (String? value) =>
                            onResult(question: question, value: value),
                      ),
              ),
              slider(exam: data.exam, currentIndex: data.currentIndex),
            ],
          );
        },
        error: (error, stacktrace) {
          return ErrorDefault(error: error.toString());
        },
        loading: () => const ProgressBar(),
      ),
    );
  }

  Widget slider({required Exam exam, required int currentIndex}) {
    final int total = exam.total;
    int sliderValue = currentIndex;
    int secondaryValue = exam.total != 0 ? total - 1 : 0;

    Future<void> onSaveData(int index) async {
      final Question question = exam.questions[currentIndex];
      final String path =
          await FileUtils.createDocumentPath(endpoint: '${question.code}');
      final String? write =
          await _controller!.save(uri: path, withBase64Data: true);

      _controller!.clear();

      ref.read(pencilControllerProvider.notifier).updateQuestion(
            exam.questions[currentIndex].copyWith(problemDraw: write),
          );

      ref
          .read(pencilControllerProvider.notifier)
          .updateValues(currentIndex: index);

      setState(() {});
    }

    Future<void> onChangedSlider(int value) async {
      if (_controller == null) {
        ToastUtils.error(Strings.ERROR_SAVE_INFO);
        return;
      }

      onSaveData(value.toInt());
    }

    void onPrevious() {
      if (_controller == null) {
        ToastUtils.error(Strings.ERROR_STATE_INFO_IS_NULL);
        return;
      }

      onSaveData(sliderValue - 1);
    }

    Future<void> onNext() async {
      if (_controller == null) {
        ToastUtils.error(Strings.ERROR_SAVE_INFO);
        return;
      }

      onSaveData(sliderValue + 1);
    }

    Future<void> onFinish() async {
      String title = Strings.TEST_SUBMIT_POPUP_TITLE_FINAL;
      String content = Strings.TEST_SUBMIT_POPUP_CONTENT_FINAL;

      final List<Question> notSolvedQuestions = exam.questions
          .where((element) => element.problemAnswer == null)
          .toList();
      if (notSolvedQuestions.isNotEmpty) {
        title = Strings.TEST_SUBMIT_POPUP_TITLE_FINAL_NOT_SOLVED;
        content =
            '${Strings.TEST_SUBMIT_POPUP_CONTENT_FINAL_PREFIX}${notSolvedQuestions.length}${Strings.TEST_SUBMIT_POPUP_CONTENT_FINAL_POSTFIX}';
      }

      final bool? result = await showDialog<bool?>(
        context: context,
        builder: (_) => ProblemSubmitDialog(title: title, content: content),
      );
      if (result == null || !result) {
        return;
      }

      await ref.read(pencilControllerProvider.notifier).save(exam);
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: ProblemSliderWithMoveButtons(
        onChangedSlider: (value) => onChangedSlider(value.toInt()),
        onPrevious: sliderValue == 0.0 ? null : onPrevious,
        onNext: onNext,
        onFinish: onFinish,
        sliderValue: sliderValue.toDouble(),
        maxValue: (exam.total - 1).toDouble(),
        secondaryTrackValue: secondaryValue.toDouble(),
      ),
    );
  }
}
