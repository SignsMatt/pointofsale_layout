import 'package:flutter/material.dart';

class AppThemeColors extends ThemeExtension<AppThemeColors> {
  const AppThemeColors({
    required this.panelSurface,
    required this.cardSurface,
    required this.mutedSurface,
    required this.promoSurface,
    required this.inkStrong,
    required this.inkMuted,
    required this.sectionLabel,
    required this.sectionMuted,
    required this.subtleBorder,
    required this.dangerSurface,
    required this.avatarSurface,
    required this.avatarText,
  });

  final Color panelSurface;
  final Color cardSurface;
  final Color mutedSurface;
  final Color promoSurface;
  final Color inkStrong;
  final Color inkMuted;
  final Color sectionLabel;
  final Color sectionMuted;
  final Color subtleBorder;
  final Color dangerSurface;
  final Color avatarSurface;
  final Color avatarText;

  static const light = AppThemeColors(
    panelSurface: Color(0xFFFFFFFF),
    cardSurface: Color(0xFFFFFFFF),
    mutedSurface: Color(0xFFF3F5F7),
    promoSurface: Color(0xFFF2F3F6),
    inkStrong: Color(0xFF202733),
    inkMuted: Color(0xFF4C5666),
    sectionLabel: Color(0xFF626D7A),
    sectionMuted: Color(0xFF8B95A1),
    subtleBorder: Color(0x11000000),
    dangerSurface: Color(0xFFFFEBF1),
    avatarSurface: Color(0xFFFFE2ED),
    avatarText: Color(0xFFB8476A),
  );

  static const dark = AppThemeColors(
    panelSurface: Color(0xFF151A21),
    cardSurface: Color(0xFF1C232C),
    mutedSurface: Color(0xFF26303B),
    promoSurface: Color(0xFF222B35),
    inkStrong: Color(0xFFF3F6FA),
    inkMuted: Color(0xFFB5C0CC),
    sectionLabel: Color(0xFF9EAAB8),
    sectionMuted: Color(0xFF7F8B98),
    subtleBorder: Color(0x24FFFFFF),
    dangerSurface: Color(0xFF3A1D28),
    avatarSurface: Color(0xFF402334),
    avatarText: Color(0xFFFF8DB5),
  );

  static AppThemeColors of(BuildContext context) {
    return Theme.of(context).extension<AppThemeColors>()!;
  }

  @override
  AppThemeColors copyWith({
    Color? panelSurface,
    Color? cardSurface,
    Color? mutedSurface,
    Color? promoSurface,
    Color? inkStrong,
    Color? inkMuted,
    Color? sectionLabel,
    Color? sectionMuted,
    Color? subtleBorder,
    Color? dangerSurface,
    Color? avatarSurface,
    Color? avatarText,
  }) {
    return AppThemeColors(
      panelSurface: panelSurface ?? this.panelSurface,
      cardSurface: cardSurface ?? this.cardSurface,
      mutedSurface: mutedSurface ?? this.mutedSurface,
      promoSurface: promoSurface ?? this.promoSurface,
      inkStrong: inkStrong ?? this.inkStrong,
      inkMuted: inkMuted ?? this.inkMuted,
      sectionLabel: sectionLabel ?? this.sectionLabel,
      sectionMuted: sectionMuted ?? this.sectionMuted,
      subtleBorder: subtleBorder ?? this.subtleBorder,
      dangerSurface: dangerSurface ?? this.dangerSurface,
      avatarSurface: avatarSurface ?? this.avatarSurface,
      avatarText: avatarText ?? this.avatarText,
    );
  }

  @override
  AppThemeColors lerp(ThemeExtension<AppThemeColors>? other, double t) {
    if (other is! AppThemeColors) return this;

    return AppThemeColors(
      panelSurface: Color.lerp(panelSurface, other.panelSurface, t)!,
      cardSurface: Color.lerp(cardSurface, other.cardSurface, t)!,
      mutedSurface: Color.lerp(mutedSurface, other.mutedSurface, t)!,
      promoSurface: Color.lerp(promoSurface, other.promoSurface, t)!,
      inkStrong: Color.lerp(inkStrong, other.inkStrong, t)!,
      inkMuted: Color.lerp(inkMuted, other.inkMuted, t)!,
      sectionLabel: Color.lerp(sectionLabel, other.sectionLabel, t)!,
      sectionMuted: Color.lerp(sectionMuted, other.sectionMuted, t)!,
      subtleBorder: Color.lerp(subtleBorder, other.subtleBorder, t)!,
      dangerSurface: Color.lerp(dangerSurface, other.dangerSurface, t)!,
      avatarSurface: Color.lerp(avatarSurface, other.avatarSurface, t)!,
      avatarText: Color.lerp(avatarText, other.avatarText, t)!,
    );
  }
}
