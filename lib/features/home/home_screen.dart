import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:havo_ilmiy/assets/colors/colors.dart';
import 'package:havo_ilmiy/features/home/presentation/screens/current_weather.dart';
import 'package:havo_ilmiy/features/home/presentation/screens/hourly_weather.dart';
import 'package:havo_ilmiy/features/home/presentation/screens/search_city.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late ScrollController _scrollController;
  ValueNotifier<bool> isShrink = ValueNotifier(false);
  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.offset > 200 - kToolbarHeight &&
            !isShrink.value) {
          isShrink.value = true;
        } else if (_scrollController.offset < 200 - kToolbarHeight &&
            isShrink.value) {
          isShrink.value = false;
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: AppColors.rainGradient,
            ),
          ),
          child: const SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Spacer(),
                SearchCity(),
                Spacer(),
                CurrentWeather(),
                Spacer(),
                HourlyWeather(),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
