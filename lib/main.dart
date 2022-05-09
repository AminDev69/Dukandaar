import 'package:dukandaar/dynamic/bloc/theme/theme_bloc.dart';
import 'package:dukandaar/dynamic/bloc/user/user_bloc.dart';

import 'package:dukandaar/static/utils/theme_preference.dart';
import 'package:dukandaar/static/views/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'dynamic/bloc/distributor/distributor_bloc.dart';
import 'dynamic/bloc/item/item_bloc.dart';
import 'dynamic/bloc/order/order_bloc.dart';
import 'dynamic/bloc/shop/shop_bloc.dart';

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
        BlocProvider(create: (context) => DistributorBloc()),
        BlocProvider(create: (context) => UserBloc()),
        BlocProvider(create: (context) => ShopBloc()),
        BlocProvider(create: (context) => ItemBloc()),
        BlocProvider(create: (context) => OrderBloc()),
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
