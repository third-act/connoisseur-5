import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_radius.dart';
import 'app_space.dart';

/// ThemeData built from KIT tokens. Tint accents before shipping a pitch.
class AppTheme {
  AppTheme._();

  static ThemeData light() {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: null,
    );

    final textTheme = _textTheme(base.textTheme);

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.bg,
      colorScheme: ColorScheme.light(
        primary: AppColors.accent,
        onPrimary: Colors.white,
        secondary: AppColors.accent,
        onSecondary: Colors.white,
        surface: AppColors.surface,
        onSurface: AppColors.ink,
        error: const Color(0xFFB3261E),
        onError: Colors.white,
      ),
      textTheme: textTheme,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.bg,
        foregroundColor: AppColors.ink,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.card),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.hairline,
        thickness: 1,
        space: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.pill),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.pill),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.pill),
          borderSide: const BorderSide(color: AppColors.accent, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.pill),
          borderSide: const BorderSide(color: Color(0xFFB3261E)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.pill),
          borderSide: const BorderSide(color: Color(0xFFB3261E), width: 1.5),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpace.lg,
          vertical: AppSpace.md,
        ),
        hintStyle: const TextStyle(color: AppColors.inkFaint, fontSize: 15),
        labelStyle: const TextStyle(color: AppColors.inkMuted, fontSize: 13),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surface,
        selectedColor: AppColors.accentSoft,
        labelStyle: const TextStyle(color: AppColors.ink, fontSize: 14),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpace.md,
          vertical: AppSpace.sm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.chip),
        ),
        side: BorderSide.none,
      ),
      splashFactory: InkRipple.splashFactory,
    );
  }

  static TextTheme _textTheme(TextTheme base) {
    const tabular = [FontFeature.tabularFigures()];

    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(
            color: AppColors.ink,
            fontWeight: FontWeight.w700,
            fontSize: 36,
            height: 1.1,
            letterSpacing: -0.8,
          ) ??
          const TextStyle(
            color: AppColors.ink,
            fontWeight: FontWeight.w700,
            fontSize: 36,
            height: 1.1,
            letterSpacing: -0.8,
          ),
      displayMedium: base.displayMedium?.copyWith(
            color: AppColors.ink,
            fontWeight: FontWeight.w700,
            fontSize: 32,
            height: 1.1,
            letterSpacing: -0.6,
          ) ??
          const TextStyle(
            color: AppColors.ink,
            fontWeight: FontWeight.w700,
            fontSize: 32,
            height: 1.1,
            letterSpacing: -0.6,
          ),
      titleLarge: base.titleLarge?.copyWith(
            color: AppColors.ink,
            fontWeight: FontWeight.w600,
            fontSize: 22,
            height: 1.2,
            letterSpacing: -0.3,
          ) ??
          const TextStyle(
            color: AppColors.ink,
            fontWeight: FontWeight.w600,
            fontSize: 22,
            height: 1.2,
            letterSpacing: -0.3,
          ),
      titleMedium: base.titleMedium?.copyWith(
            color: AppColors.ink,
            fontWeight: FontWeight.w600,
            fontSize: 17,
            height: 1.25,
            letterSpacing: -0.2,
          ) ??
          const TextStyle(
            color: AppColors.ink,
            fontWeight: FontWeight.w600,
            fontSize: 17,
            height: 1.25,
            letterSpacing: -0.2,
          ),
      bodyLarge: base.bodyLarge?.copyWith(
            color: AppColors.ink,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1.5,
            fontFeatures: tabular,
          ) ??
          const TextStyle(
            color: AppColors.ink,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1.5,
            fontFeatures: tabular,
          ),
      bodyMedium: base.bodyMedium?.copyWith(
            color: AppColors.ink,
            fontWeight: FontWeight.w400,
            fontSize: 15,
            height: 1.5,
            fontFeatures: tabular,
          ) ??
          const TextStyle(
            color: AppColors.ink,
            fontWeight: FontWeight.w400,
            fontSize: 15,
            height: 1.5,
            fontFeatures: tabular,
          ),
      bodySmall: base.bodySmall?.copyWith(
            color: AppColors.inkMuted,
            fontWeight: FontWeight.w500,
            fontSize: 13,
            height: 1.3,
            letterSpacing: 0.2,
            fontFeatures: tabular,
          ) ??
          const TextStyle(
            color: AppColors.inkMuted,
            fontWeight: FontWeight.w500,
            fontSize: 13,
            height: 1.3,
            letterSpacing: 0.2,
            fontFeatures: tabular,
          ),
      labelSmall: base.labelSmall?.copyWith(
            color: AppColors.inkMuted,
            fontWeight: FontWeight.w600,
            fontSize: 11,
            height: 1.2,
            letterSpacing: 1.2,
          ) ??
          const TextStyle(
            color: AppColors.inkMuted,
            fontWeight: FontWeight.w600,
            fontSize: 11,
            height: 1.2,
            letterSpacing: 1.2,
          ),
    );
  }
}
