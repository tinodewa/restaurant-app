import 'package:flutter/material.dart';
import '../common/styles.dart';
import '../data/provider/preferences_helper.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferenceHelper preferenceHelper;

  PreferencesProvider({required this.preferenceHelper}) {
    _getTheme();
    _getDailyRecommendationPreferences();
  }

  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;

  bool _isDailyNewsActive = false;
  bool get isDailyNewsActive => _isDailyNewsActive;

  ThemeData get themeData => _isDarkTheme ? darkTheme : lightTheme;

  void _getTheme() async {
    _isDarkTheme = await preferenceHelper.isDarkTheme;
    notifyListeners();
  }

  void _getDailyRecommendationPreferences() async {
    _isDailyNewsActive = await preferenceHelper.isDailyRecommendationActive;
    notifyListeners();
  }

  void enableDarkTheme(bool value) {
    _isDarkTheme = value;
    notifyListeners();
  }

  void enableDailyNews(bool value) {
    _isDailyNewsActive = value;
    notifyListeners();
  }
}
