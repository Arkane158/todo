import 'package:flutter/material.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.all(14),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Dark',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          'Light',
          style: Theme.of(context).textTheme.headlineSmall,
        )
      ]),
    );
  }
}
