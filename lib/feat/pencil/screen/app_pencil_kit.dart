import 'package:all_in_one_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pencil_kit/pencil_kit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_pencil_kit.freezed.dart';
part 'app_pencil_kit.g.dart';

enum RevertType { undo, redo }

enum EtcType { clear }

@freezed
class DrawToolModel<T> with _$DrawToolModel<T> {
  const factory DrawToolModel({
    required T type,
    required String unselectedImage,
    required String selectedImage,
    required bool isSelected,
  }) = _DrawToolModel<T>;

  factory DrawToolModel.initial(T type) => DrawToolModel(
        type: type,
        unselectedImage: '',
        selectedImage: '',
        isSelected: false,
      );
}

@riverpod
class AppPencilKitController extends _$AppPencilKitController {
  @override
  FutureOr<bool> build() {
    return true;
  }

  void changeVisibility(bool show) {
    state = AsyncData(show);
  }
}

class PencilToolKit extends StatefulWidget {
  const PencilToolKit(
      {super.key, required this.controller, required this.mainColor});

  final PencilKitController controller;
  final Color mainColor;

  @override
  State<PencilToolKit> createState() => _PencilToolKitState();
}

class _PencilToolKitState extends State<PencilToolKit> {
  ToolType selectedToolType = ToolType.pencil;
  late Color selectedColor;
  double selectedWidth = 4.0;

  double height = 28.w;
  double iconSize = 24.w;

  late List<DrawToolModel<ToolType>> drawTools;
  List<DrawToolModel<Color>> colorKits = [];
  late List<DrawToolModel<double>> widthKits;
  late List<DrawToolModel<RevertType>> revertKits;
  late List<DrawToolModel<EtcType>> etcKits;

  @override
  void initState() {
    super.initState();

    selectedColor = widget.mainColor;

    drawTools = [
      DrawToolModel<ToolType>.initial(ToolType.pencil).copyWith(
        unselectedImage: Assets.images.pencil.toolPencilOff.path,
        selectedImage: Assets.images.pencil.toolPencilOn.path,
        isSelected: true,
      ),
      DrawToolModel<ToolType>.initial(ToolType.pen).copyWith(
        unselectedImage: Assets.images.pencil.toolPenOff.path,
        selectedImage: Assets.images.pencil.toolPenOn.path,
      ),
      DrawToolModel<ToolType>.initial(ToolType.marker).copyWith(
        unselectedImage: Assets.images.pencil.toolMarkerOff.path,
        selectedImage: Assets.images.pencil.toolMarkerOn.path,
      ),
      DrawToolModel<ToolType>.initial(ToolType.eraserVector).copyWith(
        unselectedImage: Assets.images.pencil.toolEraserOff.path,
        selectedImage: Assets.images.pencil.toolEraserOn.path,
      ),
    ];

    colorKits = [
      DrawToolModel<Color>.initial(selectedColor).copyWith(
        unselectedImage: Assets.images.pencil.toolColorBlackOff.path,
        selectedImage: Assets.images.pencil.toolColorBlackOn.path,
        isSelected: true,
      ),
      DrawToolModel<Color>.initial(Colors.red).copyWith(
        unselectedImage: Assets.images.pencil.toolColorRedOff.path,
        selectedImage: Assets.images.pencil.toolColorRedOn.path,
      ),
      DrawToolModel<Color>.initial(Colors.green).copyWith(
        unselectedImage: Assets.images.pencil.toolColorGreenOff.path,
        selectedImage: Assets.images.pencil.toolColorGreenOn.path,
      ),
      DrawToolModel<Color>.initial(Colors.blue).copyWith(
        unselectedImage: Assets.images.pencil.toolColorBlueOff.path,
        selectedImage: Assets.images.pencil.toolColorBlueOn.path,
      ),
    ];

    widthKits = [
      DrawToolModel<double>.initial(4.0).copyWith(
        unselectedImage: Assets.images.pencil.toolLineWeight4Off.path,
        selectedImage: Assets.images.pencil.toolLineWeight4On.path,
        isSelected: true,
      ),
      DrawToolModel<double>.initial(6.0).copyWith(
        unselectedImage: Assets.images.pencil.toolLineWeight6Off.path,
        selectedImage: Assets.images.pencil.toolLineWeight6On.path,
      ),
      DrawToolModel<double>.initial(10.0).copyWith(
        unselectedImage: Assets.images.pencil.toolLineWeight10Off.path,
        selectedImage: Assets.images.pencil.toolLineWeight10On.path,
      ),
      DrawToolModel<double>.initial(16.0).copyWith(
        unselectedImage: Assets.images.pencil.toolLineWeight16Off.path,
        selectedImage: Assets.images.pencil.toolLineWeight16On.path,
      ),
    ];

    revertKits = [
      DrawToolModel<RevertType>.initial(RevertType.undo).copyWith(
        unselectedImage: Assets.images.pencil.toolUndoOff.path,
        selectedImage: Assets.images.pencil.toolUndoOn.path,
        isSelected: true,
      ),
      DrawToolModel<RevertType>.initial(RevertType.redo).copyWith(
        unselectedImage: Assets.images.pencil.toolRedoOff.path,
        selectedImage: Assets.images.pencil.toolRedoOn.path,
        isSelected: true,
      ),
    ];

    etcKits = [
      DrawToolModel<EtcType>.initial(EtcType.clear).copyWith(
        unselectedImage: Assets.images.pencil.toolClear.path,
        selectedImage: Assets.images.pencil.toolClear.path,
        isSelected: true,
      ),
    ];

    widget.controller.setPKTool(
      toolType: selectedToolType,
      color: selectedColor,
      width: selectedWidth,
    );
  }

  void updatePencilConfigure() {
    widget.controller.setPKTool(
      toolType: selectedToolType,
      color: selectedColor,
      width: selectedWidth,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.w),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildDrawTools(),
          _buildDivider(),
          _buildColorKit(),
          _buildDivider(),
          _buildWidthKit(),
          _buildDivider(),
          _buildRevertKit(),
          _buildDivider(),
          _buildEtcKit(),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Assets.icons.pencil.horizontalBar.svg(),
    );
  }

  Widget _buildDrawTools() {
    return _ToolBase<ToolType>(
      onTap: (item) {
        setState(() {
          drawTools = drawTools
              .map((e) => e.copyWith(isSelected: e.type == item.type))
              .toList();
          selectedToolType = item.type;
          updatePencilConfigure();
        });
      },
      items: drawTools,
    );
  }

  Widget _buildColorKit() {
    return _ToolBase<Color>(
      onTap: (item) {
        setState(() {
          colorKits = colorKits
              .map((e) => e.copyWith(isSelected: e.type == item.type))
              .toList();
          selectedColor = item.type;
          updatePencilConfigure();
        });
      },
      items: colorKits,
      size: 30.w,
      space: 8.w,
    );
  }

  Widget _buildWidthKit() {
    return _ToolBase<double>(
      onTap: (item) {
        setState(() {
          widthKits = widthKits
              .map((e) => e.copyWith(isSelected: e.type == item.type))
              .toList();
          selectedWidth = item.type;
          updatePencilConfigure();
        });
      },
      items: widthKits,
      space: 8.w,
    );
  }

  Widget _buildRevertKit() {
    return _ToolBase<RevertType>(
      onTap: (item) async {
        if (item.type == RevertType.undo) {
          await widget.controller.undo();
        } else {
          await widget.controller.redo();
        }
      },
      items: revertKits,
      space: 8.w,
    );
  }

  Widget _buildEtcKit() {
    return _ToolBase<EtcType>(
      onTap: (item) async {
        if (item.type == EtcType.clear) {
          await widget.controller.clear();
        }
      },
      items: etcKits,
      space: 8.w,
    );
  }
}

class _ToolBase<T> extends StatelessWidget {
  const _ToolBase(
      {required this.onTap, required this.items, this.size, this.space});

  final void Function(DrawToolModel<T> item) onTap;
  final List<DrawToolModel<T>> items;
  final double? size;
  final double? space;

  @override
  Widget build(BuildContext context) {
    final iconSize = size ?? 24.w;
    return SizedBox(
      height: 28.w,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (_, index) {
          final item = items[index];
          return InkWell(
            onTap: () => onTap(item),
            borderRadius: BorderRadius.circular(6),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0.w),
              child: Image.asset(
                item.isSelected ? item.selectedImage : item.unselectedImage,
                width: iconSize,
                height: iconSize,
              ),
            ),
          );
        },
        separatorBuilder: (_, __) => SizedBox(height: 16.w),
      ),
    );
  }
}

class AppPencilKit extends ConsumerWidget {
  const AppPencilKit({
    super.key,
    required this.onPencilKitViewCreated,
  });

  final void Function(PencilKitController controller) onPencilKitViewCreated;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Visibility(
      visible: ref.watch(appPencilKitControllerProvider).value ?? true,
      child: PencilKit(
        onPencilKitViewCreated: onPencilKitViewCreated,
        alwaysBounceVertical: false,
        alwaysBounceHorizontal: false,
        isRulerActive: false,
        drawingPolicy: PencilKitIos14DrawingPolicy.onlyPencil,
        backgroundColor: Colors.transparent,
        isOpaque: false,
      ),
    );
  }
}
