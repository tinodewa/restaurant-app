import 'package:http/http.dart' as http;
import 'package:restaurantapp/data/model/restaurant_result.dart';

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/list';

  Future<RestaurantResult> futureRestaurants() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      var restaurantResult = restaurantResultFromJson(response.body);
      return restaurantResult;
    } else {
      throw Exception('Failed to load restaurant!');
    }
  }
}
