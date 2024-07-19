import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:social/bloc/bloc_providers.dart';

import './theme/theme.dart';
import './utils/globals.dart';

import 'router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  final BlocProviders blocProviders = BlocProviders();
  runApp(
    MultiBlocProvider(
      providers: blocProviders.blocs(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _router = AppRoutes.routes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: snackbarKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routerConfig: _router,
      // routeInformationParser: AppRoutes.routes().routeInformationParser,
      // routeInformationProvider: AppRoutes.routes().routeInformationProvider,
      // routerDelegate: AppRoutes.routes().routerDelegate,
    );
  }
}
