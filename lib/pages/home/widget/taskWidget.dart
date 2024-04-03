import 'package:elxer_tasks/core/state/task/models/task.dart';
import 'package:elxer_tasks/core/theme/colors.dart';
import 'package:elxer_tasks/core/utils/capitalizeFirstLetter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'TaskDetailDialog.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key, required this.task});
  final TaskModel task;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  int priority = 2;
  @override
  void initState() {
    super.initState();
    if (widget.task.priority! == 'high') {
      setState(() {
        priority = 1;
      });
    } else if (widget.task.priority! == 'low') {
      setState(() {
        priority = 3;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var theme = Theme.of(context);
    var priorityColor = priority == 1
        ? primaryRedColor
        : priority == 2
            ? primaryYellowColor
            : primaryBlueColor;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return TaskDetailDialog(
                  task: widget.task,
                  priority: priority,
                );
              });
        },
        child: Container(
          decoration: BoxDecoration(
            color: primaryWhiteColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(12.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: 15,
                decoration: BoxDecoration(
                  color: priorityColor.withOpacity(.8),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    bottomLeft: Radius.circular(12.0),
                  ),
                ),
              ),
              const Gap(8.0),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${capitalizeFirstLetter(widget.task.priority!)} Priority',
                      style: theme.textTheme.titleSmall!.copyWith(
                          color: priorityColor, fontWeight: FontWeight.w200),
                    ),
                    Gap(height * .012),
                    SizedBox(
                      width: width * .8,
                      child: Text(
                        widget.task.task!,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleMedium!
                            .copyWith(fontSize: 16, color: primaryBlackColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
