import 'package:elxer_tasks/core/state/task/deleteTaskCubit/delete_task_cubit.dart';
import 'package:elxer_tasks/core/state/task/fetchTasksCubit/fetch_tasks_cubit.dart';
import 'package:elxer_tasks/pages/home/widget/taskWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../core/common/ui/dialogs/madeByDialog.dart';
import '../../core/common/ui/overlay/overlayManager.dart';
import '../../core/state/task/models/task.dart';
import '../../core/state/user/user_bloc.dart';
import '../../core/theme/colors.dart';
import '../signin/signinPage.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocListener<DeleteOrUpdateTaskStatusCubit, DeleteTaskState>(
      listener: (context, state) {
        if (state is DeleteTaskSuccessState) {
          OverlayManager.showSuccess(
              context: context,
              message: 'Successfully deleted task',
              duration: const Duration(seconds: 3));
          context.read<FetchTasksCubit>().fetchTasks();
        } else if (state is DeleteTaskFailedState) {
          OverlayManager.showError(
              context: context,
              message: 'Failed to delete task',
              duration: const Duration(seconds: 3));
        } else if (state is UpdateTaskStatusSuccessState) {
          OverlayManager.showSuccess(
              context: context,
              message: 'Successfully updated task',
              duration: const Duration(seconds: 3));
          context.read<FetchTasksCubit>().fetchTasks();
          Navigator.pop(context);
        } else if (state is UpdateTaskStatusFailedState) {
          OverlayManager.showError(
              context: context,
              message: 'Failed to update task',
              duration: const Duration(seconds: 3));
        }
      },
      child: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is NotSignedInUserState) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const SignInPage(),
              ),
              (Route<dynamic> route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is SignedInUserState) {
            return Scaffold(
              backgroundColor: secondaryOffWhiteColor,
              appBar: AppBar(
                surfaceTintColor: secondaryOffWhiteColor,
                backgroundColor: secondaryOffWhiteColor,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome ${state.user.displayName?.split(' ')[0] ?? 'User'}',
                      style: theme.textTheme.titleLarge!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    BlocBuilder<FetchTasksCubit, FetchTasksState>(
                      builder: (context, fetchTasksState) {
                        if (fetchTasksState is FetchTasksSuccessState) {
                          int incompleteTasksCount = 0;
                          for (TaskModel task in fetchTasksState.tasks) {
                            if (!task.isComplete!) {
                              incompleteTasksCount++;
                            }
                          }
                          if (incompleteTasksCount > 0) {
                            return Text(
                              'You have $incompleteTasksCount tasks due',
                              style: theme.textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: primaryBlackColor.withOpacity(.5),
                                  fontSize: 14),
                            );
                          }
                        }
                        return Container();
                      },
                    ),
                  ],
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext innerContext) {
                            return const MadeByDialog();
                          });
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 16.0, left: 16.0),
                      child: Icon(
                        Icons.star,
                        size: 30,
                        color: primaryGreenThemeColor,
                      ),
                    ),
                  ),
                ],
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: BlocBuilder<FetchTasksCubit, FetchTasksState>(
                    builder: (context, fetchTasksState) {
                      if (fetchTasksState is FetchTasksLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: primaryGreenThemeColor,
                          ),
                        );
                      }

                      if (fetchTasksState is FetchTasksSuccessState) {
                        if (fetchTasksState.tasks.isEmpty) {
                          return const Center(
                            child: Text('Start by creating a Task.'),
                          );
                        }
                        return ListView.builder(
                            itemCount: fetchTasksState.tasks.length,
                            itemBuilder: (context, index) {
                              return TaskWidget(
                                task: fetchTasksState.tasks[index]!,
                                email: state.user.email!,
                              );
                            });
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Gap(20.0),
                          if (fetchTasksState is FetchTasksFailedState) ...[],
                        ],
                      );
                    },
                  ),
                ),
              ),
            );
          } else {
            return Scaffold(body: Container());
          }
        },
      ),
    );
  }
}
