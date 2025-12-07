import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  bool _isLoading = false;

  ThemeMode get themeMode => _themeMode;
  bool get isLoading => _isLoading;

  set themeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  // ✅ THEME YUKLASH
  Future<void> loadTheme() async {
    try {
      _isLoading = true;
      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      final savedTheme = prefs.getString('theme_mode');

      if (savedTheme == null) {
        // Hech narsa saqlanmagan - system theme dan foydalanamiz
        _themeMode = ThemeMode.system;
      } else {
        switch (savedTheme) {
          case 'light':
            _themeMode = ThemeMode.light;
            break;
          case 'dark':
            _themeMode = ThemeMode.dark;
            break;
          case 'system':
          default:
            _themeMode = ThemeMode.system;
            break;
        }
      }
    } catch (e) {
      print('❌ Theme yuklashda xato: $e');
      _themeMode = ThemeMode.system;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // ✅ THEME SAQLASH
  Future<void> saveTheme(ThemeMode mode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String themeValue;

      switch (mode) {
        case ThemeMode.light:
          themeValue = 'light';
          break;
        case ThemeMode.dark:
          themeValue = 'dark';
          break;
        case ThemeMode.system:
          themeValue = 'system';
          break;
      }

      await prefs.setString('theme_mode', themeValue);
      _themeMode = mode;
      notifyListeners();
    } catch (e) {
      print('❌ Theme saqlashda xato: $e');
    }
  }

  // ✅ SWITCH UCHUN QULAY METHOD
  Future<void> toggleTheme(bool isDark) async {
    final mode = isDark ? ThemeMode.dark : ThemeMode.light;
    await saveTheme(mode);
  }

  // ✅ THEME MODE CYCLE
  Future<void> cycleTheme() async {
    ThemeMode newMode;

    switch (_themeMode) {
      case ThemeMode.light:
        newMode = ThemeMode.dark;
        break;
      case ThemeMode.dark:
        newMode = ThemeMode.system;
        break;
      case ThemeMode.system:
        newMode = ThemeMode.light;
        break;
    }

    await saveTheme(newMode);
  }

  // LIGHT MODE
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
      iconTheme: const IconThemeData(color: Colors.black87),
    ),
    iconTheme: const IconThemeData(color: Colors.black87),
    textTheme: GoogleFonts.adventProTextTheme(ThemeData.light().textTheme)
        .copyWith(
          displayLarge: GoogleFonts.adventPro(
            color: Colors.black87,
            fontSize: 96,
          ),
          displayMedium: GoogleFonts.adventPro(
            color: Colors.black87,
            fontSize: 60,
          ),
          displaySmall: GoogleFonts.adventPro(
            color: Colors.black87,
            fontSize: 48,
          ),
          headlineLarge: GoogleFonts.adventPro(
            color: Colors.black87,
            fontSize: 34,
          ),
          headlineMedium: GoogleFonts.adventPro(
            color: Colors.black87,
            fontSize: 24,
          ),
          headlineSmall: GoogleFonts.adventPro(
            color: Colors.black87,
            fontSize: 20,
          ),
          titleLarge: GoogleFonts.adventPro(
            color: Colors.black87,
            fontSize: 16,
          ),
          titleMedium: GoogleFonts.adventPro(
            color: Colors.black87,
            fontSize: 14,
          ),
          titleSmall: GoogleFonts.adventPro(
            color: Colors.black87,
            fontSize: 12,
          ),
          bodyLarge: GoogleFonts.adventPro(color: Colors.black87, fontSize: 16),
          bodyMedium: GoogleFonts.adventPro(
            color: Colors.black87,
            fontSize: 14,
          ),
          bodySmall: GoogleFonts.adventPro(color: Colors.black87, fontSize: 12),
          labelLarge: GoogleFonts.adventPro(
            color: Colors.black87,
            fontSize: 14,
          ),
          labelMedium: GoogleFonts.adventPro(
            color: Colors.black87,
            fontSize: 12,
          ),
          labelSmall: GoogleFonts.adventPro(
            color: Colors.black87,
            fontSize: 11,
          ),
        ),
    cardColor: Colors.grey[100],
    dividerColor: Colors.grey[300],
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        textStyle: GoogleFonts.adventPro(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.amber,
      foregroundColor: Colors.black,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.grey[600],
    ),
  );

  // DARK MODE
  ThemeData get darkTheme => ThemeData.dark().copyWith(
    primaryColor: Colors.black12.withAlpha(150),
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF1E1E1E),
      elevation: 0,
      titleTextStyle: GoogleFonts.adventPro(
        color: Colors.white70,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: const IconThemeData(color: Colors.white70),
    ),
    iconTheme: const IconThemeData(color: Colors.white70),
    textTheme: GoogleFonts.adventProTextTheme(ThemeData.dark().textTheme)
        .copyWith(
          displayLarge: GoogleFonts.adventPro(
            color: Colors.white70,
            fontSize: 96,
          ),
          displayMedium: GoogleFonts.adventPro(
            color: Colors.white70,
            fontSize: 60,
          ),
          displaySmall: GoogleFonts.adventPro(
            color: Colors.white70,
            fontSize: 48,
          ),
          headlineLarge: GoogleFonts.adventPro(
            color: Colors.white70,
            fontSize: 34,
          ),
          headlineMedium: GoogleFonts.adventPro(
            color: Colors.white70,
            fontSize: 24,
          ),
          headlineSmall: GoogleFonts.adventPro(
            color: Colors.white70,
            fontSize: 20,
          ),
          titleLarge: GoogleFonts.adventPro(
            color: Colors.white70,
            fontSize: 16,
          ),
          titleMedium: GoogleFonts.adventPro(
            color: Colors.white70,
            fontSize: 14,
          ),
          titleSmall: GoogleFonts.adventPro(
            color: Colors.white70,
            fontSize: 12,
          ),
          bodyLarge: GoogleFonts.adventPro(color: Colors.white70, fontSize: 16),
          bodyMedium: GoogleFonts.adventPro(
            color: Colors.white70,
            fontSize: 14,
          ),
          bodySmall: GoogleFonts.adventPro(color: Colors.white70, fontSize: 12),
          labelLarge: GoogleFonts.adventPro(
            color: Colors.white70,
            fontSize: 14,
          ),
          labelMedium: GoogleFonts.adventPro(
            color: Colors.white70,
            fontSize: 12,
          ),
          labelSmall: GoogleFonts.adventPro(
            color: Colors.white70,
            fontSize: 11,
          ),
        ),
    cardColor: const Color(0xFF1E1E1E),
    dividerColor: Colors.grey[700],
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1E1E1E),
        foregroundColor: Colors.white70,
        textStyle: GoogleFonts.adventPro(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: const Color(0xFF1E1E1E),
      foregroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: const Color(0xFF1E1E1E),
      selectedItemColor: const Color(0xFF1E1E1E),
      unselectedItemColor: Colors.grey[500],
    ),
    buttonTheme: ButtonThemeData(buttonColor: Colors.white70),
  );
}
