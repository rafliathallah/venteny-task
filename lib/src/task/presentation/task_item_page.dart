import 'package:auto_route/auto_route.dart';
import '../../../common_ui/common_colors.dart';
import '../../../common_ui/common_typography.dart';
import '../../../navigation/router/router.dart';
import '../domain/models/task_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/date_time_util.dart';
import 'bloc/task_bloc.dart';

@RoutePage()
class TaskItemPage extends StatelessWidget {
  final TaskBloc bloc;
  final TaskDto taskDto;

  const TaskItemPage({super.key, required this.taskDto, required this.bloc});

  @override
  Widget build(BuildContext context) {
    Color? getTaskColor(String status) {
      switch (status) {
        case 'pending':
          return Colors.redAccent.withOpacity(0.2);
        case 'completed':
          return Colors.green.withOpacity(0.2);
        default:
          return null; // Default color
      }
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: getTaskColor(taskDto.status),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
              value: taskDto.status == Status.completed.name,
              onChanged: (value) {
                final newStatus = value == true ? Status.completed.name : Status.pending.name;
                var task = TaskDto(
                  id: taskDto.id,
                  title: taskDto.title,
                  description: taskDto.description,
                  startDate: taskDto.startDate,
                  endDate: taskDto.endDate,
                  status: newStatus
                );
                bloc.add(UpdateTaskEvent(taskDto: task,completed: true));

              }),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        taskDto.title,
                        style: CommonTypography.textH7,
                      ),
                    ),
                    PopupMenuButton<int>(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: CommonColors.orang7A,
                      elevation: 1,
                      onSelected: (value) {
                        switch (value) {
                          case 0:
                            {
                              context.navigateTo(TaskRoute(bloc: bloc, taskDto: taskDto,update: true));
                              break;
                            }
                          case 1:
                            {
                             bloc.add(DeleteTaskEvent(id: taskDto.id));
                              break;
                            }
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem<int>(
                            value: 0,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/svgs/edit.svg',
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                    'Edit task',
                                    style: CommonTypography.textInter12,)
                              ],
                            ),
                          ),
                          PopupMenuItem<int>(
                            value: 1,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/svgs/delete.svg',
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                    'Delete task',
                                    style: CommonTypography.textInter12,)
                              ],
                            ),
                          ),
                        ];
                      },
                      child: SvgPicture.asset('assets/svgs/vertical_menu.svg'),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  taskDto.description,
                  style: CommonTypography.textInter14,
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: CommonColors.orangeFF.withOpacity(.1),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/svgs/calender.svg', width: 12),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          '${formatDate(dateTime: taskDto.startDate.toString())} - ${formatDate(dateTime: taskDto.endDate.toString())}',
                          style: CommonTypography.textInter14,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
