import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_testing_example/providers.dart';

class SelectedCategories extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final categoryList = useProvider(selectedCategories);

    return ListView.builder(
      itemCount: categoryList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProviderScope(
            overrides: [
              selectedCategory.overrideWithValue(categoryList[index])
            ],
            child: CategoryWidget(),
          ),
        );
      },
    );
  }
}

class CategoryWidget extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final category = useProvider(selectedCategory);
    return Text(
      category.name,
      style: TextStyle(color: category.color),
    );
  }
}
