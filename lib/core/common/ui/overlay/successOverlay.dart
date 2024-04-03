import 'package:flutter/material.dart';

import '../widgets/successTagWidget.dart';

void successOverlay(
    BuildContext context, String successMsg, Duration duration) {
  OverlayEntry overlayEntry;
  overlayEntry = OverlayEntry(builder: (context) {
    var height = MediaQuery.sizeOf(context).height;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: height * .15, left: 16, right: 16),
        child: SuccessTagWidget(success: successMsg),
      ),
    );
  });
  Overlay.of(context).insert(overlayEntry);
  Future.delayed(duration, () {
    overlayEntry.remove();
  });
}
