import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../common_ui/color_schemes.g.dart';

/// A simple [Cubit] that manages the [ThemeData] as its state.
@injectable
class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
    colorScheme: lightColorScheme,
    useMaterial3: true,
    scaffoldBackgroundColor: Color(0xFFF5F8FA),
    brightness: Brightness.light,
    textTheme: getTextTheme(ThemeMode.light)
  );

  static final _darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    ),
    brightness: Brightness.dark,
      textTheme: getTextTheme(ThemeMode.dark)
  );

  /// Toggles the current brightness between light and dark.
  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
  static TextTheme getTextTheme(ThemeMode mode) {
    return TextTheme(
      titleLarge: TextStyle(
        /// The color of the text is white in light mode and black in dark mode.
        color: mode == ThemeMode.dark ? Colors.white : Colors.black,
      ),
    );
  }
}
