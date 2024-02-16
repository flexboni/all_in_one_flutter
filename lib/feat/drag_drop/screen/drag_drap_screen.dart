import 'package:all_in_one_flutter/core/widgets/widgets.dart';
import 'package:all_in_one_flutter/feat/drag_drop/controller/drag_drop_controller.dart';
import 'package:all_in_one_flutter/feat/drag_drop/screen/views/drag_drap_list_item.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      dragDropControllerProvider
          .select((value) => value.value?.curriculumDatas),
      (previous, next) {
        if (next != null && previous != next) {
          _leftItems = next
              .map(
                (e) => DragAndDropList(
                  header: Center(child: Text('${e.day}')),
                  children: e.items
                      .map(
                        (item) => DragAndDropItem(
                          child: DragDropListItem(
                            title: item.title,
                            grade: item.grade,
                            day: e.day,
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
      body: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: DragAndDropLists(
                    children: _leftItems,
                    onItemReorder: (
                      oldItemIndex,
                      oldListIndex,
                      newItemIndex,
                      newListIndex,
                    ) {},
                    onListReorder: (oldListIndex, newListIndex) {},
                  ),
                ),
              ),
              Container(
                width: 1,
                height: double.maxFinite,
                color: Colors.black,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: DragAndDropLists(
                    children: _rightItems,
                    onItemReorder: (
                      oldItemIndex,
                      oldListIndex,
                      newItemIndex,
                      newListIndex,
                    ) {},
                    onListReorder: (oldListIndex, newListIndex) {},
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
