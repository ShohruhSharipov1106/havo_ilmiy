// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherInfoModel _$WeatherInfoModelFromJson(Map<String, dynamic> json) =>
    WeatherInfoModel(
      main: json['main'] as String? ?? '',
      description: json['description'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
    );

Map<String, dynamic> _$WeatherInfoModelToJson(WeatherInfoModel instance) =>
    <String, dynamic>{
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };
