import 'package:elxer_tasks/core/state/task/deleteTaskCubit/delete_task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../core/common/ui/dialogs/deleteDialog.dart';
import '../../../core/state/task/models/task.dart';
import '../../../core/theme/colors.dart';
import '../../../core/utils/capitalizeFirstLetter.dart';

class TaskDetailDialog extends StatelessWidget {
  const TaskDetailDialog(
      {super.key,
      required this.task,
      required this.priority,
      required this.email});
  final TaskModel task;
  final int priority;
  final String email;

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
                        onTap: () {
                          showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext innerContext) {
                                return BlocProvider.value(
                                  value:
                                      BlocProvider.of<DeleteTaskCubit>(context),
                                  child: DeleteDialog(
                                    onCancel: () {
                                      Navigator.pop(innerContext);
                                    },
                                    onDelete: () {
                                      context
                                          .read<DeleteTaskCubit>()
                                          .deleteTask(
                                              taskId: task.id!, email: email);
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                    title: 'Delete Task?',
                                    description:
                                        'Are you sure you want to delete this Task?',
                                  ),
                                );
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/images/delete_icon.svg',
                            width: 21,
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/images/edit_square_icon.svg',
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
              Row(
                children: [
                  SizedBox(
                    width: width * .85,
                    child: Text(
                      task.task!,
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
              const Gap(8.0),
              Row(
                children: [
                  SizedBox(
                    width: width * .85,
                    child: SingleChildScrollView(
                      child: Text(
                        task.description!,
                        style: theme.textTheme.titleMedium!.copyWith(
                          fontSize: 14.0,
                        ),
                        maxLines: 7,
                        overflow: TextOverflow.ellipsis,
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
