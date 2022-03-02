// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) => LightModeTheme();

  Color primaryColor;
  Color secondaryColor;
  Color tertiaryColor;
  Color alternate;
  Color primaryBackground;
  Color secondaryBackground;
  Color primaryText;
  Color secondaryText;

  Color oxfordBlue;
  Color pewterBlue;
  Color budGreen;
  Color rosewood;
  Color orangePeel;
  Color platinum;
  Color cultured;
  Color cultured2;
  Color platinum2;
  Color cultured3;
  Color eerieBlack;
  Color eerieBlack2;
  Color eerieBlack3;
  Color eerieBlack4;
  Color eerieBlack5;

  TextStyle get title1 => GoogleFonts.getFont(
        'Source Sans Pro',
        color: oxfordBlue,
        fontWeight: FontWeight.w600,
        fontSize: 24,
      );
  TextStyle get title2 => GoogleFonts.getFont(
        'Source Sans Pro',
        color: oxfordBlue,
        fontWeight: FontWeight.w500,
        fontSize: 22,
      );
  TextStyle get title3 => GoogleFonts.getFont(
        'Source Sans Pro',
        color: oxfordBlue,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      );
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Source Sans Pro',
        color: oxfordBlue,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Source Sans Pro',
        color: oxfordBlue,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Source Sans Pro',
        color: oxfordBlue,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Source Sans Pro',
        color: oxfordBlue,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
}

class LightModeTheme extends FlutterFlowTheme {
  Color primaryColor = const Color(0xFF3474E0);
  Color secondaryColor = const Color(0xFFEE8B60);
  Color tertiaryColor = const Color(0xFFFFFFFF);
  Color alternate = const Color(0x00000000);
  Color primaryBackground = const Color(0x00000000);
  Color secondaryBackground = const Color(0x00000000);
  Color primaryText = const Color(0x00000000);
  Color secondaryText = const Color(0x00000000);

  Color oxfordBlue = Color(0xFF102542);
  Color pewterBlue = Color(0xFF8EB1C7);
  Color budGreen = Color(0xFF79B473);
  Color rosewood = Color(0xFF590004);
  Color orangePeel = Color(0xFFFF9F1C);
  Color platinum = Color(0xFFEAEAEA);
  Color cultured = Color(0xFFF7F7F7);
  Color cultured2 = Color(0xFFF4F4F4);
  Color platinum2 = Color(0xFFEAEAEA);
  Color cultured3 = Color(0xFFF4F4F4);
  Color eerieBlack = Color(0xFF171717);
  Color eerieBlack2 = Color(0xFF191919);
  Color eerieBlack3 = Color(0xFF181818);
  Color eerieBlack4 = Color(0xFF171717);
  Color eerieBlack5 = Color(0xFF181818);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String fontFamily,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    bool useGoogleFonts = true,
    double lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              height: lineHeight,
            );
}
