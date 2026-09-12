import 'package:flutter/material.dart';

/// Design tokens — tint [accent] / [accentSoft] to brand; keep neutrals hue-cast consistent with [bg].
class AppColors {
  AppColors._();

  // Brand accent — used sparingly (60/30/10)
  static const accent = Color(0xFF1C3D5A); // placeholder navy
  static const accentSoft = Color(0x141C3D5A); // 8% tint for selected fills

  // Semantic
  static const money = Color(0xFF1B7A4E); // price / positive amount

  // Neutral ramp — never pure #FFFFFF as page bg
  static const bg = Color(0xFFFBFAF8); // warm off-white
  static const surface = Color(0xFFFFFFFF);
  static const surfaceRaised = Color(0xFFFFFEFC);
  static const hairline = Color(0x0F0E1116); // ~6% dividers
  static const ink = Color(0xFF0E1116);
  static const inkMuted = Color(0xFF6B7280);
  static const inkFaint = Color(0xFF9CA3AF);

  // Neutral shadow — never tint with saturated brand
  static const shadow = Color(0x14070A12);
}
