import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_dioriver/models/weather.dart';
import 'package:weather_app_dioriver/services/api_helper.dart';

final weatherByCityNameProvider = FutureProvider.autoDispose.family<Weather, String>((ref, String cityname) async {
  return ApiHelper.getWeatherByCityName(cityname: cityname);
});