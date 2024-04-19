import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:havo_ilmiy/features/home/domain/entities/weather_info_entity.dart';
import 'package:havo_ilmiy/features/home/domain/entities/weather_params_entity.dart';
import 'package:havo_ilmiy/features/home/presentation/blocs/weather_bloc/weather_bloc.dart';
import 'package:havo_ilmiy/features/home/presentation/widgets/icon_image.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(context.read<WeatherBloc>().state.city,
            style: Theme.of(context).textTheme.headlineMedium),
        BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state.weatherStatus == FormzSubmissionStatus.inProgress) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.weatherStatus == FormzSubmissionStatus.success) {
              return CurrentWeatherContents(
                weatherParams: state.weather.main,
                weatherInfo: state.weather.weather.isEmpty
                    ? const WeatherInfoEntity()
                    : state.weather.weather.first,
              );
            } else {
              return const Text("Error");
            }
          },
        )
      ],
    );
  }
}

class CurrentWeatherContents extends StatelessWidget {
  const CurrentWeatherContents({
    super.key,
    required this.weatherParams,
    required this.weatherInfo,
  });
  final WeatherInfoEntity weatherInfo;
  final WeatherParamsEntity weatherParams;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final highAndLow =
        'Yuqori:${weatherParams.tempMax}°   Past:${weatherParams.tempMin}°';
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconImage(iconUrl: weatherInfo.icon, size: 120),
        Text(weatherParams.temp.toString(), style: textTheme.displayMedium),
        Text(highAndLow, style: textTheme.bodyMedium),
      ],
    );
  }
}
