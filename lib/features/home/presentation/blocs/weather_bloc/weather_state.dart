part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  final FormzSubmissionStatus weatherStatus;
  final FormzSubmissionStatus forecastStatus;
  final WeatherEntity weather;
  final ForecastEntity forecast;
  final String city;
  const WeatherState({
    this.weatherStatus = FormzSubmissionStatus.initial,
    this.forecastStatus = FormzSubmissionStatus.initial,
    this.weather = const WeatherEntity(),
    this.forecast = const ForecastEntity(),
    this.city = 'Tashkent',
  });

  WeatherState copyWith({
    FormzSubmissionStatus? weatherStatus,
    FormzSubmissionStatus? forecastStatus,
    WeatherEntity? weather,
    ForecastEntity? forecast,
    String? city,
  }) =>
      WeatherState(
        weatherStatus: weatherStatus ?? this.weatherStatus,
        forecastStatus: forecastStatus ?? this.forecastStatus,
        weather: weather ?? this.weather,
        forecast: forecast ?? this.forecast,
        city: city ?? this.city,
      );

  @override
  List<Object?> get props =>
      [weatherStatus, forecastStatus, weather, forecast, city];
}
