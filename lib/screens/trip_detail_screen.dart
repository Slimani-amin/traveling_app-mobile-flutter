import 'package:flutter/material.dart';

import '../app_data.dart';

Widget buildSectionTitle(String TitleText) {
  return Container(
    alignment: Alignment.topRight,
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    child: Text(
      TitleText,
      style: TextStyle(
        fontSize: 20,
        fontFamily: 'ElMessiri',
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    ),
  );
}

Widget buildListViewContainer(Widget Child) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10)),
    height: 200,
    margin: EdgeInsets.symmetric(horizontal: 15),
    child: Child,
  );
}

class TripDetailScreen extends StatelessWidget {
  static const screenRoute = '/trip-detail';
  @override
  Widget build(BuildContext context) {
    final TripId = ModalRoute.of(context)!.settings.arguments as String;
    final selectTrip = Trips_data.firstWhere((trip) => trip.id == TripId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectTrip.title,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontFamily: 'Amiri')),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildSectionTitle('الأنشطة'),
            buildListViewContainer(
              ListView.builder(
                itemCount: selectTrip.activities.length,
                itemBuilder: (ctx, index) => Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Text(selectTrip.activities[index]),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildSectionTitle('البرنامج اليومي'),
            buildListViewContainer(ListView.builder(
              itemCount: selectTrip.program.length,
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('يوم ${index + 1}'),
                    ),
                    title: Text(selectTrip.program[index]),
                  ),
                  Divider(),
                ],
              ),
            )),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
