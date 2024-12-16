import 'package:flutter/material.dart';
import 'package:weather_app_dioriver/constants/app_colors.dart';

class RoundTextField extends StatelessWidget {
  const RoundTextField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.accentBlue
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          color: Colors.white
        ),
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 12, top: 12),
          fillColor: Colors.white,
          focusColor: Colors.white,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}