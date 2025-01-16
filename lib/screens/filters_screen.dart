import 'package:flutter/material.dart';
import '../widgets/app_draw.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});
  static const ScreenRoute = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  bool _isInSummer = false;
  bool _isInWinter = false;
  bool _isForFamily = false;

  Widget buildSwitchListTile(String title, String Subtitle, bool currentValue,
      void Function(bool)? updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(Subtitle),
      value: currentValue,
      onChanged: updateValue,
      inactiveThumbColor: Colors.white,
      inactiveTrackColor: Colors.grey,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'الفلترة',
            style: TextStyle(
                fontSize: 24, fontFamily: 'Amiri', color: Colors.white),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        drawer: AppDraw(),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitchListTile('الرحلات الصيفية',
                      'اضهار الرحلات في فصل الصيف', _isInSummer, (newValue) {
                    setState(() {
                      _isInSummer = newValue;
                    });
                  }),
                  buildSwitchListTile('الرحلات الشتوية',
                      'اضهار الرحلات في فصل الشتاء', _isInWinter, (newValue) {
                    setState(() {
                      _isInWinter = newValue;
                    });
                  }),
                  buildSwitchListTile(
                      'للعائلات',
                      'اضهار الرحلات التي للعائلات فقط',
                      _isForFamily, (newValue) {
                    setState(() {
                      _isForFamily = newValue;
                    });
                  }),
                ],
              ),
            )
          ],
        ));
  }
}
