import 'package:flutter/material.dart';
import 'theme.dart';

abstract class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    brightness: Brightness.light,
    primaryColor: AppColors.lightBackground,
    scaffoldBackgroundColor: AppColors.lightBackground,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryPurple,
      secondary: AppColors.secondaryYellow,
      surface: AppColors.lightCard,
    ),

    dividerColor: AppColors.lightBorder,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.purple60,
      elevation: 1,
      iconTheme: const IconThemeData(color: AppColors.lightCard),
      centerTitle: true,
      titleTextStyle: AppStyles.headlineLarge.copyWith(
        color: AppColors.lightText,
        fontFamily: 'PT Serif',
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.lightText,
        backgroundColor: AppColors.primaryPurple,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
        textStyle: AppStyles.bodyMedium.copyWith(color: AppColors.lightBorder),
      ),
    ),
    textTheme: TextTheme(
      labelLarge: AppStyles.labelLarge,
      bodyLarge: AppStyles.headlineLarge.copyWith(color: AppColors.grey80),
      bodyMedium: AppStyles.bodyMedium,
      bodySmall: AppStyles.bodySmall.copyWith(color: Colors.grey[600]),
      titleLarge: AppStyles.titleLarge.copyWith(color: AppColors.grey80),
      titleMedium: AppStyles.titleMedium.copyWith(color: AppColors.grey60),
      titleSmall: AppStyles.titleSmall.copyWith(color: AppColors.darkText),
      headlineLarge: AppStyles.headlineLarge,
      displayLarge: AppStyles.displayLarge,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightBackground,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.lightBorder, width: 1.0),
      ),

      // Border quando habilitado
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.lightBorder, width: 1.0),
      ),

      // Border quando focado
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.primaryPurple,
          width: 2.0,
        ),
      ),

      // Border de erro
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.error, width: 1.0),
      ),

      // Border de erro quando focado
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.error, width: 2.0),
      ),

      // Border desabilitado
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.lightBorder80, width: 1.0),
      ),

      // Estilos de texto
      labelStyle: AppStyles.bodyMedium.copyWith(color: AppColors.darkBorder),
      hintStyle: AppStyles.bodyMedium.copyWith(color: AppColors.hintColor),
      errorStyle: AppStyles.bodyMedium.copyWith(color: AppColors.error),

      // Estilos dos ícones
      prefixIconColor: AppColors.hintColor,
      suffixIconColor: AppColors.hintColor,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightBackground,
      selectedItemColor: AppColors.primaryPurple,
      unselectedItemColor: AppColors.grey60,
      selectedLabelStyle: AppStyles.bodySmall.copyWith(
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: AppStyles.bodySmall,
      selectedIconTheme: const IconThemeData(
        size: 24,
        color: AppColors.primaryPurple,
      ),
      unselectedIconTheme: IconThemeData(size: 20, color: AppColors.grey60),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryPurple,
    scaffoldBackgroundColor: AppColors.darkBackground,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryPurple,
      secondary: AppColors.secondaryYellow,
      surface: AppColors.darkCard,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.lightText,
        backgroundColor: AppColors.primaryPurple,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkBackground,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

      // Border padrão (inativo)
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.darkBorder, width: 1.0),
      ),

      // Border quando habilitado
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.darkBorder, width: 1.0),
      ),

      // Border quando focado
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.primaryPurple,
          width: 2.0,
        ),
      ),

      // Border de erro
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.error, width: 1.0),
      ),

      // Border de erro quando focado
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.error, width: 2.0),
      ),

      // Border desabilitado
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.lightBorder80, width: 1.0),
      ),

      // Estilos de texto

      // Estilos de texto
      labelStyle: AppStyles.bodyMedium.copyWith(color: AppColors.darkBorder),
      hintStyle: AppStyles.bodyMedium.copyWith(color: AppColors.hintColor),
      errorStyle: AppStyles.bodyMedium.copyWith(color: AppColors.error),

      // Estilos dos ícones
      prefixIconColor: AppColors.hintColor,
      suffixIconColor: AppColors.hintColor,
    ),
  );
}
