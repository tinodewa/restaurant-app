import 'package:http/http.dart' as http;
import 'package:restaurantapp/data/model/restaurant_detail_result.dart';
import 'package:restaurantapp/data/model/restaurant_result.dart';
import 'package:restaurantapp/data/model/restaurant_search_result.dart';

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  static const String _getAllRestaurant = 'list';
  static const String _getRestaurant = 'detail/';
  static const String _searchRestaurant = 'search?q=';

  String get getSmallImageById => '${_baseUrl}images/small/';

  String get getBigImageById => '${_baseUrl}images/large/';

  Future<RestaurantResult> futureGetAllRestaurants() async {
    final response = await http.get(Uri.parse('$_baseUrl$_getAllRestaurant'));

    if (response.statusCode == 200) {
      var restaurantResult = restaurantResultFromJson(response.body);
      return restaurantResult;
    } else {
      throw Exception('Failed to load restaurants!');
    }
  }

  Future<RestaurantDetailResult> futureGetDetailRestaurant(
      String idRestaurant) async {
    final response =
        await http.get(Uri.parse('$_baseUrl$_getRestaurant$idRestaurant'));

    if (response.statusCode == 200) {
      var restaurantDetailResult =
          restaurantDetailResultFromJson(response.body);
      return restaurantDetailResult;
    } else {
      throw Exception('Failed to load detail restaurant!');
    }
  }

  Future<RestaurantSearchResult> futureSearchRestaurant(
      String searchQuery) async {
    final response =
        await http.get(Uri.parse('$_baseUrl$_searchRestaurant$searchQuery'));

    if (response.statusCode == 200) {
      var restaurantSearchResult =
          restaurantSearchResultFromJson(response.body);
      return restaurantSearchResult;
    } else {
      throw Exception('Failed to search restaurant!');
    }
  }
}
