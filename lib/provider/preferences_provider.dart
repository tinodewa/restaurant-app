import 'package:flutter/material.dart';
import '../common/styles.dart';
import '../data/preferences/preferences_helper.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferenceHelper preferenceHelper;

  PreferencesProvider({required this.preferenceHelper}) {
    _getTheme();
    _getDailyRecommendationPreferences();
  }

  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;

  bool _isDailyRecommendationActive = false;
  bool get isDailyRecommendationActive => _isDailyRecommendationActive;

  ThemeData get themeData => _isDarkTheme ? darkTheme : lightTheme;

  void _getTheme() async {
    _isDarkTheme = await preferenceHelper.isDarkTheme;
    notifyListeners();
  }

  void _getDailyRecommendationPreferences() async {
    _isDailyRecommendationActive =
        await preferenceHelper.isDailyRecommendationActive;
    notifyListeners();
  }

  void enableDarkTheme(bool value) {
    preferenceHelper.setDarkTheme(value);
    _getTheme();
  }

  void enableDailyRecommendation(bool value) {
    preferenceHelper.setDailyRecommendation(value);
    _getDailyRecommendationPreferences();
  }
}
