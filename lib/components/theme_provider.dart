import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly'
]);

class ThemeProvider with ChangeNotifier {
  late ThemeData _themeData;
  double _fontSize = 16.0;
  final String _themeKey = 'theme';
  final String _fontSizeKey = 'font_size';

  ThemeProvider() {
    _loadTheme();
  }

  ThemeData get themeData => _themeData;
  double get fontSize => _fontSize;
  bool get isDarkMode => _themeData.brightness == Brightness.dark;

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool(_themeKey) ?? false;
    setTheme(isDarkMode);
    final fontSize = prefs.getDouble(_fontSizeKey) ?? 16.0;
    setFontSize(fontSize);
  }

  void setTheme(bool isDarkMode) {
    _themeData = isDarkMode ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }

  void setFontSize(double fontSize) {
    _fontSize = fontSize;
    notifyListeners();
    saveFontSize();
  }

  void setDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_themeKey, true);
    setTheme(true);
  }

  void setLightMode() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_themeKey, false);
    setTheme(false);
  }

  void saveFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble(_fontSizeKey, _fontSize);
  }
}
