import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:havo_ilmiy/features/home/domain/entities/weather_entity.dart';
import 'package:havo_ilmiy/features/home/domain/entities/weather_info_entity.dart';
import 'package:havo_ilmiy/features/home/domain/entities/weather_params_entity.dart';

part 'weather_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class WeatherModel extends WeatherEntity {
  const WeatherModel({
    required super.weather,
    required super.main,
    required super.dt,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}
