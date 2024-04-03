import 'package:elxer_tasks/core/common/ui/overlay/overlayManager.dart';
import 'package:elxer_tasks/core/state/task/createTaskCubit/create_task_cubit.dart';
import 'package:elxer_tasks/core/state/task/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../core/theme/colors.dart';

class CreateTaskView extends StatefulWidget {
  const CreateTaskView({super.key, required this.email});
  final String email;

  @override
  State<CreateTaskView> createState() => _CreateTaskViewState();
}

class _CreateTaskViewState extends State<CreateTaskView> {
  late final TextEditingController _taskController;
  late final TextEditingController _descriptionController;
  final _formKey = GlobalKey<FormState>();
  int priority = 2;

  @override
  void initState() {
    super.initState();
    _taskController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _taskController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return BlocListener<CreateTaskCubit, CreateTaskState>(
      listener: (context, state) {
        if (state is CreateTaskSuccessState) {
          OverlayManager.showSuccess(
              context: context,
              message: 'Successfully created task',
              duration: const Duration(seconds: 3));

          _taskController.text = '';
          _descriptionController.text = '';
        } else if (state is CreateTaskFailedState) {
          OverlayManager.showError(
              context: context,
              message: 'Failed to create task',
              duration: const Duration(seconds: 3));
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: secondaryOffWhiteColor,
          title: Text(
            'Create Task',
            style: theme.textTheme.titleLarge!
                .copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        backgroundColor: secondaryOffWhiteColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    String _priority = "medium";
                    if (priority == 1) {
                      _priority = "high";
                    } else if (priority == 3) {
                      _priority = "low";
                    }
                    var task = TaskModel(
                      task: _taskController.value.text,
                      description: _descriptionController.value.text,
                      priority: _priority,
                      createdAt: DateTime.now().toString(),
                      isComplete: false,
                    );
                    context
                        .read<CreateTaskCubit>()
                        .createTask(task: task, email: widget.email);
                  }
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: primaryGreenThemeColor,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Create Task',
                        style: theme.textTheme.titleMedium!
                            .copyWith(color: primaryWhiteColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<CreateTaskCubit, CreateTaskState>(
          builder: (context, state) {
            if (state is CreateTaskLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: primaryGreenThemeColor,
                ),
              );
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Gap(height * .01),
                      TextFormField(
                        controller: _taskController,
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Task title is required*";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 12.0),
                          hintText: 'Task title...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      const Gap(10.0),
                      SizedBox(
                        height: 150.0, // Adjust the height as needed
                        child: TextFormField(
                          controller: _descriptionController,
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return "Task description is required*";
                            }
                            return null;
                          },
                          maxLines: 5, // Maximum number of lines
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 12.0),
                            hintText: 'Task description...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      const Gap(12.0),
                      Row(
                        children: [
                          Text(
                            'Task priority',
                            style: theme.textTheme.titleSmall!.copyWith(
                                fontWeight: FontWeight.w400,
                                color: primaryBlackColor.withOpacity(.5)),
                          ),
                        ],
                      ),
                      const Gap(5.0),
                      Row(
                        children: [
                          ChoiceChip(
                            showCheckmark: false,
                            selectedColor: primaryRedColor.withOpacity(.4),
                            elevation: 3,
                            surfaceTintColor: secondaryOffWhiteColor,
                            label: SizedBox(
                              width: width * .2,
                              child: Center(
                                child: Text(
                                  'High',
                                  style: theme.textTheme.titleSmall!
                                      .copyWith(color: primaryRedColor),
                                ),
                              ),
                            ),
                            selected: priority == 1,
                            onSelected: (bool selected) {
                              if (selected) {
                                setState(() {
                                  priority = 1;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ChoiceChip(
                            showCheckmark: false,
                            selectedColor: primaryYellowColor.withOpacity(.4),
                            elevation: 3,
                            surfaceTintColor: secondaryOffWhiteColor,
                            label: SizedBox(
                              width: width * .2,
                              child: Center(
                                child: Text(
                                  'Medium',
                                  style: theme.textTheme.titleSmall!
                                      .copyWith(color: primaryYellowColor),
                                ),
                              ),
                            ),
                            selected: priority == 2,
                            onSelected: (bool selected) {
                              if (selected) {
                                setState(() {
                                  priority = 2;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ChoiceChip(
                            showCheckmark: false,
                            elevation: 3,
                            surfaceTintColor: secondaryOffWhiteColor,
                            selectedColor: primaryBlueColor.withOpacity(.4),
                            label: SizedBox(
                              width: width * .2,
                              child: Center(
                                child: Text(
                                  'Low',
                                  style: theme.textTheme.titleSmall!
                                      .copyWith(color: primaryBlueColor),
                                ),
                              ),
                            ),
                            selected: priority == 3,
                            onSelected: (bool selected) {
                              if (selected) {
                                setState(() {
                                  priority = 3;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
