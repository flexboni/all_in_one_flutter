import 'package:all_in_one_flutter/feat/drag_drop/screen/drag_drap_screen.dart';
import 'package:all_in_one_flutter/feat/event/screen/absorb_pointer_screen.dart';
import 'package:all_in_one_flutter/feat/flick_video_player_screen.dart';
import 'package:all_in_one_flutter/feat/image/screen/gif_screen.dart';
import 'package:all_in_one_flutter/feat/main_screen.dart';
import 'package:all_in_one_flutter/feat/pdf/screen/basic_pdf_screen.dart';
import 'package:all_in_one_flutter/feat/pdf/screen/easy_pdf_screen.dart';
import 'package:all_in_one_flutter/feat/pdf/screen/flutter_pdf_screen.dart';
import 'package:all_in_one_flutter/feat/pdf/screen/multi_pdf_screen.dart';
import 'package:all_in_one_flutter/feat/pdf/screen/pdfx_screen.dart';
import 'package:all_in_one_flutter/feat/pencil/screen/pencil_screen.dart';
import 'package:all_in_one_flutter/feat/video_player/video_player_screen.dart';
import 'package:all_in_one_flutter/router/router_listenable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_configs.g.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'routerKey');

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  final RouterListenable notifier =
      ref.watch(routerListenableProvider.notifier);
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    refreshListenable: notifier,
    initialLocation: MainRoute.path,
    debugLogDiagnostics: true,
    routes: $appRoutes,
    redirect: notifier.redirect,
  );
}

@TypedGoRoute<MainRoute>(path: MainRoute.path)
class MainRoute extends GoRouteData {
  const MainRoute();

  static const path = '/main';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MainScreen();
  }
}

@TypedGoRoute<DragDropRoute>(path: DragDropRoute.path)
class DragDropRoute extends GoRouteData {
  const DragDropRoute();

  static const path = '/drag-drop';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DragDropScreen();
  }
}

@TypedGoRoute<AbsorbPointerRoute>(path: AbsorbPointerRoute.path)
class AbsorbPointerRoute extends GoRouteData {
  const AbsorbPointerRoute();

  static const path = '/absorb-pointer';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AbsorbPointerScreen();
  }
}

@TypedGoRoute<GifRoute>(path: GifRoute.path)
class GifRoute extends GoRouteData {
  const GifRoute();

  static const path = '/gif';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const GifScreen();
  }
}

@TypedGoRoute<BasicPDFRoute>(path: BasicPDFRoute.path)
class BasicPDFRoute extends GoRouteData {
  const BasicPDFRoute();

  static const path = '/basic-pdf';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BasicPDFScreen();
  }
}

@TypedGoRoute<PdfXRoute>(path: PdfXRoute.path)
class PdfXRoute extends GoRouteData {
  const PdfXRoute();

  static const path = '/pdf-x';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PdfXScreen();
  }
}

@TypedGoRoute<EasyPDFRoute>(path: EasyPDFRoute.path)
class EasyPDFRoute extends GoRouteData {
  const EasyPDFRoute();

  static const path = '/easy-pdf';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const EasyPDFScreen();
  }
}

@TypedGoRoute<FlutterPDFRoute>(path: FlutterPDFRoute.path)
class FlutterPDFRoute extends GoRouteData {
  const FlutterPDFRoute();

  static const path = '/flutter-pdf';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const FlutterPDFScreen();
  }
}

@TypedGoRoute<MultiPDFRoute>(path: MultiPDFRoute.path)
class MultiPDFRoute extends GoRouteData {
  const MultiPDFRoute();

  static const path = '/multi-pdf';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MultiPDFScreen();
  }
}

@TypedGoRoute<PencilRoute>(path: PencilRoute.path)
class PencilRoute extends GoRouteData {
  const PencilRoute();

  static const path = '/pencil';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PencilScreen();
  }
}

@TypedGoRoute<VideoPlayerRoute>(path: VideoPlayerRoute.path)
class VideoPlayerRoute extends GoRouteData {
  const VideoPlayerRoute();

  static const path = '/video-player';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const VideoPlayerScreen();
  }
}

@TypedGoRoute<FlickVideoPlayerRoute>(path: FlickVideoPlayerRoute.path)
class FlickVideoPlayerRoute extends GoRouteData {
  const FlickVideoPlayerRoute();

  static const path = '/flick-video-player';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const FlickVideoPlayerScreen();
  }
}
