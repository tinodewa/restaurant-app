import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  final Future<SharedPreferences> sharedPreference;
  static const darkTheme = 'DARK_THEME';
  static const dailyRecommendation = 'DAILY_RECOMMENDATION';

  PreferenceHelper({required this.sharedPreference});

  Future<bool> get isDarkTheme async {
    final prefs = await sharedPreference;
    return prefs.getBool(darkTheme) ?? false;
  }

  void setDarkTheme(bool value) async {
    final prefs = await sharedPreference;
    prefs.setBool(darkTheme, value);
  }

  Future<bool> get isDailyRecommendationActive async {
    final prefs = await sharedPreference;
    return prefs.getBool(dailyRecommendation) ?? false;
  }

  void setDailyNews(bool value) async {
    final prefs = await sharedPreference;
    prefs.setBool(dailyRecommendation, value);
  }
}
