import 'package:havo_ilmiy/core/exceptions/failures.dart';
import 'package:havo_ilmiy/core/usecases/usecase.dart';
import 'package:havo_ilmiy/core/utils/either.dart';
import 'package:havo_ilmiy/features/home/data/models/weather_model.dart';
import 'package:havo_ilmiy/features/home/domain/repositories/home_repository.dart';

class WeatherUsecase implements UseCase<WeatherModel, String> {
  final HomeRepository repository;

  WeatherUsecase({required this.repository});

  @override
  Future<Either<Failure, WeatherModel>> call(String params) async =>
      await repository.getWeather(city: params);
}
