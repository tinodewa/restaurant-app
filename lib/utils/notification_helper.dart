import 'dart:developer' as developer;
import 'dart:math' as math;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:restaurantapp/data/model/restaurant_result.dart';
import 'package:rxdart/rxdart.dart';
import '../common/navigation.dart';

final selectNotificationSubject = BehaviorSubject<String>();
var randomIndex;

class NotificationHelper {
  static NotificationHelper? _instance;

  NotificationHelper._internal() {
    _instance = this;
  }

  factory NotificationHelper() => _instance ?? NotificationHelper._internal();

  Future<void> initNotifications(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('app_icon');

    var initializationSettingsIOS = const IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
      if (payload != null) {
        developer.log('Notification payload: $payload');
      }
      selectNotificationSubject.add(payload ?? 'Empty payload');
    });
  }

  Future<void> showNotification(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
      RestaurantResult restaurantResult) async {
    var channelId = "1";
    var channelName = "Restaurant App";
    var channelDescription = "Restaurant App";

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        channelId, channelName,
        channelDescription: channelDescription,
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        styleInformation: const DefaultStyleInformation(true, true));

    var iOsPlatformChannelSpecifics = const IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOsPlatformChannelSpecifics);

    var titleNotification = "<b>Daily Recommendation</b>";
    randomIndex = math.Random().nextInt(restaurantResult.restaurants.length);
    var titleRestaurant = restaurantResult.restaurants[randomIndex].name;

    await flutterLocalNotificationsPlugin.show(
        0, titleNotification, titleRestaurant, platformChannelSpecifics,
        payload: restaurantResultToJson(restaurantResult));
  }

  void configureSelectNotificationSubject(String route) {
    selectNotificationSubject.stream.listen(
      (String payload) async {
        var data = restaurantResultFromJson(payload);
        var article = data.restaurants[randomIndex].id;
        Navigation.intentWithData(route, article);
      },
    );
  }
}
