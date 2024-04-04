import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class MadeByDialog extends StatelessWidget {
  const MadeByDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return AlertDialog(
      insetPadding: const EdgeInsets.all(16.0),
      backgroundColor: primaryWhiteColor,
      surfaceTintColor: primaryWhiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      content: SingleChildScrollView(
        child: SizedBox(
          width: width * .8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: FittedBox(
                      child: Text(
                        'Made with \u2764 by Anmol Singh Tuteja',
                        style: theme.textTheme.titleMedium!.copyWith(
                          color: primaryBlackColor,
                          fontSize: 16,
                        ),
                        softWrap: true,
                        maxLines: 4,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
