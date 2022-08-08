import 'package:equatable/equatable.dart';

abstract class ForecastWeatherEvent extends Equatable {
  const ForecastWeatherEvent();

  @override
  List<Object?> get props => [];
}

class OnTimeStampChanged extends ForecastWeatherEvent {
  final double lon;
  final double lat;

  const OnTimeStampChanged({required this.lon, required this.lat});

  @override
  List<Object?> get props => [lon, lat];
}
