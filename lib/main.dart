import 'package:flutter/material.dart';
import 'package:restaurantapp/common/navigation.dart';
import 'package:restaurantapp/common/styles.dart';
import 'package:restaurantapp/data/model/restaurant.dart';
import 'package:restaurantapp/ui/detail_restaurant_page.dart';
import 'package:restaurantapp/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              secondary: secondaryColor,
              onPrimary: Colors.black,
            ),
        textTheme: restaurantTextTheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryLightColor,
            foregroundColor: whiteColor,
            textStyle: const TextStyle(),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
            ),
          ),
        ),
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        DetailRestaurant.routeName: (context) => DetailRestaurant(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurants,
            )
      },
      navigatorKey: navigatorKey,
    );
  }
}
