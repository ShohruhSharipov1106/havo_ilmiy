import 'package:equatable/equatable.dart';
import 'package:havo_ilmiy/features/home/data/models/weather_params_model.dart';
import 'package:json_annotation/json_annotation.dart';

class WeatherParamsEntity extends Equatable {
  const WeatherParamsEntity({
    this.temp = 0,
    this.tempMin = 0,
    this.tempMax = 0,
  });
  final double temp;
  final double tempMin;
  final double tempMax;

  @override
  List<Object?> get props => [temp, tempMin, tempMax];
}

class WeatherParamsConverter
    implements JsonConverter<WeatherParamsEntity, Map<String, dynamic>?> {
  const WeatherParamsConverter();
  @override
  WeatherParamsEntity fromJson(Map<String, dynamic>? json) =>
      WeatherParamsModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(WeatherParamsEntity object) => {};
}
