import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapp/common/styles.dart';
import 'package:restaurantapp/data/api/api_service.dart';
import 'package:restaurantapp/provider/restaurant_provider.dart';
import 'package:restaurantapp/ui/restaurant_list_page.dart';
import 'package:restaurantapp/widget/platform_widget.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home-page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  final _contentWidget = ChangeNotifierProvider<RestaurantProvider>(
    create: (context) => RestaurantProvider(apiService: ApiService()),
    child: const RestaurantListPage(),
  );

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Restaurant',
              style: TextStyle(
                fontSize: 20,
                color: whiteColor,
              ),
            ),
            Text(
              'Find your favorite food',
              style: TextStyle(
                fontSize: 14,
                color: whiteColor,
              ),
            ),
          ],
        ),
      ),
      body: _contentWidget,
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Restaurant'),
      ),
      child: _contentWidget,
    );
  }
}
