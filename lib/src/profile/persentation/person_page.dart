import 'package:auto_route/auto_route.dart';
import '../../../common_ui/widgets/common_error_widget.dart';
import '../../../core/di/di_container.dart';
import 'person_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PersonPage extends StatelessWidget {
  const PersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Person"),
      ),
      body: BlocProvider(
        create: (context) => diContainer<PersonBloc>(),
        child: Center(
          child: BlocBuilder<PersonBloc, PersonState>(
              builder: (context, state) => switch (state) {
                    PersonInitialState() => const SizedBox(),
                    PersonLoadingState() => const CircularProgressIndicator(),
                    PersonSuccessState() => _buildBody(state),
                    PersonFailedState() => CommonErrorWidget(
                        errorMessage: state.statedata.error!.message,
                        onRetry: () => context.back(),
                      )
                  }),
        ),
      ),
    );
  }

  Widget _buildBody(PersonState state) {
    return ListTile(
      leading: CircleAvatar(
        child: Image.network(state.statedata.person!.avatar),
      ),
      title: Text(
          "Nama: ${state.statedata.person?.frisName ??''} ${state.statedata.person?.lastName}"),
      subtitle: Text("Email :${state.statedata.person?.email}"),
    );
  }
}
