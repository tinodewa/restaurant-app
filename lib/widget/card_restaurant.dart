import 'package:flutter/material.dart';
import 'package:restaurantapp/common/navigation.dart';
import 'package:restaurantapp/data/model/restaurant_result.dart';

import '../ui/detail_restaurant_page.dart';

class CardRestaurant extends StatelessWidget {
  final Restaurant restaurant;

  const CardRestaurant({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: Navigation.intentWithData(
          DetailRestaurant.routeName,
          restaurant,
        ),
        child: Card(
          child: SizedBox(
            height: 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Hero(
                    tag: 'logo${restaurant.name.toString()}',
                    child: Image.network(
                      restaurant.pictureId.toString(),
                      fit: BoxFit.cover,
                      height: 75,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurant.name.toString(),
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 3),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.grey,
                              size: 15,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 3),
                            ),
                            Text(
                              restaurant.city.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.grey,
                              size: 15,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 3),
                            ),
                            Text(
                              restaurant.rating.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
