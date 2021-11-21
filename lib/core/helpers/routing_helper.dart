import 'package:flutter/material.dart';

/// A convenient class wraps all functions of **RoutingHelper**
class RoutingHelper {
  /// this is a customize user define function
  /// this take some required input's for build and show bottomSheet
  /// and return the widget

  static void buildAndShowModalBottomSheetFor({
    bool isScrollControlled = true,
    required BuildContext ctx,
    required Widget widget,
  }) {
    showModalBottomSheet(
        isScrollControlled: isScrollControlled,

        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(10.0),
        // ),
        backgroundColor: Colors.white,
        context: ctx,
        builder: (_) {
          return widget;
        });
  }

  /// this function is used for navigate the screen's
  /// it takes two inputs ctx and class name for navigating
  /// Push the given route onto the navigator,
  /// and then remove all the previous routes until the predicate returns true.
  static void pushAndRemoveUntilToScreen({
    required BuildContext ctx,
    required Widget screen,
  }) {
    final route = MaterialPageRoute(
      builder: (ctx) => screen,
    );
    Navigator.pushAndRemoveUntil(ctx, route, (route) => false);
  }

  /// this function is used for navigate the screen's
  /// it takes two inputs ctx and class name for navigating
  /// Push the given route onto the navigator,
  /// and not remove all the previous routes.
  static void pushToScreen({
    required BuildContext ctx,
    bool fullscreenDialog = false,
    required Widget screen,
  }) {
    final route = MaterialPageRoute(
      builder: (ctx) => screen,
      fullscreenDialog: fullscreenDialog,
    );
    Navigator.push(ctx, route);
  }
}
