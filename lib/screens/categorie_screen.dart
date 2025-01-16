import 'package:flutter/material.dart';
import '../widgets/category_item.dart';

import '../app_data.dart';

class CategorieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      padding: EdgeInsets.all(20),
      maxCrossAxisExtent: 200,
      childAspectRatio: 7 / 8,
      crossAxisSpacing: 10,
      children: Categories_data.map((categoryData) => CategoryItem(
          categoryData.id, categoryData.title, categoryData.imageUrl)).toList(),
    );
  }
}
