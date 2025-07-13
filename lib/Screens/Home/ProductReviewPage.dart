import 'package:flutter/material.dart';

class ProductReviewPage extends StatelessWidget {
  final String title;
  final String description;
  final int price;
  final List<String> subCategoryNames;
  final List<String> subSubCategoryNames;
  final String imageUrl; // 👈 Add this

  const ProductReviewPage({
    Key? key,
    required this.title,
    required this.description,
    required this.price,
    required this.subCategoryNames,
    required this.subSubCategoryNames,
    required this.imageUrl, // 👈 Add this
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Review'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imageUrl,
                height: 150,
                width: 150,
                errorBuilder: (context, error, stackTrace) =>
                const Text("Invalid image URL"),
              ),
              const SizedBox(height: 8),
              Text("Title: $title", style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Text("Description: $description", style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text("Price: ₹$price", style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),

              Text("SubCategories:", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ...subCategoryNames.map((e) => Text("• $e")),
              const SizedBox(height: 12),

              Text("Sub-SubCategories:", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ...subSubCategoryNames.map((e) => Text("• $e")),
            ],
          ),
        ),
      ),
    );
  }
}
