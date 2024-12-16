import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_dioriver/constants/app_colors.dart';
import 'package:weather_app_dioriver/constants/text_styles.dart';
import 'package:weather_app_dioriver/providers/get_weather_by_city_provider.dart';
import 'package:weather_app_dioriver/utils/get_weather_icons.dart';
import 'package:weather_app_dioriver/views/container_circular_progress_indicator.dart';

class FamousCityTile extends ConsumerWidget {
  const FamousCityTile({super.key, required this.city, required this.index});

  final String city;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(weatherByCityNameProvider(city));
    return Material(
      color: index == 0 ? AppColors.lightBlue : AppColors.accentBlue,
      elevation: index == 0 ? 12 : 0,
      borderRadius: BorderRadius.circular(25),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
          child: weatherData.when(data: (weather) {
            log(weather.weather[0].description.toString());
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${weather.main.temp.round()}°",
                              style: TextStyles.h2),
                          const SizedBox(height: 10),
                          Text(
                            weather.weather[0].description,
                            style: TextStyles.subtitleText,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      getWeatherIcon(weatherCode: weather.weather[0].id),
                      height: 50,
                    )
                  ],
                ),
                Text(weather.name,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white.withOpacity(.8),
                        fontWeight: FontWeight.w400))
              ],
            );
          }, error: (error, stacktrace) {
            return Center(
                child: Text(
              error.toString(),
              style: TextStyles.h2,
            ));
          }, loading: () {
            return const ContainerProgressIndicator();
          })),
    );
  }
}
