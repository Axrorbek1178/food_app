import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  // LIGHT MODE - bu yerga light mode uchun ranglar
  ThemeData get lightTheme => ThemeData.light().copyWith(
    primaryColor: Colors.amber,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.amber,
      foregroundColor: Colors.black,
      elevation: 0,
      titleTextStyle: GoogleFonts.adventPro(
        color: Colors.black87,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.black87),
    textTheme: GoogleFonts.adventProTextTheme(ThemeData.dark().textTheme)
        .copyWith(
          bodyLarge: GoogleFonts.adventPro(color: Colors.white70, fontSize: 16),
          bodyMedium: const TextStyle(color: Colors.black87),
        ),
    cardColor: Colors.grey[100],
    dividerColor: Colors.grey[300],
    // Boshqa custom light mode sozlamalari
  );

  // DARK MODE - bu yerga dark mode uchun ranglar
  ThemeData get darkTheme => ThemeData.dark().copyWith(
    primaryColor: const Color.fromARGB(255, 58, 90, 117),
    scaffoldBackgroundColor: const Color(0xFF121212),
    // appBarTheme: const AppBarTheme(
    //   backgroundColor: Color(0xFF1E1E1E),
    //   elevation: 0,
    // ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF1E1E1E),
      elevation: 0,
      titleTextStyle: GoogleFonts.adventPro(
        color: Colors.white70,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.white70),
    textTheme: GoogleFonts.adventProTextTheme(ThemeData.dark().textTheme)
        .copyWith(
          bodyLarge: GoogleFonts.adventPro(color: Colors.black87, fontSize: 16),
          bodyMedium: const TextStyle(color: Colors.white70),
        ),
    cardColor: const Color(0xFF1E1E1E),
    dividerColor: Colors.grey[700],
    // Boshqa custom dark mode sozlamalari
    buttonTheme: ButtonThemeData(
      buttonColor: const Color.fromARGB(255, 47, 83, 113),
      textTheme: ButtonTextTheme.primary,
    ),
  );

  void toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
