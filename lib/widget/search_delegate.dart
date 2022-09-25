import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapp/provider/search_restaurant_provider.dart';
import 'package:restaurantapp/widget/search_restaurant.dart';

import '../common/styles.dart';
import '../data/api/api_service.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final contentWidget = ChangeNotifierProvider<SearchRestaurantProvider>(
      create: (context) => SearchRestaurantProvider(
          apiService: ApiService(), nameRestaurant: query),
      child: const SearchConsumer(),
    );

    return contentWidget;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }
}

class SearchConsumer extends StatelessWidget {
  const SearchConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchRestaurantProvider>(
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
            itemCount: state.searchResult.restaurants.length,
            itemBuilder: (context, index) {
              var restaurant = state.searchResult.restaurants[index];
              return CardSearchRestaurant(restaurant: restaurant);
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
