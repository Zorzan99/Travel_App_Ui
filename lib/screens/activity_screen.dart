import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:travel_app_ui/models/activity_model.dart';
import 'package:travel_app_ui/screens/activity_details_screen.dart';
import 'package:travel_app_ui/widgets/custom_header.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

  static const routeName = '/activities';
  @override
  Widget build(BuildContext context) {
    List<Activity> activities = Activity.activities;

    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          const CustomHeader(title: 'Activities'),
          ActivitiesMasonryGrid(activities: activities, width: width),
        ],
      ),
    );
  }
}

class ActivitiesMasonryGrid extends StatelessWidget {
  const ActivitiesMasonryGrid({
    Key? key,
    required this.activities,
    this.mansonryCardHeights = const [200, 250, 300],
    required this.width,
  }) : super(key: key);

  final List<double> mansonryCardHeights;
  final List<Activity> activities;
  final double width;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10),
      itemCount: 9,
      crossAxisCount: 2,
      mainAxisSpacing: 3,
      crossAxisSpacing: 10,
      itemBuilder: (context, index) {
        Activity activity = activities[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ActivityDetailsScreen(
                  activity: activity,
                ),
              ),
            );
          },
          child: Column(
            children: [
              Hero(
                tag: '${activity.id}_${activity.title}',
                child: Container(
                  height: mansonryCardHeights[index % 3],
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(activity.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                activity.title,
                maxLines: 3,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );
  }
}
