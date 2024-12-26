import 'package:auto_route/auto_route.dart';
import 'package:barrel_files_annotation/barrel_files_annotation.dart';
import '../../../common_ui/common_colors.dart';
import '../../../common_ui/common_typography.dart';
import '../../../common_ui/widgets/common_dialog.dart';
import '../../../common_ui/widgets/common_loading.dart';
import '../../../common_ui/widgets/common_search.dart';
import '../../../navigation/router/router.dart';
import '../../task/domain/models/task_dto.dart';
import '../../task/presentation/bloc/task_bloc.dart';
import '../../task/presentation/task_item_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common_ui/widgets/custom_app_bar.dart';
import '../../../core/di/di_container.dart';
import '../../../core/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
@includeInBarrelFile
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late TaskBloc bloc;
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    bloc = diContainer<TaskBloc>()..add(FetchTaskEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Hi Rafli',
          showBackArrow: false,
          actionWidgets: [
            IconButton(onPressed: (){context.read<ThemeCubit>().toggleTheme();}, icon: Icon(Icons.brightness_6)),
            PopupMenuButton<int>(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 1,
              onSelected: (value) {
                switch (value) {
                  case 0:
                    {
                      bloc.add(SortTaskEvent(sortOption: 'inProgress'));
                      break;
                    }
                  case 1:
                    {
                      bloc.add(SortTaskEvent(sortOption: 'completed'));

                      break;
                    }
                  case 2:
                    {
                      bloc.add(SortTaskEvent(sortOption: 'pending'));
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
                          'assets/svgs/task.svg',
                          width: 15,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                            'In Progress Task',
                            style: CommonTypography.textInter12,)
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/task_checked.svg',
                          width: 15,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                            'Completed tasks',
                          style: CommonTypography.textInter12,)
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/task.svg',
                          width: 15,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                            'Pending tasks',
                          style: CommonTypography.textInter12,)
                      ],
                    ),
                  ),
                ];
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SvgPicture.asset('assets/svgs/filter.svg',color: Colors.white),
              ),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async => bloc.add(FetchTaskEvent()),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: BlocConsumer<TaskBloc, TaskState>(
                bloc: bloc,
                listener: (context, state) {
                  if (state is TaskFailedState) {
                    CommonDialog.showToastMessage(state.stateData.message);
                  }
                },
                builder: (context, state) {
                  if (state is TaskLoadingState) {
                    return Center(child: CommonLoading());
                  }

                  return state.stateData.taskDto.isNotEmpty
                      ? Column(
                    children: [
                      CommonSearch(
                          hint: "Search recent task",
                          controller: searchController,
                          inputType: TextInputType.text,
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          fillColor: Colors.white,
                          onChange: (value) {
                            bloc.add(SearchTaskEvent(keywords: value));
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemCount: state.stateData.taskDto.length,
                          itemBuilder: (context, index) {
                            return TaskItemPage(bloc: bloc,
                              taskDto: state.stateData.taskDto[index],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(
                              color: CommonColors.orangeFF,
                            );
                          },
                        ),
                      ),
                    ],
                  )
                      : Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/svgs/tasks.svg',
                              height: size.height * .20,
                              width: size.width,
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Text(
                              'Schedule your tasks',
                              style: CommonTypography.textH4,
                            ),
                            Text(
                              'Manage your task schedule easily\nand efficiently',
                              style: CommonTypography.textInter14,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                },
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_circle),
          onPressed: () {
            context.navigateTo(TaskRoute(bloc: bloc,taskDto: TaskDto()));
          },
        ),
      ),
    );
  }

}
