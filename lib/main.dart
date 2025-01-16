import 'package:flutter/material.dart';
import 'package:traveling_app/screens/category_trips_screen.dart';
import 'screens/filters_screen.dart';
import 'screens/tab_screen.dart';
import 'screens/trip_detail_screen.dart';

import 'screens/categorie_screen.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      supportedLocales: [
        Locale('ar', 'AE'), // Arabic
      ],
      theme: ThemeData(
          primarySwatch: Colors.blue,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.amber),
          fontFamily: 'ElMessiri',
          textTheme: ThemeData.light().textTheme.copyWith(
                headlineMedium: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold,
                ),
              )),
      //  home: CategorieScreen(),
      routes: {
        '/': (context) => TabScreen(),
        CategoryTripsScreen.screenRoute: (ctx) => CategoryTripsScreen(),
        TripDetailScreen.screenRoute: (ctx) => TripDetailScreen(),
        FiltersScreen.ScreenRoute: (ctx) => FiltersScreen(),
      },
    );
  }
}
