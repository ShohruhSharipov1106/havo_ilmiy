// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      weather: (json['weather'] as List<dynamic>?)
              ?.map((e) => const WeatherInfoConverter()
                  .fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
      main: json['main'] == null
          ? const WeatherParamsEntity()
          : const WeatherParamsConverter()
              .fromJson(json['main'] as Map<String, dynamic>?),
      dt: json['dt'] as int? ?? 0,
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'main': const WeatherParamsConverter().toJson(instance.main),
      'weather':
          instance.weather.map(const WeatherInfoConverter().toJson).toList(),
      'dt': instance.dt,
    };
