// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router_configs.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $mainRoute,
      $dragDropRoute,
      $pencilRoute,
      $videoPlayerRoute,
      $flickVideoPlayerRoute,
    ];

RouteBase get $mainRoute => GoRouteData.$route(
      path: '/main',
      factory: $MainRouteExtension._fromState,
    );

extension $MainRouteExtension on MainRoute {
  static MainRoute _fromState(GoRouterState state) => const MainRoute();

  String get location => GoRouteData.$location(
        '/main',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $dragDropRoute => GoRouteData.$route(
      path: '/drag-drop',
      factory: $DragDropRouteExtension._fromState,
    );

extension $DragDropRouteExtension on DragDropRoute {
  static DragDropRoute _fromState(GoRouterState state) => const DragDropRoute();

  String get location => GoRouteData.$location(
        '/drag-drop',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $pencilRoute => GoRouteData.$route(
      path: '/pencil',
      factory: $PencilRouteExtension._fromState,
    );

extension $PencilRouteExtension on PencilRoute {
  static PencilRoute _fromState(GoRouterState state) => const PencilRoute();

  String get location => GoRouteData.$location(
        '/pencil',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $videoPlayerRoute => GoRouteData.$route(
      path: '/video-player',
      factory: $VideoPlayerRouteExtension._fromState,
    );

extension $VideoPlayerRouteExtension on VideoPlayerRoute {
  static VideoPlayerRoute _fromState(GoRouterState state) =>
      const VideoPlayerRoute();

  String get location => GoRouteData.$location(
        '/video-player',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $flickVideoPlayerRoute => GoRouteData.$route(
      path: '/flick-video-player',
      factory: $FlickVideoPlayerRouteExtension._fromState,
    );

extension $FlickVideoPlayerRouteExtension on FlickVideoPlayerRoute {
  static FlickVideoPlayerRoute _fromState(GoRouterState state) =>
      const FlickVideoPlayerRoute();

  String get location => GoRouteData.$location(
        '/flick-video-player',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$goRouterHash() => r'696f786e1e65dacb18723af5e605243ca90b7961';

/// See also [goRouter].
@ProviderFor(goRouter)
final goRouterProvider = Provider<GoRouter>.internal(
  goRouter,
  name: r'goRouterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$goRouterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GoRouterRef = ProviderRef<GoRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
