import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapp/common/styles.dart';
import 'package:restaurantapp/provider/restaurant_provider.dart';
import 'package:restaurantapp/widget/card_restaurant.dart';

class RestaurantListPage extends StatefulWidget {
  static const String headlineText = 'Restaurant';
  const RestaurantListPage({super.key});

  @override
  State<RestaurantListPage> createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  @override
  Widget build(BuildContext context) {
    return _restaurantList(context);
  }

  Widget _restaurantList(BuildContext context) {
    return Consumer<RestaurantProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.state == ResultState.hasData) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            shrinkWrap: true,
            itemCount: state.result.restaurants.length,
            itemBuilder: (context, index) {
              var restaurant = state.result.restaurants[index];
              return CardRestaurant(restaurant: restaurant);
            },
          );
        } else if (state.state == ResultState.noData) {
          return Center(
            child: Material(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: secondaryColor),
                Text(state.message),
              ],
            )),
          );
        } else if (state.state == ResultState.noConnection) {
          return Center(
            child: Material(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: secondaryColor),
                Text(state.message),
              ],
            )),
          );
        } else if (state.state == ResultState.error) {
          return Center(
            child: Material(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: secondaryColor),
                Text(state.message),
              ],
            )),
          );
        } else {
          return Center(
            child: Material(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.error_outline, color: secondaryColor),
                Text('Coba lagi nanti!'),
              ],
            )),
          );
        }
      },
    );
  }
}
