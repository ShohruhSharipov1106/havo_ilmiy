import 'package:equatable/equatable.dart';
import 'package:havo_ilmiy/features/home/data/models/weather_model.dart';
import 'package:havo_ilmiy/features/home/domain/entities/weather_info_entity.dart';
import 'package:havo_ilmiy/features/home/domain/entities/weather_params_entity.dart';
import 'package:json_annotation/json_annotation.dart';

class WeatherEntity extends Equatable {
  @WeatherParamsConverter()
  final WeatherParamsEntity main;
  @WeatherInfoConverter()
  final List<WeatherInfoEntity> weather;
  final int dt;
  const WeatherEntity({
    this.weather = const [],
    this.main = const WeatherParamsEntity(),
    this.dt = 0,
  });
  @override
  List<Object?> get props => [
        weather,
        main,
        dt,
      ];
}

class WeatherConverter
    implements JsonConverter<WeatherEntity, Map<String, dynamic>?> {
  const WeatherConverter();
  @override
  WeatherEntity fromJson(Map<String, dynamic>? json) =>
      WeatherModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(WeatherEntity object) => {};
}
