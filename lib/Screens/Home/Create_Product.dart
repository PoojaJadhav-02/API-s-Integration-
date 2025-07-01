/*import 'package:flutter/material.dart';
import 'package:post_api_assignment/Services/ApiService.dart';
import 'package:post_api_assignment/subCategories.dart' as sub_screen;
import '../../Model/SubCatModel.dart';
import '../../subCategories.dart';
import 'Product_Detail_View.dart';

class CreateProduct extends StatefulWidget {
  final String categoryName;
  final String catagoriesId;

  const CreateProduct({
    super.key,
    required this.categoryName,
    required this.catagoriesId,
  });

  @override
  State<CreateProduct> createState() => _CreateProductState();
}*/


// class _CreateProductState extends State<CreateProduct> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//
//   bool _isSubmitting = false;
//   List<SubCategory> _subCategories = [];
//   SubCategory? _selectedSubCategory;
//   bool _isLoadingSubCategories = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchSubCategories();
//   }
//
//   // Future<void> _fetchSubCategories() async {
//   //   setState(() {
//   //     _isLoadingSubCategories = true;
//   //   });
//   //
//   //   try {
//   //     final subCatModel = await ApiService().NewGetAllSubCat(widget.categoryName ?? '');
//   //     if (subCatModel != null && subCatModel.success && subCatModel.data.isNotEmpty) {
//   //       setState(() {
//   //         _subCategories = subCatModel.data;
//   //         _selectedSubCategory = _subCategories.first;
//   //       });
//   //     } else {
//   //       ScaffoldMessenger.of(context).showSnackBar(
//   //         const SnackBar(content: Text('Failed to load subcategories')),
//   //       );
//   //     }
//   //   } catch (e) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text('Error loading subcategories: $e')),
//   //     );
//   //   } finally {
//   //     setState(() {
//   //       _isLoadingSubCategories = false;
//   //     });
//   //   }
//   // }
//
//
//   Future<void> _fetchSubCategories() async {
//     setState(() {
//       _isLoadingSubCategories = true;
//     });
//
//     try {
//       final subCatModel = await ApiService().NewGetAllSubCat(widget.categoryName ?? '');
//       if (subCatModel != null && subCatModel.success && subCatModel.data.isNotEmpty) {
//         setState(() {
//           _subCategories = subCatModel.data;
//           _selectedSubCategory = _subCategories.first;
//         });
//       } else {
//         setState(() {
//           _subCategories = [];
//           _selectedSubCategory = null;
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('No subcategories found for this category')),
//         );
//       }
//     } catch (e) {
//       setState(() {
//         _subCategories = [];
//         _selectedSubCategory = null;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error loading subcategories: $e')),
//       );
//     } finally {
//       setState(() {
//         _isLoadingSubCategories = false;
//       });
//     }
//   }
//
//
//
//   void _submit() {
//     if (!_formKey.currentState!.validate()) return;
//     if (_selectedSubCategory == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please select a subcategory')),
//       );
//       return;
//     }
//
//     setState(() {
//       _isSubmitting = true;
//     });
//
//     // Simulate a network call
//     Future.delayed(const Duration(seconds: 2), () {
//       setState(() {
//         _isSubmitting = false;
//       });
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Post Created Successfully!')),
//       );
//
//       // Clear fields
//       titleController.clear();
//       descriptionController.clear();
//       priceController.clear();
//       setState(() {
//         _selectedSubCategory = _subCategories.isNotEmpty ? _subCategories.first : null;
//       });
//     });
//   }
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   height: 270,
//                   child: ClipRRect(
//                     borderRadius: const BorderRadius.only(
//                       bottomRight: Radius.circular(35),
//                       bottomLeft: Radius.circular(35),
//                     ),
//                     child: Image.asset('assets/homePageImage.jpg'),
//                   ),
//                 ),
//                 Positioned(
//                   left: 5,
//                   bottom: 20,
//                   child: Container(
//                     height: 40,
//                     width: 150,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: Colors.red[400],
//                       border: Border.all(color: Colors.yellow, width: 2),
//                     ),
//                     child: Text(
//                       widget.categoryName ?? 'No Category',
//                       style: const TextStyle(color: Colors.white, fontSize: 16),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               padding: const EdgeInsets.all(15),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.deepPurple.withOpacity(0.08),
//                     blurRadius: 24,
//                     spreadRadius: 4,
//                     offset: const Offset(0, 12),
//                   ),
//                 ],
//               ),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const SizedBox(height: 12),
//                     /// Subcategory Dropdown
//                     Card(
//                       elevation: 4,
//                       shadowColor: Colors.deepPurple.withOpacity(0.2),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         child: _isLoadingSubCategories
//                             ? const Center(child: CircularProgressIndicator())
//                             : DropdownButtonFormField<SubCategory>(
//                           decoration: const InputDecoration(
//                             labelText: 'Subcategory',
//                             border: InputBorder.none,
//                           ),
//                           value: _selectedSubCategory,
//                           items: _subCategories.map((subCategory) {
//                             return DropdownMenuItem<SubCategory>(
//                               value: subCategory,
//                               child: Text(subCategory.name),
//                             );
//                           }).toList(),
//                           onChanged: (value) {
//                             setState(() {
//                               _selectedSubCategory = value;
//                             });
//                           },
//                           validator: (value) {
//                             if (value == null) {
//                               return 'Please select a subcategory';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     /// Product Name
//                     Card(
//                       elevation: 4,
//                       shadowColor: Colors.deepPurple.withOpacity(0.2),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         child: TextFormField(
//                           controller: titleController,
//                           decoration: const InputDecoration(
//                             labelText: 'Product Name',
//                             border: InputBorder.none,
//                           ),
//                           validator: (value) {
//                             if (value == null || value.trim().isEmpty) {
//                               return 'Please enter a product name';
//                             }
//                             if (value.length < 3) {
//                               return 'Product name must be at least 3 characters';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     /// Description
//                     Card(
//                       elevation: 4,
//                       shadowColor: Colors.deepPurple.withOpacity(0.2),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         child: TextFormField(
//                           controller: descriptionController,
//                           maxLines: 3,
//                           decoration: const InputDecoration(
//                             labelText: 'Description',
//                             hintText: 'Write about your product...',
//                             border: InputBorder.none,
//                           ),
//                           validator: (value) {
//                             if (value == null || value.trim().isEmpty) {
//                               return 'Please enter a description';
//                             }
//                             if (value.length < 10) {
//                               return 'Description should be at least 10 characters';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     /// Price
//                     Card(
//                       elevation: 4,
//                       shadowColor: Colors.deepPurple.withOpacity(0.2),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         child: TextFormField(
//                           controller: priceController,
//                           keyboardType: const TextInputType.numberWithOptions(decimal: true),
//                           decoration: const InputDecoration(
//                             labelText: 'Price',
//                             hintText: 'e.g. 499.99',
//                             border: InputBorder.none,
//                           ),
//                           validator: (value) {
//                             if (value == null || value.trim().isEmpty) {
//                               return 'Please enter a price';
//                             }
//                             final price = double.tryParse(value);
//                             if (price == null || price <= 0) {
//                               return 'Enter a valid price';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 28),
//                     /// Submit Button
//                     SizedBox(
//                       width: double.infinity,
//                       height: 50,
//                       child: ElevatedButton(
//                         onPressed: _isSubmitting ? null : _submit,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.deepPurple,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(14),
//                           ),
//                           elevation: 6,
//                           shadowColor: Colors.deepPurpleAccent.withOpacity(0.4),
//                         ),
//                         child: _isSubmitting
//                             ? const CircularProgressIndicator(color: Colors.white)
//                             : const Text(
//                           'Create Post',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


/////////////////////////////////////////// 25-6-2025


/*
class _CreateProductState extends State<CreateProduct> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  bool _isSubmitting = false;
  List<SubCategory> _subCategories = [];
  SubCategory? _selectedSubCategory;
  bool _isLoadingSubCategories = false;

  @override
  void initState() {
    super.initState();
    _fetchSubCategories();
    _fetchProductById();
  }

  Future<void> _fetchSubCategories() async {
    setState(() {
      _isLoadingSubCategories = true;
    });

    try {
      final subCatModel = await ApiService().NewGetAllSubCat(widget.categoryName ?? '');
      if (subCatModel != null && subCatModel.success && subCatModel.data.isNotEmpty) {
        setState(() {
          _subCategories = subCatModel.data;
          _selectedSubCategory = _subCategories.first;
        });
      } else {
        setState(() {
          _subCategories = [];
          _selectedSubCategory = null;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No subcategories found for this category')),
        );
      }
    } catch (e) {
      setState(() {
        _subCategories = [];
        _selectedSubCategory = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading subcategories: $e')),
      );
    } finally {
      setState(() {
        _isLoadingSubCategories = false;
      });
    }
  }

  Future<void> _fetchProductById(String productId) async {
    try {
      final product = await ApiService().getProductById(productId);
      if (product != null) {
        // Populate the fields if data exists
        setState(() {
          titleController.text = product.title;
          descriptionController.text = product.description;
          priceController.text = product.price.toString();
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No product data found for selected subcategory')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching product data: $e')),
      );
    }
  }


  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedSubCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a subcategory')),
      );
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      final response = await ApiService().createProduct(
        title: titleController.text,
        description: descriptionController.text,
        price: double.parse(priceController.text),
        subCategoryId: _selectedSubCategory!.id,
      );

      if (response != null && response.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Post Created Successfully!')),
        );

        // Clear fields
        titleController.clear();
        descriptionController.clear();
        priceController.clear();
        setState(() {
          _selectedSubCategory = _subCategories.isNotEmpty ? _subCategories.first : null;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to create post')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error creating post: $e')),
      );
    } finally {
      setState(() {
        _isSubmitting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 270,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(35),
                      bottomLeft: Radius.circular(35),
                    ),
                    child: Image.asset('assets/homePageImage.jpg'),
                  ),
                ),
                Positioned(
                  left: 5,
                  bottom: 20,
                  child: Container(
                    height: 40,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.red[400],
                      border: Border.all(color: Colors.yellow, width: 2),
                    ),
                    child: Text(
                      widget.categoryName ?? 'No Category',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.08),
                    blurRadius: 24,
                    spreadRadius: 4,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 12),
                    Card(
                      elevation: 4,
                      shadowColor: Colors.deepPurple.withOpacity(0.2),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: _isLoadingSubCategories
                            ? const Center(child: CircularProgressIndicator())
                            : DropdownButtonFormField<SubCategory>(
                          decoration: const InputDecoration(
                            labelText: 'Subcategory',
                            border: InputBorder.none,
                          ),
                          value: _selectedSubCategory,
                          items: _subCategories.map((subCategory) {
                            return DropdownMenuItem<SubCategory>(
                              value: subCategory,
                              child: Text(subCategory.title),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedSubCategory = value;
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Please select a subcategory';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Card(
                      elevation: 4,
                      shadowColor: Colors.deepPurple.withOpacity(0.2),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          controller: titleController,
                          decoration: const InputDecoration(
                            labelText: 'Product Name',
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter a product name';
                            }
                            if (value.length < 3) {
                              return 'Product name must be at least 3 characters';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Card(
                      elevation: 4,
                      shadowColor: Colors.deepPurple.withOpacity(0.2),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          controller: descriptionController,
                          maxLines: 3,
                          decoration: const InputDecoration(
                            labelText: 'Description',
                            hintText: 'Write about your product...',
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter a description';
                            }
                            if (value.length < 10) {
                              return 'Description should be at least 10 characters';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Card(
                      elevation: 4,
                      shadowColor: Colors.deepPurple.withOpacity(0.2),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          controller: priceController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          decoration: const InputDecoration(
                            labelText: 'Price',
                            hintText: 'e.g. 499.99',
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter a price';
                            }
                            final price = double.tryParse(value);
                            if (price == null || price <= 0) {
                              return 'Enter a valid price';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _isSubmitting ? null : _submit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 6,
                          shadowColor: Colors.deepPurpleAccent.withOpacity(0.4),
                        ),
                        child: _isSubmitting
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text(
                          'Create Post',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget buildTextField(String label, TextEditingController controller, String errorMsg,
      {int minLen = 1, bool isNumeric = false, int maxLines = 1}) {
    return Card(
      elevation: 4,
      shadowColor: Colors.deepPurple.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: isNumeric ? const TextInputType.numberWithOptions(decimal: true) : TextInputType.text,
          decoration: InputDecoration(
            labelText: label,
            border: InputBorder.none,
            hintText: label,
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) return errorMsg;
            if (minLen > 1 && value.length < minLen) return '$label must be at least $minLen characters';
            if (isNumeric && (double.tryParse(value) ?? 0) <= 0) return 'Enter a valid number';
            return null;
          },
        ),
      ),
    );
  }
}
*/


///
// class _CreateProductState extends State<CreateProduct> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController providerController = TextEditingController();
//
//   bool _isSubmitting = false;
//   List<SubCategory> _subCategories = [];
//   SubCategory? _selectedSubCategory;
//   bool _isLoadingSubCategories = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchSubCategories();
//    // _fetchProductById(productId);
//   }
//
//   Future<void> _fetchSubCategories() async {
//     setState(() {
//       _isLoadingSubCategories = true;
//     });
//
//     try {
//       final subCatModel = await ApiService().NewGetAllSubCat(widget.categoryName ?? '');
//       if (subCatModel != null && subCatModel.success && subCatModel.data.isNotEmpty) {
//         setState(() {
//           _subCategories = subCatModel.data;
//           _selectedSubCategory = _subCategories.first;
//         });
//         _fetchProductById(_subCategories.first.id); // Fetch product for default selected
//       } else {
//         setState(() {
//           _subCategories = [];
//           _selectedSubCategory = null;
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('No subcategories found for this category')),
//         );
//       }
//     } catch (e) {
//       setState(() {
//         _subCategories = [];
//         _selectedSubCategory = null;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error loading subcategories: $e')),
//       );
//     } finally {
//       setState(() {
//         _isLoadingSubCategories = false;
//       });
//     }
//   }
//
//   Future<void> _fetchProductById(String productId) async {
//     try {
//       final product = await ApiService().getProductById(productId);
//       if (product != null) {
//         setState(() {
//           titleController.text = product.title;
//           descriptionController.text = product.description;
//           priceController.text = product.price.toString();
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('No product data found for selected subcategory')),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error fetching product data: $e')),
//       );
//     }
//   }
//
//
//   Future<void> _submit() async {
//     if (!_formKey.currentState!.validate()) return;
//
//     if (_selectedSubCategory == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please select a subcategory')),
//       );
//       return;
//     }
//
//     setState(() {
//       _isSubmitting = true;
//     });
//
//     final String title = titleController.text.trim();
//     final String description = descriptionController.text.trim();
//     final double? price = double.tryParse(priceController.text.trim());
//
//     if (price == null || price <= 0) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Invalid price value')),
//       );
//       setState(() => _isSubmitting = false);
//       return;
//     }
//
//     final String subCategoryId = _selectedSubCategory!.id;
//
//     print('🔽 Creating product with:');
//     print('Title: $title');
//     print('Description: $description');
//     print('Price: $price');
//     print('SubCategory ID: $subCategoryId');
//
//     try {
//       final response = await ApiService().createProduct(
//         title: title,
//         description: description,
//         price: price,
//         subCategoryId: subCategoryId,
//       );
//
//       if (response != null && response.success) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Post Created Successfully!')),
//         );
//
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ProductDetailView(product: response.data),
//           ),
//         );
//
//         titleController.clear();
//         descriptionController.clear();
//         priceController.clear();
//         providerController.clear();
//         setState(() {
//           _selectedSubCategory = _subCategories.isNotEmpty ? _subCategories.first : null;
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Failed to create post: ${response?.message ?? 'Unknown error'}')),
//         );
//       }
//     } catch (e) {
//       print('🔥 Error while creating product: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error creating post: $e')),
//       );
//     } finally {
//       setState(() {
//         _isSubmitting = false;
//       });
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   height: 270,
//                   child: ClipRRect(
//                     borderRadius: const BorderRadius.only(
//                       bottomRight: Radius.circular(35),
//                       bottomLeft: Radius.circular(35),
//                     ),
//                     child: Image.asset('assets/homePageImage.jpg'),
//                   ),
//                 ),
//                 Positioned(
//                   left: 5,
//                   bottom: 20,
//                   child: Container(
//                     height: 40,
//                     width: 150,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: Colors.red[400],
//                       border: Border.all(color: Colors.yellow, width: 2),
//                     ),
//                     child: Text(
//                       widget.categoryName ?? 'No Category',
//                       style: const TextStyle(color: Colors.white, fontSize: 16),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               padding: const EdgeInsets.all(15),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.deepPurple.withOpacity(0.08),
//                     blurRadius: 24,
//                     spreadRadius: 4,
//                     offset: const Offset(0, 12),
//                   ),
//                 ],
//               ),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const SizedBox(height: 12),
//                     Card(
//                       elevation: 4,
//                       shadowColor: Colors.deepPurple.withOpacity(0.2),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         child: _isLoadingSubCategories
//                             ? const Center(child: CircularProgressIndicator())
//                             : DropdownButtonFormField<SubCategory>(
//                           decoration: const InputDecoration(
//                             labelText: 'Subcategory',
//                             border: InputBorder.none,
//                           ),
//                           value: _selectedSubCategory,
//                           items: _subCategories.map((subCategory) {
//                             return DropdownMenuItem<SubCategory>(
//                               value: subCategory,
//                               child: Text(subCategory.title),
//                             );
//                           }).toList(),
//                           onChanged: (value) {
//                             setState(() {
//                               _selectedSubCategory = value;
//                             });
//                             if (value != null && value.id.isNotEmpty) {
//                               _fetchProductById(value.id); // 👉 fetch data on change
//                             }
//                           },
//                           validator: (value) {
//                             if (value == null) {
//                               return 'Please select a subcategory';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     buildTextField('Product Name', titleController, 'Please enter a product name', minLen: 3),
//                     const SizedBox(height: 16),
//                     buildTextField('Description', descriptionController, 'Please enter a description', minLen: 10, maxLines: 3),
//                     const SizedBox(height: 16),
//                     buildTextField('Price', priceController, 'Please enter a valid price', isNumeric: true),
//                     const SizedBox(height: 28),
//
//                     buildTextField('Business Detail', providerController, 'Please enter a Business information', minLen: 10, maxLines: 3),
//
//                     const SizedBox(height: 28),
//                     SizedBox(
//                       width: double.infinity,
//                       height: 50,
//                       child: ElevatedButton(
//                         onPressed: _isSubmitting ? null : _submit,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.deepPurple,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(14),
//                           ),
//                           elevation: 6,
//                           shadowColor: Colors.deepPurpleAccent.withOpacity(0.4),
//                         ),
//                         child: _isSubmitting
//                             ? const CircularProgressIndicator(color: Colors.white)
//                             : const Text(
//                           'Create Post',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildTextField(String label, TextEditingController controller, String errorMsg,
//       {int minLen = 1, bool isNumeric = false, int maxLines = 1}) {
//     return Card(
//       elevation: 4,
//       shadowColor: Colors.deepPurple.withOpacity(0.2),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: TextFormField(
//           controller: controller,
//           maxLines: maxLines,
//           keyboardType: isNumeric ? const TextInputType.numberWithOptions(decimal: true) : TextInputType.text,
//           decoration: InputDecoration(
//             labelText: label,
//             border: InputBorder.none,
//             hintText: label,
//           ),
//           validator: (value) {
//             if (value == null || value.trim().isEmpty) return errorMsg;
//             if (minLen > 1 && value.length < minLen) return '$label must be at least $minLen characters';
//             if (isNumeric && (double.tryParse(value) ?? 0) <= 0) return 'Enter a valid number';
//             return null;
//           },
//         ),
//       ),
//     );
//   }
//
// }

  /// 29/6/25
// class _CreateProductState extends State<CreateProduct> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController providerController = TextEditingController();
//
//   bool _isSubmitting = false;
//   List<SubCategory> _subCategories = [];
//   List<SubCategory> _selectedSubCategories = [];
//   SubCategory? _selectedSubCategory;
//   bool _isLoadingSubCategories = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchSubCategories();
//   }
//
//   Future<void> _fetchSubCategories() async {
//     setState(() {
//       _isLoadingSubCategories = true;
//     });
//
//     try {
//       final subCatModel = await ApiService().NewGetAllSubCat(widget.categoryName ?? '');
//       if (subCatModel != null && subCatModel.success && subCatModel.data.isNotEmpty) {
//         setState(() {
//           _subCategories = subCatModel.data;
//           _selectedSubCategory = _subCategories.first;
//         });
//         _fetchProductById(_subCategories.first.id);
//       } else {
//         setState(() {
//           _subCategories = [];
//           _selectedSubCategory = null;
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('No subcategories found for this category')),
//         );
//       }
//     } catch (e) {
//       setState(() {
//         _subCategories = [];
//         _selectedSubCategory = null;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error loading subcategories: $e')),
//       );
//     } finally {
//       setState(() {
//         _isLoadingSubCategories = false;
//       });
//     }
//   }
//
//   Future<void> _fetchProductById(String productId) async {
//     try {
//       final product = await ApiService().getProductById(productId);
//       if (product != null) {
//         setState(() {
//           //titleController.text = product.title;
//          // descriptionController.text = product.description;
//          // priceController.text = product.price.toString();
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('No product data found for selected subcategory')),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error fetching product data: $e')),
//       );
//     }
//   }
//
//   void _showSubCategoryDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Select Subcategories'),
//           content: SizedBox(
//             width: double.maxFinite,
//             child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: _subCategories.length,
//               itemBuilder: (context, index) {
//                 final subCat = _subCategories[index];
//                 final isSelected = _selectedSubCategories.any((e) => e.id == subCat.id);
//
//                 return CheckboxListTile(
//                   value: isSelected,
//                   title: Text(subCat.title),
//                   onChanged: (bool? value) {
//                     setState(() {
//                       if (value == true) {
//                         _selectedSubCategories.add(subCat);
//                         _fetchProductById(subCat.id); // optional
//                       } else {
//                         _selectedSubCategories.removeWhere((e) => e.id == subCat.id);
//                       }
//                     });
//                   },
//                   controlAffinity: ListTileControlAffinity.trailing,
//                 );
//               },
//             ),
//           ),
//           actions: [
//             TextButton(
//               child: const Text('Done'),
//               onPressed: () {
//                 providerController.text = _selectedSubCategories.map((e) => e.title).join(', ');
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//
//   void _showBusinessDetailDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Business'),
//           content: SizedBox(
//             width: double.maxFinite,
//             child: Column(
//               children: [
//                  Text('data')
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               child: const Text('Done'),
//               onPressed: () {
//                // providerController.text = _selectedSubCategories.map((e) => e.title).join(', ');
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//
//   Future<void> _submit() async {
//     if (!_formKey.currentState!.validate()) return;
//
//     if (_selectedSubCategory == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please select a subcategory')),
//       );
//       return;
//     }
//
//     setState(() {
//       _isSubmitting = true;
//     });
//
//     final String title = titleController.text.trim();
//     final String description = descriptionController.text.trim();
//     final double? price = double.tryParse(priceController.text.trim());
//
//     if (price == null || price <= 0) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Invalid price value')),
//       );
//       setState(() => _isSubmitting = false);
//       return;
//     }
//
//     final String subCategoryId = _selectedSubCategory!.id;
//
//     try {
//       final response = await ApiService().createProduct(
//         title: title,
//         description: description,
//         price: price,
//         subCategoryId: subCategoryId,
//         categoryId : '', // include this
//       );
//
//       if (response != null && response.success) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Post Created Successfully!')),
//         );
//
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ProductDetailView(product: response.data),
//           ),
//         );
//
//         titleController.clear();
//         descriptionController.clear();
//         priceController.clear();
//         providerController.clear();
//         setState(() {
//           _selectedSubCategory = _subCategories.isNotEmpty ? _subCategories.first : null;
//           _selectedSubCategories.clear();
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Failed to create post: ${response?.message ?? 'Unknown error'}')),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error creating post: $e')),
//       );
//     } finally {
//       setState(() {
//         _isSubmitting = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 SizedBox(
//                   height: 270,
//                   child: ClipRRect(
//                     borderRadius: const BorderRadius.only(
//                       bottomRight: Radius.circular(35),
//                       bottomLeft: Radius.circular(35),
//                     ),
//                     child: Image.asset('assets/homePageImage.jpg'),
//                   ),
//                 ),
//                 Positioned(
//                   left: 5,
//                   bottom: 20,
//                   child: Container(
//                     height: 40,
//                     width: 150,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: Colors.red[400],
//                       border: Border.all(color: Colors.yellow, width: 2),
//                     ),
//                     child: Text(
//                       widget.categoryName ?? 'No Category',
//                       style: const TextStyle(color: Colors.white, fontSize: 16),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               padding: const EdgeInsets.all(15),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.deepPurple.withOpacity(0.08),
//                     blurRadius: 24,
//                     spreadRadius: 4,
//                     offset: const Offset(0, 12),
//                   ),
//                 ],
//               ),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const SizedBox(height: 12),
//                     Card(
//                       elevation: 4,
//                       shadowColor: Colors.deepPurple.withOpacity(0.2),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//                       child: GestureDetector(
//                         onTap: _showSubCategoryDialog,
//                         child: AbsorbPointer(
//                           child: buildTextField(
//                             'subCategory',
//                             providerController,
//                             'Please select at least one subcategory',
//                             minLen: 10,
//                             maxLines: 3,
//                           ),
//                         ),
//                       ),
//                       // Padding(
//                       //   padding: const EdgeInsets.symmetric(horizontal: 16),
//                       //   child: _isLoadingSubCategories
//                       //       ? const Center(child: CircularProgressIndicator())
//                       //       : DropdownButtonFormField<SubCategory>(
//                       //     decoration: const InputDecoration(
//                       //       labelText: 'Subcategory',
//                       //       border: InputBorder.none,
//                       //     ),
//                       //     value: _selectedSubCategory,
//                       //     items: _subCategories.map((subCategory) {
//                       //       return DropdownMenuItem<SubCategory>(
//                       //         value: subCategory,
//                       //         child: Text(subCategory.title),
//                       //       );
//                       //     }).toList(),
//                       //     onChanged: (value) {
//                       //       setState(() {
//                       //         _selectedSubCategory = value;
//                       //       });
//                       //       if (value != null && value.id.isNotEmpty) {
//                       //         _fetchProductById(value.id);
//                       //       }
//                       //     },
//                       //     validator: (value) {
//                       //       if (value == null) {
//                       //         return 'Please select a subcategory';
//                       //       }
//                       //       return null;
//                       //     },
//                       //   ),
//                       // ),
//                     ),
//                     const SizedBox(height: 16),
//                     buildTextField('Product Name', titleController, 'Please enter a product name', minLen: 3),
//                     const SizedBox(height: 16),
//                     buildTextField('Description', descriptionController, 'Please enter a description', minLen: 10, maxLines: 3),
//                     const SizedBox(height: 16),
//                     buildTextField('Price', priceController, 'Please enter a valid price', isNumeric: true),
//                     const SizedBox(height: 28),
//
//                     // 👇 Modified Business Detail (provider) Field
//                     GestureDetector(
//                       onTap: _showBusinessDetailDialog,
//                       child: AbsorbPointer(
//                         child: buildTextField(
//                           'Business Detail',
//                           providerController,
//                           'Please select at least one subcategory',
//                           minLen: 10,
//                           maxLines: 3,
//                         ),
//                       ),
//                     ),
//
//                     const SizedBox(height: 28),
//                     SizedBox(
//                       width: double.infinity,
//                       height: 50,
//                       child: ElevatedButton(
//                         onPressed: _isSubmitting ? null : _submit,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.deepPurple,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(14),
//                           ),
//                           elevation: 6,
//                           shadowColor: Colors.deepPurpleAccent.withOpacity(0.4),
//                         ),
//                         child: _isSubmitting
//                             ? const CircularProgressIndicator(color: Colors.white)
//                             : const Text(
//                           'Create Post',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildTextField(String label, TextEditingController controller, String errorMsg,
//       {int minLen = 1, bool isNumeric = false, int maxLines = 1}) {
//     return Card(
//       elevation: 4,
//       shadowColor: Colors.deepPurple.withOpacity(0.2),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: TextFormField(
//           controller: controller,
//           maxLines: maxLines,
//           keyboardType: isNumeric ? const TextInputType.numberWithOptions(decimal: true) : TextInputType.text,
//           decoration: InputDecoration(
//             labelText: label,
//             border: InputBorder.none,
//             hintText: label,
//           ),
//           validator: (value) {
//             if (value == null || value.trim().isEmpty) return errorMsg;
//             if (minLen > 1 && value.length < minLen) return '$label must be at least $minLen characters';
//             if (isNumeric && (double.tryParse(value) ?? 0) <= 0) return 'Enter a valid number';
//             return null;
//           },
//         ),
//       ),
//     );
//   }
// }


//}




import 'package:flutter/material.dart';
import 'package:post_api_assignment/Model/SubCatModel.dart';
import 'package:post_api_assignment/subCategories.dart' as sub_screen;
import '../../Services/ApiService.dart';
import 'Product_Detail_View.dart';

class CreateProduct extends StatefulWidget {
  final String categoryName;
  final String catagoriesId;

  const CreateProduct({
    super.key,
    required this.categoryName,
    required this.catagoriesId,
  });

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController providerController = TextEditingController();

  bool _isSubmitting = false;
  List<SubCategory> _subCategories = [];
  List<SubCategory> _selectedSubCategories = [];
  SubCategory? _selectedSubCategory;
  bool _isLoadingSubCategories = false;

  @override
  void initState() {
    super.initState();
    _fetchSubCategories();
  }

  Future<void> _fetchSubCategories() async {
    setState(() => _isLoadingSubCategories = true);

    try {
      final subCatModel =
      await ApiService().NewGetAllSubCat(widget.categoryName);
      if (subCatModel != null &&
          subCatModel.success &&
          subCatModel.data.isNotEmpty) {
        setState(() {
          _subCategories = subCatModel.data;
          _selectedSubCategory = _subCategories.first;
        });
        _fetchProductById(_subCategories.first.id);
      } else {
        setState(() {
          _subCategories = [];
          _selectedSubCategory = null;
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('No subcategories found for this category')));
      }
    } catch (e) {
      setState(() {
        _subCategories = [];
        _selectedSubCategory = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading subcategories: $e')),
      );
    } finally {
      setState(() => _isLoadingSubCategories = false);
    }
  }

  Future<void> _fetchProductById(String productId) async {
    try {
      final product = await ApiService().getProductById(productId);
      if (product != null) {
        // Optional: preload values from fetched product
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching product data: $e')),
      );
    }
  }

  void _showSubCategoryDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Subcategories'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _subCategories.length,
              itemBuilder: (context, index) {
                final subCat = _subCategories[index];
                final isSelected = _selectedSubCategories
                    .any((e) => e.id == subCat.id);

                return CheckboxListTile(
                  value: isSelected,
                  title: Text(subCat.title),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
                        _selectedSubCategories.add(subCat);
                      } else {
                        _selectedSubCategories
                            .removeWhere((e) => e.id == subCat.id);
                      }
                    });
                  },
                  controlAffinity: ListTileControlAffinity.trailing,
                );
              },
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Done'),
              onPressed: () {
                providerController.text = _selectedSubCategories
                    .map((e) => e.title)
                    .join(', ');
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showBusinessDetailDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Business'),
          content: const Text('Business details here...'),
          actions: [
            TextButton(
              child: const Text('Done'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedSubCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a subcategory')),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    final title = titleController.text.trim();
    final description = descriptionController.text.trim();
    final double? price = double.tryParse(priceController.text.trim());

    if (price == null || price <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid price value')),
      );
      setState(() => _isSubmitting = false);
      return;
    }

    try {
      final response = await ApiService().createProduct(
        title: title,
        description: description,
        price: price,
        subCategoryId: _selectedSubCategory!.id,
        categoryId: widget.catagoriesId,
      );

      if (response != null && response.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Post Created Successfully!')),
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailView(product: response.data),
          ),
        );

        titleController.clear();
        descriptionController.clear();
        priceController.clear();
        providerController.clear();
        setState(() {
          _selectedSubCategory =
          _subCategories.isNotEmpty ? _subCategories.first : null;
          _selectedSubCategories.clear();
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
              Text('Failed to create post: ${response?.message ?? ''}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error creating post: $e')),
      );
    } finally {
      setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 270,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(35),
                      bottomLeft: Radius.circular(35),
                    ),
                    child: Image.asset('assets/homePageImage.jpg'),
                  ),
                ),
                Positioned(
                  left: 5,
                  bottom: 20,
                  child: GestureDetector(
                    onTap: () {
                      if (_subCategories.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => sub_screen.SubCategoryListScreen(
                              categoryName: widget.categoryName,
                              subCategories: _subCategories,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Subcategories not loaded yet")),
                        );
                      }
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.red[400],
                        border: Border.all(color: Colors.yellow, width: 2),
                      ),
                      child: Text(
                        widget.categoryName,
                        style:
                        const TextStyle(color: Colors.white, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.08),
                    blurRadius: 24,
                    spreadRadius: 4,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    Card(
                      elevation: 4,
                      shadowColor: Colors.deepPurple.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: GestureDetector(
                        onTap: _showSubCategoryDialog,
                        child: AbsorbPointer(
                          child: buildTextField(
                            'SubCategory',
                            providerController,
                            'Please select at least one subcategory',
                            minLen: 1,
                            maxLines: 3,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    buildTextField('Product Name', titleController,
                        'Please enter a product name',
                        minLen: 3),
                    const SizedBox(height: 16),
                    buildTextField('Description', descriptionController,
                        'Please enter a description',
                        minLen: 10,
                        maxLines: 3),
                    const SizedBox(height: 16),
                    buildTextField('Price', priceController,
                        'Please enter a valid price',
                        isNumeric: true),
                    const SizedBox(height: 28),
                    GestureDetector(
                      onTap: _showBusinessDetailDialog,
                      child: AbsorbPointer(
                        child: buildTextField(
                          'Business Detail',
                          providerController,
                          'Please select at least one subcategory',
                          minLen: 1,
                          maxLines: 3,
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _isSubmitting ? null : _submit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 6,
                          shadowColor:
                          Colors.deepPurpleAccent.withOpacity(0.4),
                        ),
                        child: _isSubmitting
                            ? const CircularProgressIndicator(
                            color: Colors.white)
                            : const Text(
                          'Create Post',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
      String label,
      TextEditingController controller,
      String errorMsg, {
        int minLen = 1,
        bool isNumeric = false,
        int maxLines = 1,
      }) {
    return Card(
      elevation: 4,
      shadowColor: Colors.deepPurple.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: isNumeric
              ? const TextInputType.numberWithOptions(decimal: true)
              : TextInputType.text,
          decoration: InputDecoration(
            labelText: label,
            border: InputBorder.none,
            hintText: label,
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) return errorMsg;
            if (minLen > 1 && value.length < minLen) {
              return '$label must be at least $minLen characters';
            }
            if (isNumeric && (double.tryParse(value) ?? 0) <= 0) {
              return 'Enter a valid number';
            }
            return null;
          },
        ),
      ),
    );
  }
}




/////////////////
/*
 Widget subCategoryField(){
    return Container(
      padding: EdgeInsets.all(12),
     decoration: BoxDecoration(
       color: Colors.white,

     ),
     // child: ,
    );
  }
  */

















/*
class _CreateProductState extends State<CreateProduct> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController subCategoryController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  bool _isSubmitting = false;

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSubmitting = true;
    });

    // Simulate a network call
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isSubmitting = false;
      });

      // Show success message or do something else
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Post Created Successfully!')),
      );

      // Optionally clear fields
      titleController.clear();
      descriptionController.clear();
      priceController.clear();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
              Container(
                height: 270,
                //width: 500,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(bottomRight:  Radius.circular(35), bottomLeft: Radius.circular(35) ),
                    child: Image.asset('assets/homePageImage.jpg')
                ) ,
              ),
                Positioned(
                  left: 5,
                  bottom: 20,
                  child: Container(
                    height: 40,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.red[400],
                      border: Border.all(color: Colors.yellow, width: 2),
                    ),
                    child: Text(
                      widget.categoryName ?? 'No Category',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),

                )
             ]
            ),

            Container(
              padding: const EdgeInsets.all(15),
             // margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
               // borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.08),
                    blurRadius: 24,
                    spreadRadius: 4,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    const SizedBox(height: 12),

                    /// Subcategory
                    Card(
                      elevation: 4,
                      shadowColor: Colors.deepPurple.withOpacity(0.2),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          controller: subCategoryController,
                          decoration: const InputDecoration(
                            labelText: 'Subcategory',
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter a subcategory';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    /// Product Name
                    Card(
                      elevation: 4,
                      shadowColor: Colors.deepPurple.withOpacity(0.2),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          controller: titleController,
                          decoration: const InputDecoration(
                            labelText: 'Product Name',
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter a product name';
                            }
                            if (value.length < 3) {
                              return 'Product name must be at least 3 characters';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    /// Description
                    Card(
                      elevation: 4,
                      shadowColor: Colors.deepPurple.withOpacity(0.2),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          controller: descriptionController,
                          maxLines: 3,
                          decoration: const InputDecoration(
                            labelText: 'Description',
                            hintText: 'Write about your product...',
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter a description';
                            }
                            if (value.length < 10) {
                              return 'Description should be at least 10 characters';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    /// Price
                    Card(
                      elevation: 4,
                      shadowColor: Colors.deepPurple.withOpacity(0.2),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          controller: priceController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          decoration: const InputDecoration(
                            labelText: 'Price',
                            hintText: 'e.g. 499.99',
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter a price';
                            }
                            final price = double.tryParse(value);
                            if (price == null || price <= 0) {
                              return 'Enter a valid price';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    /// Submit Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _isSubmitting ? null : _submit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 6,
                          shadowColor: Colors.deepPurpleAccent.withOpacity(0.4),
                        ),
                        child: _isSubmitting
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text(
                          'Create Post',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )



          ],
        ),
      ),
    );
  }
}
*/



// Future<void> _submit() async {
//   if (!_formKey.currentState!.validate()) return;
//   if (_selectedSubCategory == null) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Please select a subcategory')),
//     );
//     return;
//   }
//
//   setState(() {
//     _isSubmitting = true;
//   });
//
//   try {
//     final response = await ApiService().createProduct(
//       title: titleController.text,
//       description: descriptionController.text,
//       price: double.parse(priceController.text),
//       subCategoryId: _selectedSubCategory!.id,
//     );
//
//     if (response != null && response.success) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Post Created Successfully!')),
//       );
//
//
//
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ProductDetailView(
//             title: titleController.text,
//             description: descriptionController.text,
//             price: double.parse(priceController.text),
//             subCategory: _selectedSubCategory!.title,
//           ),
//         ),
//       );
//
//
//       titleController.clear();
//       descriptionController.clear();
//       priceController.clear();
//       setState(() {
//         _selectedSubCategory = _subCategories.isNotEmpty ? _subCategories.first : null;
//       });
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Failed to create post')),
//       );
//     }
//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Error creating post: $e')),
//     );
//   } finally {
//     setState(() {
//       _isSubmitting = false;
//     });
//   }
// }
/////////////////////////// data send
/*
  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedSubCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a subcategory')),
      );
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    final String title = titleController.text.trim();
    final String description = descriptionController.text.trim();
    final double? price = double.tryParse(priceController.text.trim());

    if (price == null || price <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid price value')),
      );
      setState(() => _isSubmitting = false);
      return;
    }

    final String subCategoryId = _selectedSubCategory!.id;

    print('🔽 Creating product with:');
    print('Title: $title');
    print('Description: $description');
    print('Price: $price');
    print('SubCategory ID: $subCategoryId');

    try {
      final response = await ApiService().createProduct(
        title: title,
        description: description,
        price: price,
        subCategoryId: subCategoryId,
      );

      if (response != null && response.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Post Created Successfully!')),
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailView(
              title: title,
              description: description,
              price: price,
              subCategory: _selectedSubCategory!.title,
            ),
          ),
        );

        titleController.clear();
        descriptionController.clear();
        priceController.clear();
        setState(() {
          _selectedSubCategory = _subCategories.isNotEmpty ? _subCategories.first : null;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create post: ${response?.message ?? 'Unknown error'}')),
        );
      }
    } catch (e) {
      print('🔥 Error while creating product: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error creating post: $e')),
      );
    } finally {
      setState(() {
        _isSubmitting = false;
      });
    }
  }
*/