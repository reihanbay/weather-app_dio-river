import 'package:flutter/material.dart';
import 'package:weather_app_dioriver/constants/app_colors.dart';

class ContainerProgressIndicator extends StatelessWidget {
  const ContainerProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondaryBlack,
      child: const Center(
        child: CircularProgressIndicator(color: AppColors.lightBlue),
      ),
    );
  }
}