import 'package:havo_ilmiy/core/exceptions/failures.dart';
import 'package:havo_ilmiy/core/utils/either.dart';
import 'package:havo_ilmiy/features/home/data/models/forecast_model.dart';
import 'package:havo_ilmiy/features/home/data/models/weather_model.dart';
import 'package:havo_ilmiy/features/pagination/data/models/generic_pagination.dart';

abstract class HomeRepository {
  Future<Either<Failure,ForecastModel>> getForecast(
      {required String city});

  Future<Either<Failure, WeatherModel>> getWeather({required String city});
}
