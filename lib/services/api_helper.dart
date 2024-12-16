

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app_dioriver/constants/constants.dart';
import 'package:weather_app_dioriver/models/weekly_weather.dart';
import 'package:weather_app_dioriver/models/hourly_weather.dart';
import 'package:weather_app_dioriver/models/weather.dart';
import 'package:weather_app_dioriver/services/geolocator.dart';
import 'package:weather_app_dioriver/utils/logging.dart';

class ApiHelper {
  static const baseUrl = 'https://api.openweathermap.org/data/2.5/';
  static const weeklyWeatherUrl = 'https://api.open-meteo.com/v1/forecast?current=&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto';

  static double lat = 0.0;
  static double lon = 0.0;
  static final dio = Dio();
  
  // Get Lat and Lon
  static Future<void> fetchLocation() async {
    final location = await getLocation();
    lat = location.latitude;
    lon = location.longitude;
  }

  //current weather
  static Future<Weather> getCurrentWeather() async {
    await fetchLocation();
    final url = _constructWeatherUrl();
    final response = await _fetchData(url);
    return Weather.fromJson(response);
  }

  //hourly weather
  static Future<HourlyWeather> getHourlyForecast() async {
    await fetchLocation();
    final url = _constructForecaseUrl();
    final response = await _fetchData(url);
    return HourlyWeather.fromJson(response);
  }

  // weekly weather 
  static Future<WeeklyWeather> getWeeklyForecast() async {
    await fetchLocation();
    final url = _constructWeeklyForecastUrl();
    final response = await _fetchData(url);
    return WeeklyWeather.fromJson(response);
  }

  // Weather by CityName
  static Future<Weather> getWeatherByCityName({required String cityname}) async {
    final url = _constructWeatherByCityUrl(cityname);
    final response = await _fetchData(url);
    return Weather.fromJson(response);
  }

  // Build URL
  static String _constructWeatherUrl() => '$baseUrl/weather?lat=$lat&lon=$lon&units=metric&appid=${Constants.apiKey}';

  static String _constructForecaseUrl() => '$baseUrl/forecast?lat=$lat&lon=$lon&units=metric&appid=${Constants.apiKey}';

  static String _constructWeatherByCityUrl(String cityname) => '$baseUrl/weather?q=$cityname&units=metric&appid=${Constants.apiKey}';

  static String _constructWeeklyForecastUrl() => '$weeklyWeatherUrl&latitude=$lat&longitude=$lon';
  

  //*Fetch Data for a url
  static Future<Map<String, dynamic>> _fetchData(String url) async {
      try {
        final response = await dio.get(url);
        if (response.statusCode == 200) {
          return response.data;
        } else {
          printWarning('Failed to load data : ${response.statusCode}');
          throw Exception('Failed to load data');
        }
      } catch (e) {
        printWarning('Error fetching data from $url: $e');
        throw Exception('Error fetching data');
      }
  }
}