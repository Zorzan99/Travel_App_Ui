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
  bool isOnborading = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFF5EDDC),
      body: isOnborading
          ? _buildOnboarding(context)
          : Row(
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

  Container _buildOnboarding(context) => Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/background.jpg',
              ),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.45, bottom: MediaQuery.of(context).size.height * 0.1, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Viagens incríveis para Itália',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 65, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const Spacer(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    padding: EdgeInsets.zero,
                    elevation: 0.0,
                  ),
                  onPressed: () {
                    setState(() {
                      isOnborading = false;
                    });
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_circle_right_outlined,
                        size: 50,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Explore agora',
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      );
}
