import 'package:flutter/cupertino.dart';
import 'package:restaurantapp/data/api/api_service.dart';
import 'package:restaurantapp/data/model/restaurant_search_result.dart';

enum ResultState { loading, noData, hasData, error }

class SearchRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;
  final String nameRestaurant;

  SearchRestaurantProvider({
    required this.apiService,
    required this.nameRestaurant,
  }) {
    _fetchSearchRestaurant();
  }

  late RestaurantSearchResult _restaurantSearchResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  RestaurantSearchResult get searchResult => _restaurantSearchResult;

  ResultState get state => _state;

  Future<dynamic> _fetchSearchRestaurant() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final searchRestaurant =
          await apiService.futureSearchRestaurant(nameRestaurant);
      if (searchRestaurant.restaurants.isNotEmpty) {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantSearchResult = searchRestaurant;
      } else {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Restoran tidak ditemukan!';
      }
    } catch (e) {
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
