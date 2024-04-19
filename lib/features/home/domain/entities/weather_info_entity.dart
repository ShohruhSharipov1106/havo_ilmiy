import 'package:equatable/equatable.dart';
import 'package:havo_ilmiy/features/home/data/models/weather_info_model.dart';
import 'package:havo_ilmiy/features/home/data/models/weather_params_model.dart';
import 'package:json_annotation/json_annotation.dart';

class WeatherInfoEntity extends Equatable {
  final String main;
  final String description;
  final String icon;
  const WeatherInfoEntity({
    this.main = '',
    this.description = '',
    this.icon = '',
  });
  @override
  List<Object?> get props => [main, description, icon];
}

class WeatherInfoConverter
    implements JsonConverter<WeatherInfoEntity, Map<String, dynamic>?> {
  const WeatherInfoConverter();
  @override
  WeatherInfoEntity fromJson(Map<String, dynamic>? json) =>
      WeatherInfoModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(WeatherInfoEntity object) => {};
}
