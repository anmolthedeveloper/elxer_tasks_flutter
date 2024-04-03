import 'package:elxer_tasks/core/state/task/deleteTaskCubit/delete_task_cubit.dart';
import 'package:elxer_tasks/core/state/task/models/task.dart';
import 'package:elxer_tasks/core/theme/colors.dart';
import 'package:elxer_tasks/core/utils/capitalizeFirstLetter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'TaskDetailDialog.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key, required this.task, required this.email});
  final TaskModel task;
  final String email;

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
    if (widget.task.isComplete!) {
      priorityColor = primaryGreenThemeColor;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext innerContext) {
                return BlocProvider.value(
                  value:
                      BlocProvider.of<DeleteOrUpdateTaskStatusCubit>(context),
                  child: TaskDetailDialog(
                    task: widget.task,
                    priority: priority,
                    email: widget.email,
                  ),
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
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 100,
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
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (!widget.task.isComplete!)
                              Text(
                                '${capitalizeFirstLetter(widget.task.priority!)} Priority',
                                style: theme.textTheme.titleSmall!.copyWith(
                                    color: priorityColor,
                                    fontWeight: FontWeight.w200),
                              ),
                            if (widget.task.isComplete!) ...[
                              Text(
                                'Task completed',
                                style: theme.textTheme.titleMedium!.copyWith(
                                  color: priorityColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '${capitalizeFirstLetter(widget.task.priority!)} Priority',
                                style: theme.textTheme.titleMedium!.copyWith(
                                    color: priorityColor,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 10),
                              ),
                            ],
                          ],
                        ),
                        Gap(5.0),
                        SizedBox(
                          width: width * .8,
                          child: Text(
                            widget.task.task!,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleMedium!.copyWith(
                                fontSize: 16, color: primaryBlackColor),
                          ),
                        ),
                      ],
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
