import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapp/provider/restaurant_provider.dart';
import 'package:restaurantapp/widget/card_restaurant.dart';

class RestaurantListPage extends StatelessWidget {
  const RestaurantListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _restaurantList(context);
  }

  Widget _restaurantList(BuildContext context) {
    return Consumer<RestaurantProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return ListView.builder(
            // physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            // padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            itemCount: state.result.restaurants.length,
            itemBuilder: (context, index) {
              var restaurant = state.result.restaurants[index];
              return CardRestaurant(restaurant: restaurant);
            },
          );
        } else if (state.state == ResultState.hasData) {
          return ListView.builder(
            // physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            // padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            itemCount: state.result.restaurants.length,
            itemBuilder: (context, index) {
              var restaurant = state.result.restaurants[index];
              return CardRestaurant(restaurant: restaurant);
            },
          );
        } else if (state.state == ResultState.noData) {
          return Center(
            child: Material(
              child: Text(state.message),
            ),
          );
        } else if (state.state == ResultState.error) {
          return Center(
            child: Material(
              child: Text(state.message),
            ),
          );
        } else {
          return const Center(
            child: Material(
              child: Text(''),
            ),
          );
        }
      },
    );
  }
}
