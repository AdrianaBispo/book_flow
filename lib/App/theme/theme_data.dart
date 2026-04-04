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
      error: AppColors.error, // Cor de erro
      onError: AppColors
          .lightBackground, // Cor de texto para erro (usado em Snackbar, por exemplo)
      onSurface: AppColors.lightBackground,
    ),

    dividerColor: AppColors.lightBorder,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryPurple,
      elevation: 1,
      iconTheme: const IconThemeData(color: AppColors.lightCard),
      centerTitle: true,
      titleTextStyle: AppStyles.headlineLarge.copyWith(
        color: AppColors.lightText,
        fontFamily: 'PT Serif',
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.primaryPurple;
          }
          return AppColors.primaryPurple;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.lightText;
          }
          return AppColors.lightText;
        }),

        padding: WidgetStatePropertyAll(
          const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),

        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),

        elevation: const WidgetStatePropertyAll(0),

        textStyle: WidgetStatePropertyAll(
          AppStyles.bodyMedium.copyWith(color: AppColors.lightBorder),
        ),
      ),
    ),
    textTheme: TextTheme(
      labelLarge: AppStyles.labelLarge,
      bodyLarge: AppStyles.headlineLarge.copyWith(color: AppColors.grey80),
      bodyMedium: AppStyles.bodyMedium.copyWith(color: AppColors.grey80),
      bodySmall: AppStyles.bodySmall.copyWith(color: AppColors.grey40),
      titleLarge: AppStyles.titleLarge.copyWith(color: AppColors.grey80),
      titleMedium: AppStyles.titleMedium.copyWith(color: AppColors.grey60),
      titleSmall: AppStyles.titleSmall.copyWith(color: AppColors.grey60),
      headlineLarge: AppStyles.headlineLarge.copyWith(
        fontFamily: 'PT Serif',
        color: AppColors.grey80,
      ),
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
      errorStyle: AppStyles.bodySmall.copyWith(color: AppColors.error),

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

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 16)),

        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),

        side: WidgetStateProperty.resolveWith((states) {
          return BorderSide(color: AppColors.info);
        }),

        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.grey80;
          }
          return AppColors.info;
        }),

        textStyle: WidgetStatePropertyAll(
          AppStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
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
