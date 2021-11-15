import 'package:flutter/material.dart';

 class RoutingHelper {
   void buildAndShowModalBottomSheetFor({
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

  static void pushAndRemoveUntilToScreen({
    required BuildContext ctx,
    required Widget screen,
  }) {
    final route = MaterialPageRoute(
      builder: (ctx) => screen,
    );
    Navigator.pushAndRemoveUntil(ctx, route, (route) => false);
  }

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
