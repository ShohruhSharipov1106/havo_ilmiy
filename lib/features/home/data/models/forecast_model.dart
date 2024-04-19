import 'package:havo_ilmiy/features/home/domain/entities/forecast_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:havo_ilmiy/features/home/domain/entities/weather_entity.dart';

part 'forecast_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ForecastModel extends ForecastEntity {
  const ForecastModel({required super.list});
  factory ForecastModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastModelFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastModelToJson(this);
}
