import 'package:flutter/material.dart';

class LanguaeBottomSheet extends StatelessWidget {
  const LanguaeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.all(14),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'English',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          'Arabic',
          style: Theme.of(context).textTheme.headlineSmall,
        )
      ]),
    );
  }
}
