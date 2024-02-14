import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_listenable.g.dart';

@Riverpod(keepAlive: true)
class RouterListenable extends _$RouterListenable implements Listenable {
  VoidCallback? _routerListener;

  @override
  FutureOr<void> build() async {
    // _token = await ref
    //     .watch(authControllerProvider.selectAsync((data) => data.token));
    // _user = await ref
    //     .watch(authControllerProvider.selectAsync((data) => data.user));

    ref.listenSelf((_, __) {
      if (state.isLoading) {
        return;
      }

      _routerListener?.call();
    });
  }

  String? redirect(_, GoRouterState state) {
    if (this.state.isLoading || this.state.hasError) {
      return null;
    }

    return null;
  }

  @override
  void addListener(VoidCallback listener) {
    _routerListener = listener;
  }

  @override
  void removeListener(VoidCallback listener) {
    _routerListener = null;
  }
}
