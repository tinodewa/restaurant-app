import 'package:flutter_test/flutter_test.dart';
import 'package:restaurantapp/data/api/api_service.dart';

void main() {
  test('Should contain parsed data from API', () async {
    //setup
    final ApiService apiService = ApiService();

    //act
    final restaurant = await apiService.futureGetAllRestaurants();

    //assert
    var result = restaurant.restaurants.isNotEmpty;
    expect(result, true);
  });
}
