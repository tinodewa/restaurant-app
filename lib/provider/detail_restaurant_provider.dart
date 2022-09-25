import 'package:flutter/cupertino.dart';
import 'package:restaurantapp/data/api/api_service.dart';
import 'package:restaurantapp/data/model/restaurant_detail_result.dart';

enum ResultState { loading, noData, hasData, error }

class DetailRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;
  final String idRestaurant;

  DetailRestaurantProvider(
      {required this.apiService, required this.idRestaurant}) {
    _fetchDetailRestaurant();
  }

  late RestaurantDetailResult _restaurantDetailResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  RestaurantDetailResult get detailResult => _restaurantDetailResult;

  ResultState get state => _state;

  Future<dynamic> _fetchDetailRestaurant() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurant =
          await apiService.futureGetDetailRestaurant(idRestaurant);
      if (restaurant.restaurant.toString().isNotEmpty) {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantDetailResult = restaurant;
      } else {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Data tidak ditemukan!';
      }
    } catch (e) {
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
