import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  final Future<SharedPreferences> sharedPreferences;

  PreferenceHelper({required this.sharedPreferences});

  static const darkTheme = 'DARK_THEME';
  static const dailyRecommendation = 'DAILY_RECOMMENDATION';

  Future<bool> get isDarkTheme async {
    final prefs = await sharedPreferences;
    return prefs.getBool(darkTheme) ?? false;
  }

  void setDarkTheme(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(darkTheme, value);
  }

  Future<bool> get isDailyRecommendationActive async {
    final prefs = await sharedPreferences;
    return prefs.getBool(dailyRecommendation) ?? false;
  }

  void setDailyRecommendation(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(dailyRecommendation, value);
  }
}
