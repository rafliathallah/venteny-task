import 'package:auto_route/auto_route.dart';
import '../../../common_ui/common_colors.dart';
import '../../../common_ui/common_typography.dart';
import '../../../common_ui/widgets/common_button.dart';
import '../../../common_ui/widgets/common_dialog.dart';
import '../../../common_ui/widgets/common_textfield.dart';
import '../domain/models/task_dto.dart';
import 'bloc/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../common_ui/widgets/custom_app_bar.dart';
import '../../../core/utils/date_time_util.dart';

// Generated CLI by Rafli Athallah
  // For business email: rafliathallah.business@gmail.com



@RoutePage()
class TaskPage extends StatefulWidget {
  final TaskBloc bloc;
  final bool update;
  final TaskDto taskDto;
  const TaskPage({super.key, required this.bloc,this.update=false,required this.taskDto});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  final taskFormKey = GlobalKey<FormState>();
  Status status = Status.inProgress;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  _onRangeSelected(DateTime? start, DateTime? end, DateTime focusDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusDay;
      _rangeStart = start;
      _rangeEnd = end;
    });
  }
  @override
  void initState() {
    if(widget.update){
      _rangeStart = toDate(dateTime: widget.taskDto.startDate);
      _rangeEnd = toDate(dateTime: widget.taskDto.endDate);

    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.update?'Update Task':'Create New Task',
      ),
      body: BlocConsumer<TaskBloc, TaskState>(
        bloc: widget.bloc,
  listener: (context, state) {
    if(state is TaskFailedState){
      CommonDialog.showToastMessage(state.stateData.error?.message);
    }
    if(state is TaskSuccessPostState){
      context.back();
      widget.bloc.add(FetchTaskEvent());
      CommonDialog.showToastMessage(state.stateData.message);
    }
    if(state is TaskLoadingState){
      CommonDialog.showLoadingDialog(context);
    }
  },
  builder: (context, state) {
    return Form(
        key: taskFormKey,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TableCalendar(
              calendarStyle: CalendarStyle(selectedDecoration: BoxDecoration(color: CommonColors.orangeFF,shape: BoxShape.circle),
                rangeStartDecoration:  BoxDecoration(color: CommonColors.orangeFF,shape: BoxShape.circle),
                rangeEndDecoration: BoxDecoration(color: CommonColors.orangeFF,shape: BoxShape.circle),
                rangeHighlightColor: Colors.amber
              ),
              calendarFormat: _calendarFormat,
              startingDayOfWeek: StartingDayOfWeek.monday,
              availableCalendarFormats: const {
                CalendarFormat.month: 'Month',
                CalendarFormat.week: 'Week',
              },
              rangeSelectionMode: RangeSelectionMode.toggledOn,
              focusedDay: _focusedDay,
              firstDay: DateTime.utc(2024, 1, 1),
              lastDay: DateTime.utc(2030, 1, 1),
              onPageChanged: (focusDay) {
                _focusedDay = focusDay;
              },
              selectedDayPredicate: (day) =>
                  isSameDay(_selectedDay, day),
              rangeStartDay: _rangeStart,
              rangeEndDay: _rangeEnd,
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onRangeSelected: _onRangeSelected,
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                  color: CommonColors.orangeFF.withOpacity(.1),
                  borderRadius:
                  const BorderRadius.all(Radius.circular(5))),
              child: Text(
                  _rangeStart != null && _rangeEnd != null
                      ? 'Task starting at ${formatDate(dateTime: _rangeStart.toString())} - ${formatDate(dateTime: _rangeEnd.toString())}'
                      : 'Select a date range',
                 style: CommonTypography.textInter14,),
            ),
            const SizedBox(height: 20),
            CommonTextField(hint: "Task Title",label: "Title",defaultValue: widget.taskDto.title,
              labelStyle: CommonTypography.textH7,controller: title,validators: [CommonTextFieldValidator.noEmpty,CommonTextFieldValidator.max50Character],),
            const SizedBox(height: 20),
            CommonTextField(
              expands: true,formHeight: 100,
              hint: "Task Description",label: "Description",defaultValue: widget.taskDto.description,labelStyle: CommonTypography.textH7,controller: description,validators: [CommonTextFieldValidator.noEmpty],),
            const SizedBox(height: 20),
            Text("Status",style: CommonTypography.textH8,),
            Row(
              children: [
                Radio(
                  value: Status.inProgress,
                  groupValue: status,
                  activeColor: CommonColors.orangeFF,
                  onChanged: (value) {
                    setState(() {
                      status = value!;
                    });
                  },
                ),
                Text(
                  "In Progress",
                  style: CommonTypography.textInter12,
                ),
                SizedBox(
                  width: 12,
                ),
                Radio(
                  value: Status.pending,
                  groupValue: status,
                  activeColor: CommonColors.orangeFF,
                  onChanged: (value) {
                    setState(() {
                      status = value!;
                    });
                  },
                ),
                Text(
                  "Pending",
                  style: CommonTypography.textInter12,
                ),
                SizedBox(
                  width: 12,
                ),
                Radio(
                  value: Status.completed,
                  groupValue: status,
                  activeColor: CommonColors.orangeFF,
                  onChanged: (value) {
                    setState(() {
                      status = value!;
                    });
                  },
                ),
                Text(
                  "Completed",
                  style: CommonTypography.textInter12,
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: size.width *0.4,
                    height: 50,
                    child: CommonButton(text: "Cancel",textStyle: CommonTypography.textH8, onPressed: (){
                      context.back();
                    },color: CommonColors.greyDD,)),
                SizedBox(width: size.width *0.4,
                    height: 50,
                    child: CommonButton(text: widget.update?"Update" : "Save", textStyle: CommonTypography.textH8.copyWith(color: Colors.white), onPressed: (){
                      if(taskFormKey.currentState?.validate()==true){
                        if (_rangeStart == null || _rangeEnd == null) {
                          CommonDialog.showToastMessage("Please select a valid date range.");
                          return;
                        }
                        if(widget.update){
                          var taskUpdate = TaskDto(
                            id: widget.taskDto.id,
                            title: title.text,
                            description: description.text,
                            startDate: DateTimeUtil().translateDateTime(_rangeStart.toString(),toFormat: DateTimeUtil.formatSimpleReverse),
                            endDate: DateTimeUtil().translateDateTime(_rangeEnd.toString(),toFormat: DateTimeUtil.formatSimpleReverse),
                              status: status.name);
                          widget.bloc.add(UpdateTaskEvent(taskDto: taskUpdate));
                        }else{
                          int newId = state.stateData.taskDto.isNotEmpty?state.stateData.taskDto.last.id +1:1;
                          var taskDto = TaskDto(
                              id: newId,
                              title: title.text,
                              description: description.text,
                              startDate: DateTimeUtil().translateDateTime(_rangeStart.toString(),toFormat: DateTimeUtil.formatSimpleReverse),
                              endDate: DateTimeUtil().translateDateTime(_rangeEnd.toString(),toFormat: DateTimeUtil.formatSimpleReverse),
                              status: status.name);
                          widget.bloc.add(AddNewTaskEvent(taskDto: taskDto));
                        }

                      }

                    },color: CommonColors.orangeFF,)),
              ],
            )
          ],
        ),
      );
  },
),
    );
  }
}

