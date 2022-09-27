import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapp/common/styles.dart';
import 'package:restaurantapp/provider/detail_restaurant_provider.dart';
import 'package:restaurantapp/widget/detail_restaurant.dart';

class RestaurantDetailItem extends StatelessWidget {
  const RestaurantDetailItem({super.key});

  @override
  Widget build(BuildContext context) {
    return restaurantConsumer(context);
  }

  Widget restaurantConsumer(BuildContext context) {
    return Consumer<DetailRestaurantProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.state == ResultState.hasData) {
          return DetailRestaurant(restaurant: state.detailResult.restaurant);
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
