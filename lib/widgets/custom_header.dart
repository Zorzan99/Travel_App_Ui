import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 5),
          Text(
            'Enjoy your holiday in Italy',
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
