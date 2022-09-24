import 'package:flutter/material.dart';
import 'package:restaurantapp/common/styles.dart';
import 'package:restaurantapp/data/model/restaurant.dart';

class DetailRestaurant extends StatelessWidget {
  static const routeName = '/detail-restaurant';

  final Restaurants restaurant;

  const DetailRestaurant({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    List<Foods>? foods = restaurant.menus?.foods;
    List<Drinks>? drinks = restaurant.menus?.drinks;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              primary: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                background: Hero(
                  tag: 'logo${restaurant.name}',
                  child: Image.network(
                    restaurant.pictureId.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  restaurant.name.toString(),
                  overflow: TextOverflow.ellipsis,
                ),
                titlePadding: const EdgeInsets.only(left: 54, bottom: 16),
                collapseMode: CollapseMode.parallax,
                expandedTitleScale: 1,
              ),
              iconTheme: const IconThemeData(color: whiteColor),
            )
          ];
        },
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name.toString(),
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 5),
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
                const Padding(
                  padding: EdgeInsets.only(bottom: 5),
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
                const Padding(
                  padding: EdgeInsets.only(bottom: 15),
                ),
                const Text(
                  'Deskripsi:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 5),
                ),
                Text(
                  restaurant.description.toString(),
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    height: 1.1,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                const Text(
                  'Makanan yang tersedia:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(top: 10),
                  shrinkWrap: true,
                  itemCount: foods?.length,
                  itemBuilder: (context, index) {
                    final food = foods?[index].name;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '- ${food.toString()}',
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 5),
                        ),
                      ],
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                const Text(
                  'Minuman yang tersedia:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(top: 10),
                  shrinkWrap: true,
                  itemCount: drinks?.length,
                  itemBuilder: (context, index) {
                    final drink = drinks?[index].name;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '- ${drink.toString()}',
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 5),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
