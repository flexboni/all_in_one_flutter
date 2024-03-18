import 'package:all_in_one_flutter/feat/event/screen/absorb_pointer_screen.dart';
import 'package:all_in_one_flutter/router/router_configs.dart';
import 'package:flutter/material.dart';

class Menu {
  const Menu({required this.name, this.onTap, this.subMenus});

  final String name;
  final void Function()? onTap;
  final List<Menu>? subMenus;
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<Menu> items;

  @override
  void initState() {
    super.initState();

    items = [
      Menu(name: 'Drag drop', onTap: () => const DragDropRoute().push(context)),
      Menu(
        name: 'Event',
        subMenus: [
          Menu(
              name: 'Absorb pointer',
              onTap: () => const AbsorbPointerRoute().push(context))
        ],
      ),
      Menu(
        name: 'Image',
        subMenus: [
          Menu(name: 'Gif', onTap: () => const GifRoute().push(context))
        ],
      ),
      Menu(
        name: 'PDF',
        subMenus: [
          Menu(
            name: 'Basic PDF',
            onTap: () => const BasicPDFRoute().push(context),
          ),
          Menu(name: 'PDFX', onTap: () => const PdfXRoute().push(context)),
          Menu(
            name: 'Easy PDF',
            onTap: () => const EasyPDFRoute().push(context),
          ),
          Menu(
            name: 'Flutter PDF',
            onTap: () => const FlutterPDFRoute().push(context),
          ),
          Menu(
            name: 'Multi PDF',
            onTap: () => const MultiPDFRoute().push(context),
          ),
        ],
      ),
      Menu(name: 'Pencil', onTap: () => const PencilRoute().push(context)),
      Menu(
        name: 'Video player',
        onTap: () => const VideoPlayerRoute().push(context),
      ),
      Menu(
        name: 'Flicker video player',
        onTap: () => const FlickVideoPlayerRoute().push(context),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, int index) {
          return _buildList(items[index]);
        },
      ),
    );
  }

  Widget _buildList(Menu menu) {
    if (menu.subMenus == null) {
      return Builder(
        builder: (_) {
          return ListTile(onTap: menu.onTap, title: Text(menu.name));
        },
      );
    }

    return ExpansionTile(
      title: Text(menu.name),
      children: menu.subMenus!.map(_buildList).toList(),
    );
  }
}
