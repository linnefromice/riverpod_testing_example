import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_testing_example/models.dart';

final categoryListProvider = StateNotifierProvider((_) => createCategoryList([
  Category(name: "Apple", color: Colors.red.shade700),
  Category(name: "Orange", color: Colors.orange.shade700),
  Category(name: "Banana", color: Colors.yellow.shade700),
]));

final selectedCategories = Provider((ref) => ref
  .watch(categoryListProvider)
  .entries
  .where((category) => category.value)
  .map((e) => e.key)
  .toList()
);

final allCategories = Provider((ref) => ref.watch(categoryListProvider).keys.toList());

final selectedCategory = ScopedProvider(null);
