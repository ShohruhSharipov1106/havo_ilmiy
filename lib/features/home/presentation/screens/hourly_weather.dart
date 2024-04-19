import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:havo_ilmiy/features/home/domain/entities/weather_entity.dart';
import 'package:havo_ilmiy/features/home/presentation/blocs/weather_bloc/weather_bloc.dart';
import 'package:havo_ilmiy/features/home/presentation/widgets/icon_image.dart';
import 'package:intl/intl.dart';

class HourlyWeather extends StatelessWidget {
  const HourlyWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state.forecastStatus == FormzSubmissionStatus.success) {
          final items = [0, 8, 16, 24, 32];
          return HourlyWeatherRow(
            weatherDataItems: [
              for (var i in items) state.forecast.list[i],
            ],
          );
        } else if (state.forecastStatus == FormzSubmissionStatus.inProgress) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Text("Error");
        }
      },
    );
  }
}

class HourlyWeatherRow extends StatelessWidget {
  const HourlyWeatherRow({super.key, required this.weatherDataItems});
  final List<WeatherEntity> weatherDataItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: weatherDataItems
          .map((data) => HourlyWeatherItem(data: data))
          .toList(),
    );
  }
}

class HourlyWeatherItem extends StatelessWidget {
  const HourlyWeatherItem({super.key, required this.data});
  final WeatherEntity data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            DateFormat.E()
                .format(DateTime.fromMillisecondsSinceEpoch(data.dt * 1000)),
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 8),
          IconImage(
            iconUrl: data.weather.isEmpty ? "" : data.weather.first.icon,
            size: 48,
          ),
          const SizedBox(height: 8),
          Text(
            '${data.main.temp}°',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
