import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shop_go_router/modules/app/router.dart';
import '/domains/store/store_repository.dart';
import '/modules/app/cubit/app_cubit.dart';

class App extends StatelessWidget {
  //
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => StoreRepository(),
      child: BlocProvider(
        create: (context) => AppCubit(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.from(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
          ),
          localizationsDelegates: {
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          },
          supportedLocales: [Locale('en', 'UK'), Locale('fa', 'IR')],
          builder: (context, child) {
            return MediaQuery.withNoTextScaling(child: child!);
          },
          locale: Locale('fa', 'IR'),
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.stylus,
              PointerDeviceKind.touch,
              PointerDeviceKind.trackpad,
              PointerDeviceKind.invertedStylus,
            },
          ),
          routerConfig: router,
        ),
      ),
    );
  }
}
