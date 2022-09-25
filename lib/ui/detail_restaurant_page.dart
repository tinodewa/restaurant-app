import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapp/data/api/api_service.dart';
import 'package:restaurantapp/provider/detail_restaurant_provider.dart';
import 'package:restaurantapp/ui/detail_restaurant_item.dart';

class DetailRestaurantPage extends StatefulWidget {
  static const routeName = '/detail-restaurant';

  // final Restaurant restaurant;
  final String idRestaurant;

  const DetailRestaurantPage({super.key, required this.idRestaurant});

  @override
  State<DetailRestaurantPage> createState() => _DetailRestaurantState();
}

class _DetailRestaurantState extends State<DetailRestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailRestaurantProvider>(
      create: (context) {
        return DetailRestaurantProvider(
          apiService: ApiService(),
          idRestaurant: widget.idRestaurant,
        );
      },
      child: const RestaurantDetailItem(),
    );
  }
}
