import 'package:flutter/material.dart';
import 'package:task02_category_widget/screens/category_route.dart';
import 'package:task02_category_widget/screens/category_item.dart';

MaterialApp(
initialRoute: '/',
routes: {
  '/': (context) => CategoryRoute,
  '/second': (context) => CategoryItem(),
  },
);