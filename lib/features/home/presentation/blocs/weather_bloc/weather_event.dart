part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetForecast extends WeatherEvent {
  const GetForecast();
}

class GetWeather extends WeatherEvent {
  const GetWeather();
}

class SetCity extends WeatherEvent {
  final String city;

  const SetCity({required this.city});
}
