import 'dart:ui';

import 'package:hooks_riverpod/hooks_riverpod.dart';

CategoryList createCategoryList(List values) {
  final Map categories = Map();
  values.forEach((value) {
    categories.putIfAbsent(value, () => false);
  });
  return CategoryList(categories);
}

class Category {
  final String name;
  final Color color;

  Category(this.name, this.color);
}

class CategoryList extends StateNotifier {
  CategoryList(Map state) : super(state);

  void toggle(final Category item) {
    state[item] = !state[item];
    state = state;
  }
}
