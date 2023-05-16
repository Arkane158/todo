import 'package:flutter/material.dart';
import 'package:todo/ui/home/settings/theme_bottom_sheet.dart';
import 'package:todo/ui/my_theme.dart';

import 'language_bottom_sheet.dart';

class SettingsTab extends StatefulWidget {
  static const String screenName = "SettingsTab";

  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(
          'Language : ',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            showLocalBottomSheet();
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(
                  color: MyTheme.lightPrimary,
                  width: 2,
                )),
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Text(
                'English',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
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
                'Light ',
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

  void showLocalBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return const LanguaeBottomSheet();
        });
  }
}
