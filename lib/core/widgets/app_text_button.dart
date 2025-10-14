import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.text,
    this.onTap,
    this.isLoading = false,
    this.textStyle,
    this.width,
    this.height,
  });
  final void Function()? onTap;
  final String text;
  final bool isLoading;
  final TextStyle? textStyle;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width?.toDouble() ?? 150,
        height: height?.toDouble() ?? 50,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: const Color(0xFF34A853),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  text,
                  style: textStyle,
                ),
        ),
      ),
    );
  }
}
