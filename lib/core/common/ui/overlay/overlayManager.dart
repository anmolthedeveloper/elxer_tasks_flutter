import 'package:elxer_tasks/core/common/ui/overlay/successOverlay.dart';
import 'package:flutter/cupertino.dart';

import 'errorOverlay.dart';

class OverlayManager {
  static void showError(
          {required BuildContext context,
          required String message,
          required Duration duration}) =>
      errorOverlay(context, message, duration);
  static void showSuccess(
          {required BuildContext context,
          required String message,
          required Duration duration}) =>
      successOverlay(context, message, duration);
}
