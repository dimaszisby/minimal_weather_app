import 'package:equatable/equatable.dart';

abstract class CurrentWeatherEvent extends Equatable {
  const CurrentWeatherEvent();

  @override
  List<Object?> get props => [];
}

class OnCoordinateChanged extends CurrentWeatherEvent {
  final double lon;
  final double lat;

  const OnCoordinateChanged({required this.lon, required this.lat});

  @override
  List<Object?> get props => [lon, lat];
}
