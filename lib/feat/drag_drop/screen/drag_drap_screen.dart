import 'package:all_in_one_flutter/core/widgets/widgets.dart';
import 'package:all_in_one_flutter/feat/drag_drop/controller/drag_drop_controller.dart';
import 'package:all_in_one_flutter/feat/drag_drop/model/curriculum.dart';
import 'package:all_in_one_flutter/feat/drag_drop/screen/views/drag_drap_list_item.dart';
import 'package:all_in_one_flutter/gen/assets.gen.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DragDropScreen extends ConsumerStatefulWidget {
  const DragDropScreen({super.key});

  @override
  ConsumerState<DragDropScreen> createState() => _DragDropScreenState();
}

class _DragDropScreenState extends ConsumerState<DragDropScreen> {
  List<DragAndDropList> _leftItems = [];
  List<DragAndDropList> _rightItems = [];

  void init() {
    ref.listenManual(
      dragDropControllerProvider.select((value) => value.value?.subjectList),
      (previous, next) {
        if (next != null && previous != next) {
          _leftItems = next
              .map(
                (e) => DragAndDropList(
                  header: Center(child: Text(e.title)),
                  children: e.items
                      .map(
                        (item) => DragAndDropItem(
                          child: DragDropListItem(
                            type: item.type,
                            title: item.title,
                            grade: item.grade,
                            count: item.count,
                          ),
                        ),
                      )
                      .toList(),
                ),
              )
              .toList();

          setState(() {});
        }
      },
    );

    ref.listenManual(
      dragDropControllerProvider.select((value) => value.value?.todyLearnList),
      (previous, next) {
        if (next != null && previous != next) {
          _rightItems = next
              .map(
                (e) => DragAndDropList(
                  header: Center(child: Text(e.title)),
                  children: e.items
                      .map(
                        (item) => DragAndDropItem(
                          child: DragDropListItem(
                            isRequired: item.type == CurriculumType.lecture,
                            type: item.type,
                            title: item.title,
                            grade: item.grade,
                            count: item.count,
                          ),
                        ),
                      )
                      .toList(),
                ),
              )
              .toList();

          setState(() {});
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  Widget build(BuildContext context) {
    return Parents(
      title: 'Drag and Drop',
      body: DragAndDropLists(
        children: _leftItems,
        axis: Axis.horizontal,
        listWidth: MediaQuery.of(context).size.width * 0.5,
        listPadding: EdgeInsets.symmetric(horizontal: 16.w),
        listDivider: Container(
          width: 1,
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(border: Border.all()),
            child: Assets.icons.dragDrop.icNextSlide24.svg(),
          ),
        ),
        itemOnWillAccept: (incoming, target) {
          // Drop 전에 Ghost 리스트 변화 없애려고 사용함
          return false;
        },
        itemTargetOnWillAccept: (incoming, target) {
          // Drop 전에 Ghost 리스트 변화 없애려고 사용함
          return false;
        },
        onItemReorder: (
          oldItemIndex,
          oldListIndex,
          newItemIndex,
          newListIndex,
        ) {},
        onListReorder: (oldListIndex, newListIndex) {},
      ),
    );
  }
}
