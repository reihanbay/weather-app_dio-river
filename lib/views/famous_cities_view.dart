import 'package:flutter/material.dart';
import 'package:weather_app_dioriver/models/famous_city.dart';
import 'package:weather_app_dioriver/views/widget/famous_city_tile.dart';

class FamousCitiesView extends StatelessWidget {
  const FamousCitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: famousCities.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
        itemBuilder: (context, index) {
          final city = famousCities[index];
          return FamousCityTile(index: index, city: city.name);
        });
  }
}
