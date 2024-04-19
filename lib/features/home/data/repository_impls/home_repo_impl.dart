import 'package:dio/dio.dart';
import 'package:havo_ilmiy/core/exceptions/exceptions.dart';
import 'package:havo_ilmiy/core/exceptions/failures.dart';
import 'package:havo_ilmiy/core/utils/either.dart';
import 'package:havo_ilmiy/features/home/data/datasources/home_datasource.dart';
import 'package:havo_ilmiy/features/home/data/models/forecast_model.dart';
import 'package:havo_ilmiy/features/home/data/models/weather_model.dart';
import 'package:havo_ilmiy/features/home/domain/repositories/home_repository.dart';
import 'package:havo_ilmiy/features/pagination/data/models/generic_pagination.dart';

class HomeRepoImpl extends HomeRepository {
  final HomeDatasource datasource;

  HomeRepoImpl({required this.datasource});

  @override
  Future<Either<Failure, WeatherModel>> getWeather(
      {required String city}) async {
    try {
      final result = await datasource.getWeather(city: city);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, ForecastModel>> getForecast(
      {required String city}) async {
    try {
      final result = await datasource.getForecast(city: city);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }
}
