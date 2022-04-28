import 'package:bloc/bloc.dart';
import 'package:dukandaar/static/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeInitial(themeData: AppTheme.themes[darkOrLight.lightTheme]));

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ChangeEvent) {
      yield ThemeInitial(themeData: AppTheme.themes[event.myTheme]);
    }
  }
}
