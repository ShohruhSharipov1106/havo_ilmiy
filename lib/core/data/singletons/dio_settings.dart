import 'dart:developer';

import 'package:havo_ilmiy/assets/constants/app_constants.dart';
import 'package:havo_ilmiy/core/data/interceptors/token_referesh_interceptor.dart';
import 'package:havo_ilmiy/core/data/singletons/storage.dart';
import 'package:dio/dio.dart';

class DioSettings {
  BaseOptions _dioBaseOptions = BaseOptions(
    baseUrl: AppConstants.baseUrl,
    connectTimeout: const Duration(milliseconds: 35000),
    receiveTimeout: const Duration(milliseconds: 33000),
    followRedirects: false,
    headers: <String, dynamic>{
      'Accept-Language':
          StorageRepository.getString(StoreKeys.language, defValue: 'uz')
    },
    validateStatus: (status) => status != null && status <= 500,
  );

  void setBaseOptions({String? lang, String? baseUrl}) {
    _dioBaseOptions = BaseOptions(
      baseUrl: baseUrl ?? AppConstants.baseUrl,
      connectTimeout: const Duration(milliseconds: 35000),
      receiveTimeout: const Duration(milliseconds: 33000),
      headers: <String, dynamic>{'Accept-Language': lang},
      followRedirects: false,
      validateStatus: (status) => status != null && status <= 500,
    );
  }

  BaseOptions get dioBaseOptions => _dioBaseOptions;

  Dio get dio {
    final dio = Dio(_dioBaseOptions);
    dio.interceptors
      ..add(CustomInterceptor(dio: dio))
      ..add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
          request: true,
          requestHeader: true,
          logPrint: (object) => print(
            object.toString(),
          ),
        ),
      );
    return dio;
  }
}
