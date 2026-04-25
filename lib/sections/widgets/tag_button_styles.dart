import 'package:flutter/material.dart';
import 'package:pointofsale_layout/theme/app_colors.dart';

final tagButtonStyle = TextButton.styleFrom(
  backgroundColor: AppColors.subduedSurface,
  foregroundColor: AppColors.inkStrong,
  textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
);

final dangerTagButtonStyle = tagButtonStyle.copyWith(
  backgroundColor: const WidgetStatePropertyAll(AppColors.dangerSurface),
  foregroundColor: const WidgetStatePropertyAll(AppColors.danger),
);
