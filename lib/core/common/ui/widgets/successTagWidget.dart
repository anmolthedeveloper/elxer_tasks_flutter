import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class SuccessTagWidget extends StatelessWidget {
  const SuccessTagWidget({super.key, required this.success});
  final String success;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: width * .9,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          decoration: const BoxDecoration(
            color: primaryGreenColor,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          height: height * .055,
          child: Center(
            child: Text(
              success,
              style: theme.textTheme.labelSmall!.copyWith(
                  fontWeight: FontWeight.w500, color: primaryWhiteColor),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
