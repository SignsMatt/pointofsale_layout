import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointofsale_layout/theme/app_colors.dart';
import 'package:pointofsale_layout/theme/app_theme_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light {
    return _theme(
      brightness: Brightness.light,
      colors: AppThemeColors.light,
      scaffoldBackgroundColor: AppColors.white,
      colorScheme: const ColorScheme.light(
        primary: AppColors.filterAccent,
        surface: AppColors.white,
      ),
    );
  }

  static ThemeData get dark {
    return _theme(
      brightness: Brightness.dark,
      colors: AppThemeColors.dark,
      scaffoldBackgroundColor: const Color(0xFF0F1318),
      colorScheme: const ColorScheme.dark(
        primary: AppColors.filterAccent,
        surface: Color(0xFF1C232C),
      ),
    );
  }

  static ThemeData _theme({
    required Brightness brightness,
    required AppThemeColors colors,
    required Color scaffoldBackgroundColor,
    required ColorScheme colorScheme,
  }) {
    final textTheme = GoogleFonts.interTextTheme(
      brightness == Brightness.dark ? ThemeData.dark().textTheme : null,
    );

    return ThemeData(
      brightness: brightness,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      colorScheme: colorScheme,
      extensions: [colors],
      textTheme: textTheme,
      cardTheme: CardThemeData(
        color: colors.cardSurface,
        surfaceTintColor: Colors.transparent,
      ),
      chipTheme: ChipThemeData(
        showCheckmark: false,
        side: BorderSide.none,
        shape: const StadiumBorder(),
        surfaceTintColor: Colors.transparent,
        labelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: colors.inkStrong,
        ),
        secondaryLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        color: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.filterAccent;
          }
          if (states.contains(WidgetState.pressed)) {
            return colors.mutedSurface;
          }
          return Colors.transparent;
        }),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colors.mutedSurface,
          foregroundColor: colors.inkStrong,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          backgroundColor: colors.mutedSurface,
          foregroundColor: colors.inkMuted,
          fixedSize: const Size.square(34),
          minimumSize: const Size.square(34),
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          iconSize: 18,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
