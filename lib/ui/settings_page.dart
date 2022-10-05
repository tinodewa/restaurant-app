import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/preferences_provider.dart';
import '../widget/platform_widget.dart';

class SettingsPage extends StatelessWidget {
  static const String settingsText = 'Settings';
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      child: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    return Consumer<PreferencesProvider>(
      builder: (context, provider, child) {
        return ListView(
          children: [
            Material(
              child: ListTile(
                title: const Text('Dark Theme'),
                trailing: Switch.adaptive(
                  value: provider.isDarkTheme,
                  onChanged: (value) {
                    provider.enableDarkTheme(value);
                  },
                ),
              ),
            ),
            // Material(
            //   child: ListTile(
            //     title: const Text('Scheduling News'),
            //     trailing: Consumer<SchedulingProvider>(
            //       builder: (context, scheduled, _) {
            //         return Switch.adaptive(
            //           value: provider.isDailyNewsActive,
            //           onChanged: (value) async {
            //             if (Platform.isIOS) {
            //               customDialog(context);
            //             } else {
            //               scheduled.scheduleNews(value);
            //               provider.enableDailyNews(value);
            //             }
            //           },
            //         );
            //       },
            //     ),
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
