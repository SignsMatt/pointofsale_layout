import 'package:flutter/material.dart';
import 'package:pointofsale_layout/theme/app_colors.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.foregroundColor = AppColors.inkMuted,
    this.backgroundColor = AppColors.neutralSurface,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final Color foregroundColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 34,
      height: 34,
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(10),
          child: Icon(icon, size: 18, color: foregroundColor),
        ),
      ),
    );
  }
}
