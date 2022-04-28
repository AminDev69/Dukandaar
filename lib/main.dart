import 'package:dukandaar/dynamic/bloc/theme/theme_bloc.dart';

import 'package:dukandaar/static/utils/theme_preference.dart';
import 'package:dukandaar/static/views/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemePreferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is ThemeInitial) {
            return GetMaterialApp(
              theme: state.themeData,
              debugShowCheckedModeBanner: false,
              title: "DukanDaar",
              home: Register(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
