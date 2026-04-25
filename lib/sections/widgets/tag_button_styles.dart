import 'package:flutter/material.dart';
import 'package:pointofsale_layout/theme/app_colors.dart';

final tagButtonStyle = TextButton.styleFrom(
  backgroundColor: AppColors.subduedSurface,
  foregroundColor: AppColors.inkStrong,
  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
  minimumSize: Size.zero,
  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
);

final dangerTagButtonStyle = tagButtonStyle.copyWith(
  backgroundColor: const WidgetStatePropertyAll(AppColors.dangerSurface),
  foregroundColor: const WidgetStatePropertyAll(AppColors.danger),
);
