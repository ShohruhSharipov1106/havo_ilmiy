import 'package:equatable/equatable.dart';
import 'package:havo_ilmiy/features/home/domain/entities/weather_entity.dart';
import 'package:havo_ilmiy/features/home/domain/entities/weather_info_entity.dart';
import 'package:havo_ilmiy/features/home/domain/entities/weather_params_entity.dart';

class ForecastEntity extends Equatable {
  @WeatherConverter()
  final List<WeatherEntity> list;
  const ForecastEntity({this.list = const []});
  @override
  List<Object?> get props => [list];
}
