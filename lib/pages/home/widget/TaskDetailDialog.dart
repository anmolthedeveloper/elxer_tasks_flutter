import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../core/state/task/models/task.dart';
import '../../../core/theme/colors.dart';
import '../../../core/utils/capitalizeFirstLetter.dart';

class TaskDetailDialog extends StatelessWidget {
  const TaskDetailDialog(
      {super.key, required this.task, required this.priority});
  final TaskModel task;
  final int priority;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    var priorityColor = priority == 1
        ? primaryRedColor
        : priority == 2
            ? primaryYellowColor
            : primaryBlueColor;
    return AlertDialog(
      insetPadding: const EdgeInsets.all(16.0),
      backgroundColor: primaryWhiteColor,
      surfaceTintColor: primaryWhiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      contentPadding: const EdgeInsets.all(15.0),
      content: SingleChildScrollView(
        child: SizedBox(
          width: width * 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        '${capitalizeFirstLetter(task.priority!)} Priority',
                        style: theme.textTheme.titleSmall!.copyWith(
                            color: priorityColor, fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/images/delete_icon.svg',
                            width: 21,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/images/close_icon.svg',
                            width: 21,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(10.0),
            ],
          ),
        ),
      ),
    );
  }
}
