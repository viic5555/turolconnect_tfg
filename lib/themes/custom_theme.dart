import 'package:flutter/material.dart';

final ThemeData customTheme = ThemeData(
  primaryColor: Colors.red, // Rojo para las barras y elementos grandes
  scaffoldBackgroundColor: Colors.white, // Blanco de color de fondo
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: Colors.black, // Negro para los textos en tarjetas
      fontSize: 14,
    ),
    headline1: TextStyle(
      color: Colors.yellow, // Amarillo para textos grandes (títulos)
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.red, // Rojo para los botones elevados
      elevation: 0, // Sin sombra
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
);
