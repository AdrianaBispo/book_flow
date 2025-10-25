import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color error = Colors.red;
  static const Color success = Colors.green;
  static const Color warning = Colors.yellow;
  static const Color info = Colors.blue;

  // Cores do tema
  static const Color primaryPurple = Color(0xFF5B21B6);
  static const Color secondaryYellow = Color(0xFFFACC15);

  // Cores do texto
  static const Color lightText = Color(0xFFF9FAFB);
  static const Color darkText = Color(0xFF1F2937);

  // Cores do fundo e superfícies
  static const Color lightBackground = Color(0xFFF3F4F6);
  static const Color darkBackground = Color(0xFF111827);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color darkCard = Color(0xFF374151);

  static const Color lightBorder = Color(0xFFD1D5DB);
  static const Color lightBorder80 = Color(0x80D1D5DB);
  static const Color darkBorder = Color(0xFF4B5563);
  static const Color darkBorder80 = Color(0x804B5563);
  static const Color hintColor = Color(0xFF6B7280);

  static final Color? grey80 = Colors.grey[800];
  static final Color? grey60 = Colors.grey[600];
  static final Color? grey40 = Colors.grey[400];


  static final Color purple60 = Color.fromRGBO(91, 33, 182, 1);
  static final Color purple70 = Color.fromRGBO(91, 33, 182, .6);
  static final Color purple20 = Color.fromRGBO(91, 33, 182, 0.2);
  }
