import 'package:flutter/material.dart';
import 'package:post_api_assignment/Model/SubCatModel.dart';

class SubCategoryListScreen extends StatelessWidget {
  final String categoryName;
  final List<SubCategory> subCategories;

  const SubCategoryListScreen({
    super.key,
    required this.categoryName,
    required this.subCategories,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subcategories of $categoryName'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: subCategories.isEmpty
          ? const Center(child: Text("No subcategories found"))
          : ListView.separated(
        itemCount: subCategories.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final sub = subCategories[index];
          return ListTile(
            leading: const Icon(Icons.category, color: Colors.deepPurple),
            title: Text(sub.title),
            subtitle: Text("ID: ${sub.id}"),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Selected: ${sub.title}')),
              );
            },
          );
        },
      ),
    );
  }
}
