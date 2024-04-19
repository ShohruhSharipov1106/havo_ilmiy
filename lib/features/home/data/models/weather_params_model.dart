import 'package:havo_ilmiy/features/home/domain/entities/weather_params_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_params_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class WeatherParamsModel extends WeatherParamsEntity {
  const WeatherParamsModel({
    required super.temp,
    required super.tempMin,
    required super.tempMax,
  });
  factory WeatherParamsModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherParamsModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherParamsModelToJson(this);
}
