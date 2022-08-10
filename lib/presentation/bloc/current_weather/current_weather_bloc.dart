import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../presentation/bloc/current_weather/current_weather_event.dart';
import '../../../presentation/bloc/current_weather/current_weather_state.dart';
import '../../../domain/usecases/get_current_weather.dart';

class CurrentWeatherBloc
    extends Bloc<CurrentWeatherEvent, CurrentWeatherState> {
  final GetCurrentWeather _getCurrentWeather;

  CurrentWeatherBloc(this._getCurrentWeather) : super(WeatherEmpty()) {
    on<OnCoordinateChanged>(
      (event, emit) async {
        final lon = event.lon;
        final lat = event.lat;

        emit(WeatherLoading());

        final result = await _getCurrentWeather.execute(lon, lat);
        result.fold(
          (failure) {
            emit(WeatherError(failure.message));
          },
          (data) {
            emit(WeatherHasData(data));
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
