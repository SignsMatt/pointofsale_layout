import 'package:flutter/material.dart';
import 'package:pointofsale_layout/theme/app_colors.dart';
import 'package:pointofsale_layout/theme/app_theme_colors.dart';

ButtonStyle tagButtonStyle(BuildContext context) {
  final colorScheme = Theme.of(context).colorScheme;

  return TextButton.styleFrom(
    backgroundColor: colorScheme.surfaceContainerHighest,
    foregroundColor: colorScheme.onSurface,
    textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );
}

ButtonStyle dangerTagButtonStyle(BuildContext context) {
  final colors = AppThemeColors.of(context);

  return tagButtonStyle(context).copyWith(
    backgroundColor: WidgetStatePropertyAll(colors.dangerSurface),
    foregroundColor: const WidgetStatePropertyAll(AppColors.danger),
  );
}
