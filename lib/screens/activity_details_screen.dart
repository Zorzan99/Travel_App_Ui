import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travel_app_ui/models/activity_model.dart';
import 'package:travel_app_ui/widgets/clipped_container.dart';

class ActivityDetailsScreen extends StatelessWidget {
  const ActivityDetailsScreen({
    Key? key,
    required this.activity,
  }) : super(key: key);

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_ActivityImage(activity: activity), _ActivityInformation(activity: activity)],
    );
  }
}

class _ActivityInformation extends StatelessWidget {
  const _ActivityInformation({Key? key, required this.activity}) : super(key: key);
  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              activity.title,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            RatingBar.builder(
              initialRating: activity.rating,
              minRating: 0,
              direction: Axis.horizontal,
              ignoreGestures: true,
              itemCount: 5,
              itemSize: 20,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (ratting) {},
            ),
            const SizedBox(height: 20),
            Text(
              'About',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              activity.description,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'R\$${activity.price}',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(primary: const Color(0xFF211955), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                  child: Text(
                    'Veja agora',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _ActivityImage extends StatelessWidget {
  const _ActivityImage({
    Key? key,
    required this.activity,
  }) : super(key: key);

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ClippedContainer(
          heigth: 425,
        ),
        Hero(
          tag: '${activity.id}_${activity.title}',
          child: ClippedContainer(imageUrl: activity.imageUrl),
        ),
      ],
    );
  }
}
