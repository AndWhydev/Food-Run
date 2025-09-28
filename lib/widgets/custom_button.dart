import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  final double? width;
  const CustomButton({super.key, required this.label, required this.onTap, this.width});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var Size(:width, :height) = size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepOrange
        ),
        child: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: height * 0.05),
            child: Text(label),
          ),
        ),
      ),
    );
  }
}