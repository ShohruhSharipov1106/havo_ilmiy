// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_params_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherParamsModel _$WeatherParamsModelFromJson(Map<String, dynamic> json) =>
    WeatherParamsModel(
      temp: (json['temp'] as num?)?.toDouble() ?? 0,
      tempMin: (json['temp_min'] as num?)?.toDouble() ?? 0,
      tempMax: (json['temp_max'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$WeatherParamsModelToJson(WeatherParamsModel instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
    };
