import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/settings_provider.dart';
import 'package:todo/ui/home/settings/theme_bottom_sheet.dart';
import 'package:todo/ui/my_theme.dart';

class SettingsTab extends StatefulWidget {
  static const String screenName = "SettingsTab";

  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProviders>(context);

    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: Text(
            'Mode : ',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        InkWell(
          onTap: () {
            showThemeBottomSheet();
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(color: MyTheme.lightPrimary, width: 2)),
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Text(
                settingsProvider.isDarkMode() ? 'Dark' : 'Light',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        )
      ]),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return const ThemeBottomSheet();
        });
  }
}
