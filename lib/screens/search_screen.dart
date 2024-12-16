import 'package:flutter/material.dart';
import 'package:weather_app_dioriver/constants/app_colors.dart';
import 'package:weather_app_dioriver/constants/text_styles.dart';
import 'package:weather_app_dioriver/views/famous_cities_view.dart';
import 'package:weather_app_dioriver/views/gradien_container.dart';
import 'package:weather_app_dioriver/views/widget/round_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradienContainer(children: [
        const Align(
            alignment: Alignment.center,
            child: Text('Pick Location', style: TextStyles.h1)),
        const SizedBox(height: 30),
        const Text(
            'Find the area or city that you want to know detailed weather info at this time',
            textAlign: TextAlign.center,
            style: TextStyles.subtitleText),
        const SizedBox(height: 40),
        Row(
          children: [
            Expanded(
              child: RoundTextField(controller: controller),
            ),
            const SizedBox(width: 15),
            const LocationIcon()
          ],
        ),
        const SizedBox(height: 24),

        //Famous Cities View
        const FamousCitiesView(),
      ]),
    );
  }
}

class LocationIcon extends StatelessWidget {
  const LocationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.accentBlue),
      child: const Icon(Icons.location_on_outlined, color: Colors.white),
    );
  }
}
