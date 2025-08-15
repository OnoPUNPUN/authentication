import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SqureTile extends StatelessWidget {
  final String imagePath;

  const SqureTile({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[200],
      ),
      child: SvgPicture.asset(imagePath, height: 40),
    );
  }
}
