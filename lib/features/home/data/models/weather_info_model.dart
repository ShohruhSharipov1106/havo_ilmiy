import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:havo_ilmiy/features/home/domain/entities/weather_info_entity.dart';
import 'package:havo_ilmiy/features/home/domain/entities/weather_params_entity.dart';

part 'weather_info_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class WeatherInfoModel extends WeatherInfoEntity {
  const WeatherInfoModel({
    required super.main,
    required super.description,
    required super.icon,
  });
  factory WeatherInfoModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherInfoModelToJson(this);
}
