import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_weather_app/domain/usecases/get_forecast_weather.dart';
import 'package:minimal_weather_app/presentation/bloc/forecast_weather/forecast_weather_event.dart';
import 'package:minimal_weather_app/presentation/bloc/forecast_weather/forecast_weather_state.dart';
import 'package:rxdart/rxdart.dart';

class ForecastWeatherBloc
    extends Bloc<ForecastWeatherEvent, ForecastWeatherState> {
  final GetForecastWeather _getForecastWeather;

  ForecastWeatherBloc(this._getForecastWeather) : super(WeatherEmpty()) {
    on<OnTimeStampChanged>(
      (event, emit) async {
        final lon = event.lon;
        final lat = event.lat;

        emit(WeatherLoading());

        final result = await _getForecastWeather.execute(lon, lat);

        result.fold(
          (failure) {
            emit(WeatherError(failure.message));
          },
          (result) {
            emit(WeatherHasData(result: result.forecastItems));
          },
        );
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
