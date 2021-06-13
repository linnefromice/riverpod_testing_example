import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

CategoryList createCategoryList(final List<Category> values) {
  final Map<Category, bool> categories  = Map();
  values.forEach((value) {
    categories.putIfAbsent(value, () => false);
  });
  return CategoryList(categories);
}

class Category {
  final String name;
  final Color color;

  Category({
    required this.name,
    required this.color
  });
}

class CategoryList extends StateNotifier<Map<Category, bool>> {
  CategoryList(Map<Category, bool> state) : super(state);

  void toggle(final Category item) {
    final value = state[item];
    if (value is bool) {
      state[item] = !value;
      state = state;
    }
  }
}
