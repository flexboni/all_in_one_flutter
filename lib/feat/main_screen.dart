import 'package:all_in_one_flutter/router/router_configs.dart';
import 'package:flutter/material.dart';

class ButtonModel {
  const ButtonModel({required this.title, required this.onTap});

  final String title;
  final void Function() onTap;
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<ButtonModel> items;

  @override
  void initState() {
    super.initState();

    items = [
      ButtonModel(
        title: 'Drag drop',
        onTap: () => const DragDropRoute().push(context),
      ),
      ButtonModel(
        title: 'PDF',
        onTap: () => const PDFRoute().push(context),
      ),
      ButtonModel(
        title: 'Pencil',
        onTap: () => const PencilRoute().push(context),
      ),
      ButtonModel(
        title: 'Video player',
        onTap: () => const VideoPlayerRoute().push(context),
      ),
      ButtonModel(
        title: 'Flicker video player',
        onTap: () => const FlickVideoPlayerRoute().push(context),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 60),
        itemCount: items.length,
        itemBuilder: (_, int index) {
          final ButtonModel item = items[index];
          return ElevatedButton(onPressed: item.onTap, child: Text(item.title));
        },
        separatorBuilder: (_, __) => const SizedBox(height: 15),
      ),
    );
  }
}
