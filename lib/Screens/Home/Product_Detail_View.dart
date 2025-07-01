// import 'package:flutter/material.dart';
//
// class ProductDetailView extends StatefulWidget {
//   const ProductDetailView({super.key});
//
//   @override
//   State<ProductDetailView> createState() => _ProductDetailViewState();
// }
//
// class _ProductDetailViewState extends State<ProductDetailView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//           child: Center(
//             child: Text('data'),
//           ),
//         ),
//     );
//   }
// }



import 'package:flutter/material.dart';

import '../../Model/CreateAllCatModel.dart';

// class ProductDetailView extends StatelessWidget {
//   final String title;
//   final String description;
//   final double price;
//   final String subCategory;
//
//   const ProductDetailView({
//     Key? key,
//     required this.title,
//     required this.description,
//     required this.price,
//     required this.subCategory,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Product Details'),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Card(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//           elevation: 6,
//           shadowColor: Colors.deepPurple.withOpacity(0.2),
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 detailTile('Product Name', title),
//                 const Divider(),
//                 detailTile('Subcategory', subCategory),
//                 const Divider(),
//                 detailTile('Description', description),
//                 const Divider(),
//                 detailTile('Price', '₹${price.toStringAsFixed(2)}'),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget detailTile(String heading, String value) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           heading,
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
//         ),
//         const SizedBox(height: 6),
//         Text(
//           value,
//           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 12),
//       ],
//     );
//   }
// }



class ProductDetailView extends StatelessWidget {
  final Data product;

  const ProductDetailView({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 6,
                shadowColor: Colors.deepPurple.withOpacity(0.2),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      detailTile('Product Name', product.title),
                      const Divider(),
                      detailTile('Subcategory ID', product.subCategory),
                      const Divider(),
                      detailTile('Category ID', product.category),
                      const Divider(),
                      detailTile('Description', product.description),
                      const Divider(),
                      detailTile('Price', '₹${product.price.toStringAsFixed(2)}'),
                      const Divider(),
                      if (product.subSubCategory != null)
                        detailTile('Sub-Subcategory', product.subSubCategory!),
                      detailTile('Owner ID', product.owner),
                      detailTile('Created At', product.createdAt.toLocal().toString()),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 6,
                shadowColor: Colors.deepPurple.withOpacity(0.2),
                child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 100,
                      padding: const EdgeInsets.all(10.0),

                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Owner'),

                              Text('Name')
                            ],
                          ),
                        ],
                      ),
                    )
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

  Widget detailTile(String heading, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}