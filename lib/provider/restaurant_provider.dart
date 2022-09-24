import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:restaurantapp/data/api/api_service.dart';
import 'package:restaurantapp/data/model/restaurant_result.dart';

enum ResultState { loading, noData, hasData, error }

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantProvider({required this.apiService}) {
    _fetchAllRestaurant();
  }

  late RestaurantResult _restaurantResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  RestaurantResult get result => _restaurantResult;

  ResultState get state => _state;

  Future<dynamic> _fetchAllRestaurant() async {
    try {
      log('response: loading');
      _state = ResultState.loading;
      notifyListeners();
      final restaurant = await apiService.futureRestaurants();
      if (restaurant.restaurants.isNotEmpty) {
        log('response: has data');
        _state == ResultState.hasData;
        notifyListeners();
        return _restaurantResult = restaurant;
      } else {
        log('response: no data');
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      }
    } catch (e) {
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
