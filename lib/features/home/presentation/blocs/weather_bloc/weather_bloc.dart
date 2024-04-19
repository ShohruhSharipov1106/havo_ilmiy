import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:havo_ilmiy/core/data/singletons/service_locator.dart';
import 'package:havo_ilmiy/core/usecases/usecase.dart';
import 'package:havo_ilmiy/features/home/data/repository_impls/home_repo_impl.dart';
import 'package:havo_ilmiy/features/home/domain/entities/forecast_entity.dart';
import 'package:havo_ilmiy/features/home/domain/entities/weather_entity.dart';
import 'package:havo_ilmiy/features/home/domain/usecases/forecast_usecase.dart';
import 'package:havo_ilmiy/features/home/domain/usecases/weather_usecase.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherUsecase _weatherUsecase =
      WeatherUsecase(repository: serviceLocator<HomeRepoImpl>());
  final ForecastUsecase _forecastUsecase =
      ForecastUsecase(repository: serviceLocator<HomeRepoImpl>());
  WeatherBloc() : super(const WeatherState()) {
    on<GetWeather>((event, emit) async {
      final data = await _weatherUsecase.call(state.city);
      if (data.isRight) {
        emit(state.copyWith(
            weather: data.right, weatherStatus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(weatherStatus: FormzSubmissionStatus.failure));
      }
    });
    on<GetForecast>((event, emit) async {
      final data = await _forecastUsecase.call(state.city);
      if (data.isRight) {
        emit(
          state.copyWith(
              forecast: data.right,
              forecastStatus: FormzSubmissionStatus.success),
        );
      } else {
        emit(state.copyWith(forecastStatus: FormzSubmissionStatus.failure));
      }
    });
    on<SetCity>((event, emit) async {
      emit(state.copyWith(city: event.city));
      add(GetWeather());
      add(GetForecast());
    });
  }
}
