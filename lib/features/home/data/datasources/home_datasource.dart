import 'package:dio/dio.dart';
import 'package:havo_ilmiy/assets/constants/app_constants.dart';
import 'package:havo_ilmiy/core/data/singletons/storage.dart';
import 'package:havo_ilmiy/core/exceptions/exceptions.dart';
import 'package:havo_ilmiy/features/home/data/models/forecast_model.dart';
import 'package:havo_ilmiy/features/home/data/models/weather_model.dart';
import 'package:havo_ilmiy/features/pagination/data/models/generic_pagination.dart';

abstract class HomeDatasource {
  Future<ForecastModel> getForecast({required String city});

  Future<WeatherModel> getWeather({required String city});
}

class HomeDatasourceImpl extends HomeDatasource {
  final Dio _dio;

  HomeDatasourceImpl(this._dio);

  @override
  Future<WeatherModel> getWeather({required String city}) async {
    try {
      final response = await _dio.get(
        '/weather/',
        options: Options(
          headers: StorageRepository.getString('token').isNotEmpty
              ? {
                  'Authorization':
                      'Token ${StorageRepository.getString('token')}'
                }
              : {},
        ),
        queryParameters: {
          'q': city,
          "appid": AppConstants.key,
          "units": "metric",
        },
      );
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw ServerException(
            statusCode: response.statusCode!,
            errorMessage: response.data.toString());
      }
    } on ServerException {
      rethrow;
    } on DioException {
      throw DioExceptions();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<ForecastModel> getForecast({required String city}) async {
    try {
      final response = await _dio.get(
        '/forecast/',
        options: Options(
          headers: StorageRepository.getString(StoreKeys.token).isNotEmpty
              ? {
                  'Authorization':
                      'Token ${StorageRepository.getString(StoreKeys.token)}'
                }
              : {},
        ),
        queryParameters: {
          'q': city,
          "appid": AppConstants.key,
          "units": "metric",
        },
      );
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return ForecastModel.fromJson(response.data);
      } else {
        throw ServerException(
            statusCode: response.statusCode!,
            errorMessage: response.data.toString());
      }
    } on ServerException {
      rethrow;
    } on DioException {
      throw DioExceptions();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }
}
