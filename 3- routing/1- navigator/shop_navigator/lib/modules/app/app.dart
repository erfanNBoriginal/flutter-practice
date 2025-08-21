import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shop_navigator/modules/home/home_page.dart';
import 'package:shop_navigator/modules/page_a/page_a.dart';
import 'package:shop_navigator/modules/page_b/page_b.dart';
import 'package:shop_navigator/modules/page_c/page_c.dart';
import '/domains/store/store_repository.dart';
import '/modules/app/cubit/app_cubit.dart';

class App extends StatelessWidget {
  //
  const App({super.key});

  //
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => StoreRepository(),
      child: BlocProvider(
        create: (context) => AppCubit(),
        child: MaterialApp(
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
          // routes: {
          //   'PageA': (context) => PageA(content: 'Page A Content'),
          //   'PageB': (context) => PageB(content: 'Page B Content'),
          //   'PageC': (context) => PageC(content: 'Page C Content'),
          // },
          onGenerateRoute: (settings) {
            final Route route;
            switch (settings.name) {
              case '/':
                route = MaterialPageRoute(
                  settings: settings,
                  builder: (context) => HomePage(),
                );
              case PageA.route:
                route = MaterialPageRoute(
                  settings: settings,
                  builder: (context) {
                    return PageA(content: settings.arguments as String);
                  },
                );
              case PageB.route:
                route = MaterialPageRoute(
                  settings: settings,
                  builder: (context) {
                    return PageB(content: settings.arguments as String);
                  },
                );
              case PageC.route:
                route = MaterialPageRoute(
                  settings: settings,
                  builder: (context) {
                    return PageC(content: settings.arguments as String);
                  },
                );
              default:
                route = MaterialPageRoute(
                  settings: settings,
                  builder: (context) {
                    return HomePage();
                  },
                );
            }
            return route;
          },
        ),
      ),
    );
  }
}
