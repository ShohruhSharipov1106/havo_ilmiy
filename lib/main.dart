import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:havo_ilmiy/assets/themes/theme.dart';
import 'package:havo_ilmiy/core/data/singletons/service_locator.dart';
import 'package:havo_ilmiy/features/common/domain/repositories/connectivity_repository.dart';
import 'package:havo_ilmiy/features/common/presentation/bloc/connectivity_bloc/connectivity_bloc.dart';
import 'package:havo_ilmiy/features/home/home_screen.dart';
import 'package:havo_ilmiy/features/home/presentation/blocs/weather_bloc/weather_bloc.dart';
import 'package:havo_ilmiy/features/home/presentation/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get navigator => _navigatorKey.currentState!;
  late ConnectivityRepository connectivityRepository;
  late ConnectivityBloc connectivityBloc;

  @override
  void initState() {
    connectivityRepository = ConnectivityRepository();
    connectivityBloc = ConnectivityBloc(connectivityRepository)
      ..add(const ConnectivityEvent.setup());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider.value(value: connectivityRepository)],
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: connectivityBloc),
          BlocProvider(
            create: (context) => WeatherBloc()
              ..add(GetWeather())
              ..add(GetForecast()),
          ),
        ],
        child: MaterialApp(
          navigatorKey: _navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme(),
          builder: (context, child) {
            return BlocListener<WeatherBloc, WeatherState>(
              listener: (context, state) {
                if (state.weatherStatus.isSuccess) {
                  navigator.pushAndRemoveUntil(
                      fade(page: const HomeScreen()), (route) => false);
                }
              },
              child: child,
            );
          },
          onGenerateRoute: (_) => MaterialPageRoute(
            builder: (_) => const SplashScreen(),
          ),
        ),
      ),
    );
  }
}

PageRouteBuilder fade({required Widget page, RouteSettings? settings}) =>
    PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
              opacity: CurvedAnimation(
                curve: const Interval(0, 1, curve: Curves.linear),
                parent: animation,
              ),
              child: child,
            ),
        settings: settings,
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            page);
