import 'package:auto_route/auto_route.dart';
import '../../../../core/di/di_container.dart';
import '../../domain/models/post_dto.dart';
import 'example_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body: Center(
        child: BlocProvider(
          create: (context) => diContainer<ExampleBloc>(),
          child: BlocBuilder<ExampleBloc, ExampleState>(
              builder: (context, state) => switch (state) {
                    ExampleInitialState() => const SizedBox(),
                    ExampleLoadingState() => const CircularProgressIndicator(),
                    ExampleErrorState() => Text("Error ${state.stateData.error!.message}"),
                    ExampleDisplayPostsState() => buidBody(context, state)
                  }),
        ),
      ),
    );
  }
}

Widget buidBody(BuildContext context, ExampleState state) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 16),
        Text('Value: ${state.stateData.incrementValue}'),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            context
                .read<ExampleBloc>()
                .add(ExampleIncrementEvent(increment: 1));
          },
          child: const Text('Increment'),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          itemCount: state.stateData.posts.length,
          primary: false,
          shrinkWrap: true,
          itemBuilder: (ctx, idx) {
            return ExampleQuoteItem(post: state.stateData.posts[idx]);
          },
        ),
      ],
    ),
  );
}

class ExampleQuoteItem extends StatelessWidget {
  final PostDto post;

  const ExampleQuoteItem({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(post.title),
            Text(post.body),
          ],
        ),
      ),
    );
  }
}
