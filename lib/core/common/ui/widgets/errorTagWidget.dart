import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class ErrorTagWidget extends StatelessWidget {
  const ErrorTagWidget({super.key, required this.error});
  final String error;

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
          decoration: BoxDecoration(
            color: primaryRedColor.withOpacity(.1),
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          height: height * .055,
          child: Center(
            child: Text(
              error,
              style: theme.textTheme.labelSmall!.copyWith(
                  fontWeight: FontWeight.w500, color: primaryRedColor),
            ),
          ),
        ),
      ],
    );
  }
}
