import 'package:barrel_files_annotation/barrel_files_annotation.dart';
import 'core/di/di_container.dart';
import 'core/di/di_initializer.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/connectivity_utils/connectivity_bloc.dart';
import 'core/utils/date_time_util.dart';
import 'core/utils/theme_utils.dart';
import 'navigation/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDI(diContainer, Environment.dev);
  await initializeDateFormatting(DateTimeUtil.locale, null);
  // Bloc.observer = MyAppObserver(); // for debaging..
  runApp(const MyApp());
}

@includeInBarrelFile
//barel File merupakan visibilty clas secara global dengan menggunakan anotation
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          // contoh penggunaan injectable pada class diContainer untuk membungkus sebuah bloc class
          create: (context) => diContainer<ConnectivityBloc>(),
        ),
        BlocProvider(
          create: (context) => diContainer<ThemeCubit>(),
        )

      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (_, theme) {
          return MaterialApp.router(
              builder: (context, child) =>
                  BlocListener<ConnectivityBloc, ConnectivityState>(
                    listener: (context, state) {
                      if (state is ConnectivityNone) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("No Internet Access")),
                        );
                      }
                    },
                    child: child,
                  ),
              routerConfig: diContainer<AppRouter>().config(),
              title: 'Flutter Bloc Skeleton',
              theme: theme);
        },
      ),
    );
  }
}
