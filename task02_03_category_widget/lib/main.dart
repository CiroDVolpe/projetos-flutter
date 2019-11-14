import 'package:flutter/material.dart';
import 'package:task02_category_widget/category.dart';
import 'package:task02_category_widget/category_route.dart';

const _categoryName = 'Cake';
const _categoryColor = Colors.green;
const _categoryIcon = Icons.cake;

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      home: CategoryRoute(),
    );
  }
}
