import 'package:havo_ilmiy/core/exceptions/failures.dart';
import 'package:havo_ilmiy/core/usecases/usecase.dart';
import 'package:havo_ilmiy/core/utils/either.dart';
import 'package:havo_ilmiy/features/home/data/models/forecast_model.dart';
import 'package:havo_ilmiy/features/home/domain/repositories/home_repository.dart';

class ForecastUsecase implements UseCase<ForecastModel, String> {
  final HomeRepository repository;

  ForecastUsecase({required this.repository});

  @override
  Future<Either<Failure, ForecastModel>> call(String params) async =>
      await repository.getForecast(city: params);
}
