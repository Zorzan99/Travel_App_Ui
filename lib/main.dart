import 'package:flutter/material.dart';

import 'package:travel_app_ui/screens/activity_screen.dart';
import 'package:travel_app_ui/screens/hotels_screen.dart';
import 'package:travel_app_ui/widgets/side_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/activities',
      routes: {
        ActivitiesScreen.routeName: (context) => const ActivitiesScreen(),
        HotelsScreen.routeName: (context) => const HotelsScreen(),
      },
      builder: (context, child) {
        return TravelApp(
          navigator: (child!.key as GlobalKey<NavigatorState>),
          child: child,
        );
      },
    );
  }
}

class TravelApp extends StatefulWidget {
  const TravelApp({
    Key? key,
    required this.child,
    required this.navigator,
  }) : super(key: key);

  final Widget child;
  final GlobalKey<NavigatorState> navigator;

  @override
  State<TravelApp> createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFF5EDDC),
      body: Row(
        children: [
          SideBar(
            heigth: height,
            width: width,
            navigator: widget.navigator,
          ),
          Expanded(
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
