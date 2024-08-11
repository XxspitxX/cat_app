import 'package:flutter/material.dart';
import 'package:ui/resources/theme/app_colors.dart';
import 'package:ui/resources/values.dart';

class Themes {
  static final ThemeData materialLightTheme = ThemeData(
    primaryColor: AppColors.primarySwatch,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primarySwatch,
      iconTheme: IconThemeData(color: Colors.white),
      scrolledUnderElevation: 0.0,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    ),
    canvasColor: Colors.white,
    brightness: Brightness.light,
    highlightColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    cardTheme: const CardTheme(color: Colors.white),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(primary: AppColors.primarySwatch),
    fontFamily: "SFProDisplay",
    tabBarTheme: const TabBarTheme(indicatorColor: Colors.white),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      circularTrackColor: AppColors.primarySwatch,
    ),
    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.all(4),
      dense: true,
      horizontalTitleGap: 0.0,
      minLeadingWidth: 0,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: AppColors.textTitleDark,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
        fontSize: Values.textHeaderTitle,
      ),
      titleMedium: TextStyle(
        color: AppColors.textTitleDark,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
      ),
      titleSmall: TextStyle(
        color: AppColors.textTitleDark,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
      ),
      labelLarge: TextStyle(
        color: AppColors.textBodyDark,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        fontSize: Values.textBody,
      ),
      labelMedium: TextStyle(
        color: AppColors.textBodyDark,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      labelSmall: TextStyle(
        color: AppColors.textBodyDark,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      bodyLarge: TextStyle(
        color: AppColors.textBodyDark,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      bodyMedium: TextStyle(
        color: AppColors.textBodyDark,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      bodySmall: TextStyle(
        color: AppColors.textBodyDark,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
    segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
      side: WidgetStateProperty.all<BorderSide>(const BorderSide(
          color: AppColors.primarySwatch,
          width: Values.buttonBorderRadiusShort)),
      shape: WidgetStateProperty.all<OutlinedBorder>(
        const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8))),
      ),
      backgroundColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
        return states.contains(WidgetState.selected)
            ? AppColors.segmentedControlSelected
            : AppColors.primarySwatch;
      }),
      foregroundColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
        return states.contains(WidgetState.selected)
            ? AppColors.primarySwatch
            : AppColors.segmentedControlSelected;
      }),
    )),
  );
}
