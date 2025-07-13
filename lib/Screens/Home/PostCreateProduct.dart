// import 'package:flutter/material.dart';
// import 'package:post_api_assignment/Services/ApiService.dart';
//
// class PostCreateProduct extends StatefulWidget {
//   final String categoryName;
//   final String catagoriesId;
//
//   const PostCreateProduct({
//     super.key,
//     required this.categoryName,
//     required this.catagoriesId
//   });
//
//   @override
//   State<PostCreateProduct> createState() => _PostCreateProductState();
// }
//
// class _PostCreateProductState extends State<PostCreateProduct> {
//
//   TextEditingController titleController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   TextEditingController priceController = TextEditingController();
//
//   bool isLoading = false;
//   List<Map<String, dynamic>> subCategories = [];
//   List<Map<String, dynamic>> subSubCategories = [];
//
//   String? selectedSubCategoryId;
//   String? selectedSubSubCategoryId;
//
//   @override
//   void initState() {
//     super.initState();
//     loadSubCategories(widget.catagoriesId);
//   }
//
//
//   Future<dynamic> handleAddProduct() async {
//       final String title = titleController.text.trim();
//       final String description = descriptionController.text.trim();
//       final String priceText = priceController.text.trim();
//
//       if (title.isEmpty || description.isEmpty || priceText.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Please fill all fields")),
//         );
//         return;
//       }
//
//       if (selectedSubCategoryId == null || selectedSubSubCategoryId == null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Please select both subcategory and sub-subcategory")),
//         );
//         return;
//       }
//
//
//       int? price = int.tryParse(priceText);
//       if (price == null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Enter a valid price")),
//         );
//         return;
//       }
//
//       setState(() {
//         isLoading = true;
//       });
//
//       await ApiService().createProductData(
//         title: title,
//         description: description,
//         price: price,
//         categoryId: widget.catagoriesId,
//         subCategoryId: selectedSubCategoryId ?? "",
//         subSubCategoryId: selectedSubSubCategoryId ?? "",
//       );
//
//       setState(() {
//         isLoading = false;
//       });
//     }
//
//   void loadSubCategories(String categoryId) async {
//     final data = await ApiService().fetchSubCategories(categoryId);
//     setState(() {
//       subCategories = data;
//     });
//   }
//
//   void loadSubSubCategories(String subCategoryId) async {
//     final data = await ApiService().fetchSubSubCategories(subCategoryId);
//     setState(() {
//       subSubCategories = data;
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//        // title: const Text('Create Post', style: TextStyle(fontSize: 18),),
//        title: Text(widget.categoryName),
//       ),
//         body:  SafeArea(
//           child: SingleChildScrollView(
//              child: Padding(
//                padding: const EdgeInsets.all(20.0),
//                child: Column(
//                  spacing: 20,
//                  children: [
//                    TextFormField(
//                      controller: titleController,
//                      decoration: InputDecoration(
//                        hintText: 'Enter Product Name',
//                        fillColor: Colors.white,
//                        enabledBorder: OutlineInputBorder(
//                          borderSide: BorderSide(width: 1, color: Colors.purpleAccent.withOpacity(0.4)),
//                          borderRadius: BorderRadius.circular(10)
//                        ),
//                        focusedBorder: OutlineInputBorder(
//                            borderSide: BorderSide(width: 1, color: Colors.blue.withOpacity(0.4)),
//                            borderRadius: BorderRadius.circular(10)
//                        )
//                      ),
//                    ),
//
//                    TextFormField(
//                      controller: descriptionController,
//                      decoration: InputDecoration(
//                          hintText: 'Enter Description',
//                          fillColor: Colors.white,
//                          enabledBorder: OutlineInputBorder(
//                              borderSide: BorderSide(width: 1, color: Colors.purpleAccent.withOpacity(0.4)),
//                              borderRadius: BorderRadius.circular(10)
//                          ),
//                          focusedBorder: OutlineInputBorder(
//                              borderSide: BorderSide(width: 1, color: Colors.blue.withOpacity(0.4)),
//                              borderRadius: BorderRadius.circular(10)
//                          )
//                      ),
//                    ),
//
//                    TextFormField(
//                      controller: priceController,
//                      decoration: InputDecoration(
//                          hintText: 'Enter Price',
//                          fillColor: Colors.white,
//                          enabledBorder: OutlineInputBorder(
//                              borderSide: BorderSide(width: 1, color: Colors.purpleAccent.withOpacity(0.4)),
//                              borderRadius: BorderRadius.circular(10)
//                          ),
//                          focusedBorder: OutlineInputBorder(
//                              borderSide: BorderSide(width: 1, color: Colors.blue.withOpacity(0.4)),
//                              borderRadius: BorderRadius.circular(10)
//                          )
//                      ),
//                    ),
//
//                    const SizedBox(height: 15),
//
//                    /// SubCategory Dropdown
//                    /// SubCategory Dropdown
//                    DropdownButtonFormField<String>(
//                      value: selectedSubCategoryId,
//                      hint: const Text("Select SubCategory"),
//                      decoration: InputDecoration(
//                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                      ),
//                      items: subCategories.map((sub) {
//                        return DropdownMenuItem<String>(
//                          value: sub['_id'] as String,
//                          child: Text(sub['name'] as String),
//                        );
//                      }).toList(),
//                      onChanged: (value) {
//                        setState(() {
//                          selectedSubCategoryId = value;
//                          selectedSubSubCategoryId = null;
//                          subSubCategories = [];
//                        });
//                        if (value != null) loadSubSubCategories(value);
//                      },
//                    ),
//
//                    const SizedBox(height: 15),
//
//                    /// Sub-SubCategory Dropdown
//                    DropdownButtonFormField<String>(
//                      value: selectedSubSubCategoryId,
//                      hint: const Text("Select Sub-SubCategory"),
//                      decoration: InputDecoration(
//                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                      ),
//                      items: subSubCategories.map((subSub) {
//                        return DropdownMenuItem<String>(
//                          value: subSub['_id'] as String,
//                          child: Text(subSub['name'] as String),
//                        );
//                      }).toList(),
//                      onChanged: (value) {
//                        setState(() {
//                          selectedSubSubCategoryId = value;
//                        });
//                      },
//                    ),
//
//                    const SizedBox(height: 25),
//
//
//                    GestureDetector(
//                      onTap: isLoading ? null : handleAddProduct,
//                      child: Container(
//                        height: 40,
//                        width: 200,
//                        alignment: Alignment.center,
//                        // decoration: BoxDecoration(
//                        //   color: Colors.purple.withOpacity(0.6),
//                        //   borderRadius: BorderRadius.circular(15),
//                        //   border: Border.all(width: 1, color: Colors.white)
//                        // ),
//                        // child: const Text('Add Product', style: TextStyle(color: Colors.white, fontSize: 15), textAlign: TextAlign.center,),
//
//                        decoration: BoxDecoration(
//                          color: isLoading
//                              ? Colors.grey
//                              : Colors.purple.withOpacity(0.6),
//                          borderRadius: BorderRadius.circular(15),
//                          border: Border.all(width: 1, color: Colors.white),
//                        ),
//                        child: isLoading
//                            ? const CircularProgressIndicator(color: Colors.white)
//                            : const Text(
//                          'Add Product',
//                          style: TextStyle(color: Colors.white, fontSize: 15),
//                          textAlign: TextAlign.center,
//                        ),
//                      ),
//                    )
//
//                  ],
//                ),
//              ),
//           ),
//         ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:post_api_assignment/Services/ApiService.dart';

import 'ProductReviewPage.dart';


class PostCreateProduct extends StatefulWidget {
  final String categoryName;
  final String catagoriesId;

  const PostCreateProduct({
    super.key,
    required this.categoryName,
    required this.catagoriesId,
  });

  @override
  State<PostCreateProduct> createState() => _PostCreateProductState();
}

/*
class _PostCreateProductState extends State<PostCreateProduct> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  bool isLoading = false;
  List<Map<String, dynamic>> subCategories = [];
  List<Map<String, dynamic>> subSubCategories = [];

  String? selectedSubCategoryId;
  String? selectedSubSubCategoryId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.catagoriesId.isNotEmpty) {
        loadSubCategories(widget.catagoriesId);
      } else {
        debugPrint("❌ ERROR: categoryId is empty in initState");
      }
    });
  }

  Future<void> handleAddProduct() async {
    final String title = titleController.text.trim();
    final String description = descriptionController.text.trim();
    final String priceText = priceController.text.trim();

    if (title.isEmpty || description.isEmpty || priceText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    int? price = int.tryParse(priceText);
    if (price == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter a valid price")),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    await ApiService().createProductData(
      title: title,
      description: description,
      price: price,
      categoryId: widget.catagoriesId,
      subCategoryId: selectedSubCategoryId ?? "",
      subSubCategoryId: selectedSubSubCategoryId ?? "",
    );

    setState(() {
      isLoading = false;
    });
  }

  void loadSubCategories(String categoryId) async {
    final data = await ApiService().fetchSubCategories(categoryId);
    setState(() {
      subCategories = data;
    });
  }

  void loadSubSubCategories(String subCategoryId) async {
    final data = await ApiService().fetchSubSubCategories(subCategoryId);
    setState(() {
      subSubCategories = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: 'Enter Product Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Enter Description',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: priceController,
                decoration: const InputDecoration(
                  hintText: 'Enter Price',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              DropdownButtonFormField<String>(
                value: selectedSubCategoryId,
                hint: const Text("Select SubCategory"),
                decoration: const InputDecoration(border: OutlineInputBorder()),
                items: subCategories.map((sub) {
                  return DropdownMenuItem<String>(
                    value: sub['_id'],
                    child: Text(sub['name']),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedSubCategoryId = value;
                    selectedSubSubCategoryId = null;
                    subSubCategories = [];
                  });
                  if (value != null) loadSubSubCategories(value);
                },
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: selectedSubSubCategoryId,
                hint: const Text("Select Sub-SubCategory"),
                decoration: const InputDecoration(border: OutlineInputBorder()),
                items: subSubCategories.map((subSub) {
                  return DropdownMenuItem<String>(
                    value: subSub['_id'],
                    child: Text(subSub['name']),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedSubSubCategoryId = value;
                  });
                },
              ),
              const SizedBox(height: 25),
              GestureDetector(
                onTap: isLoading ? null : handleAddProduct,
                child: Container(
                  height: 40,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:
                    isLoading ? Colors.grey : Colors.purple.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                    'Add Product',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/


/// dropdown multi select
// class _PostCreateProductState extends State<PostCreateProduct> {
//   TextEditingController titleController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   TextEditingController priceController = TextEditingController();
//
//   bool isLoading = false;
//   List<Map<String, dynamic>> subCategories = [];
//   List<Map<String, dynamic>> subSubCategories = [];
//   // State variables:
//   Map<String, bool> selectedSubCategoryMap = {}; // SubCategoryId -> isSelected
//   Map<String, List<Map<String, dynamic>>> subSubCategoriesMap = {}; // SubCategoryId -> SubSubCategories
//   Map<String, Set<String>> selectedSubSubCategoryMap = {}; // SubCategoryId -> Set<SubSubCategoryId>
//
//
//   String? selectedSubCategoryId;
//   List<String> selectedSubSubCategoryIds = [];
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (widget.catagoriesId.isNotEmpty) {
//         loadSubCategories(widget.catagoriesId);
//       } else {
//         debugPrint("❌ ERROR: categoryId is empty in initState");
//       }
//     });
//   }
//
//   Future<void> handleAddProduct() async {
//     final String title = titleController.text.trim();
//     final String description = descriptionController.text.trim();
//     final String priceText = priceController.text.trim();
//
//     if (title.isEmpty || description.isEmpty || priceText.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please fill all fields")),
//       );
//       return;
//     }
//
//     int? price = int.tryParse(priceText);
//     if (price == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Enter a valid price")),
//       );
//       return;
//     }
//
//     setState(() {
//       isLoading = true;
//     });
//
//     final selectedSubCategoryIds = selectedSubCategoryMap.entries
//         .where((entry) => entry.value)
//         .map((entry) => entry.key)
//         .toList();
//
//     final selectedSubSubCategoryIds = selectedSubSubCategoryMap.values
//         .expand((set) => set)
//         .toList();
//
//
//     await ApiService().createProductData(
//       title: title,
//       description: description,
//       price: price,
//       categoryId: widget.catagoriesId,
//       subCategoryId: selectedSubCategoryId ?? "",
//      // subSubCategoryId: selectedSubSubCategoryIds, // Assuming API supports list
//      // subSubCategoryId: selectedSubSubCategoryIds.join(','), // converts List<String> to comma-separated String
//       subSubCategoryId: selectedSubSubCategoryIds, // <== keep as List<String>
//
//
//     );
//
//     setState(() {
//       isLoading = false;
//     });
//   }
//
//   void loadSubCategories(String categoryId) async {
//     final data = await ApiService().fetchSubCategories(categoryId);
//     setState(() {
//       subCategories = data;
//       for (var sub in data) {
//         selectedSubCategoryMap[sub['_id']] = false;
//       }
//     });
//   }
//
//   // void loadSubCategories(String categoryId) async {
//   //   final data = await ApiService().fetchSubCategories(categoryId);
//   //   setState(() {
//   //     subCategories = data;
//   //   });
//   // }
//
//   void loadSubSubCategories(String subCategoryId) async {
//     final data = await ApiService().fetchSubSubCategories(subCategoryId);
//     setState(() {
//       subSubCategories = data;
//       selectedSubSubCategoryIds.clear(); // reset on change
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.categoryName),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: titleController,
//                 decoration: const InputDecoration(
//                   hintText: 'Enter Product Name',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 controller: descriptionController,
//                 decoration: const InputDecoration(
//                   hintText: 'Enter Description',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 controller: priceController,
//                 decoration: const InputDecoration(
//                   hintText: 'Enter Price',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 15),
//               DropdownButtonFormField<String>(
//                 value: selectedSubCategoryId,
//                 hint: const Text("Select SubCategory"),
//                 decoration: const InputDecoration(border: OutlineInputBorder()),
//                 items: subCategories.map((sub) {
//                   return DropdownMenuItem<String>(
//                     value: sub['_id'],
//                     child: Text(sub['name']),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     selectedSubCategoryId = value;
//                     selectedSubSubCategoryIds.clear();
//                     subSubCategories = [];
//                   });
//                   if (value != null) loadSubSubCategories(value);
//                 },
//               ),
//               const SizedBox(height: 10),
//               if (subSubCategories.isNotEmpty) ...[
//
//                 // const Align(
//                 //   alignment: Alignment.centerLeft,
//                 //   child: Text(
//                 //     "Select Sub-SubCategories",
//                 //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                 //   ),
//                 // ),
//                 // const SizedBox(height: 8),
//                 // ListView.builder(
//                 //   shrinkWrap: true,
//                 //   physics: const NeverScrollableScrollPhysics(),
//                 //   itemCount: subSubCategories.length,
//                 //   itemBuilder: (context, index) {
//                 //     final subSub = subSubCategories[index];
//                 //     final id = subSub['_id'];
//                 //     final name = subSub['name'];
//                 //     final isSelected = selectedSubSubCategoryIds.contains(id);
//                 //
//                 //     return Card(
//                 //       child: ListTile(
//                 //         title: Text(name),
//                 //         leading: Checkbox(
//                 //           value: isSelected,
//                 //           onChanged: (value) {
//                 //             setState(() {
//                 //               if (value == true) {
//                 //                 selectedSubSubCategoryIds.add(id);
//                 //               } else {
//                 //                 selectedSubSubCategoryIds.remove(id);
//                 //               }
//                 //             });
//                 //           },
//                 //         ),
//                 //         trailing: IconButton(
//                 //           icon: const Icon(Icons.add_circle_outline, color: Colors.purple),
//                 //           onPressed: () {
//                 //             ScaffoldMessenger.of(context).showSnackBar(
//                 //               SnackBar(content: Text('Added "$name"')),
//                 //             );
//                 //           },
//                 //         ),
//                 //       ),
//                 //     );
//                 //   },
//                 // ),
//
//
//                 const Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     "Select SubCategories",
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                   ),
//                 ),
//                 ListView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: subCategories.length,
//                   itemBuilder: (context, index) {
//                     final sub = subCategories[index];
//                     final subCategoryId = sub['_id'];
//                     final subCategoryName = sub['name'];
//                     final isSelected = selectedSubCategoryMap[subCategoryId] ?? false;
//
//                     return Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Card(
//                           child: CheckboxListTile(
//                             value: isSelected,
//                             title: Text(subCategoryName),
//                             onChanged: (value) async {
//                               setState(() {
//                                 selectedSubCategoryMap[subCategoryId] = value ?? false;
//                               });
//                               if (value == true && !subSubCategoriesMap.containsKey(subCategoryId)) {
//                                 final subSubList = await ApiService().fetchSubSubCategories(subCategoryId);
//                                 setState(() {
//                                   subSubCategoriesMap[subCategoryId] = subSubList;
//                                   selectedSubSubCategoryMap[subCategoryId] = {};
//                                 });
//                               }
//                             },
//                           ),
//                         ),
//                         if (isSelected && subSubCategoriesMap.containsKey(subCategoryId))
//                           ...subSubCategoriesMap[subCategoryId]!.map((subSub) {
//                             final subSubId = subSub['_id'];
//                             final subSubName = subSub['name'];
//                             final selectedSet = selectedSubSubCategoryMap[subCategoryId] ?? {};
//                             final isSubSubSelected = selectedSet.contains(subSubId);
//
//                             return Padding(
//                               padding: const EdgeInsets.only(left: 20.0),
//                               child: CheckboxListTile(
//                                 value: isSubSubSelected,
//                                 title: Text(subSubName),
//                                 onChanged: (value) {
//                                   setState(() {
//                                     if (value == true) {
//                                       selectedSet.add(subSubId);
//                                     } else {
//                                       selectedSet.remove(subSubId);
//                                     }
//                                     selectedSubSubCategoryMap[subCategoryId] = selectedSet;
//                                   });
//                                 },
//                               ),
//                             );
//                           }).toList(),
//                       ],
//                     );
//                   },
//                 ),
//
//
//               ],
//               const SizedBox(height: 25),
//               GestureDetector(
//                 onTap: isLoading ? null : handleAddProduct,
//                 child: Container(
//                   height: 40,
//                   width: 200,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     color: isLoading ? Colors.grey : Colors.purple.withOpacity(0.6),
//                     borderRadius: BorderRadius.circular(15),
//                     border: Border.all(width: 1, color: Colors.white),
//                   ),
//                   child: isLoading
//                       ? const CircularProgressIndicator(color: Colors.white)
//                       : const Text(
//                     'Add Product',
//                     style: TextStyle(color: Colors.white, fontSize: 15),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


class _PostCreateProductState extends State<PostCreateProduct> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  bool isLoading = false;
  bool showSubCategorySection = false;
  bool showSelectedSummary = false;

  List<Map<String, dynamic>> subCategories = [];

  Map<String, bool> selectedSubCategoryMap = {}; // SubCategoryId -> isSelected
  Map<String, List<Map<String, dynamic>>> subSubCategoriesMap = {}; // SubCategoryId -> SubSubCategories
  Map<String, Set<String>> selectedSubSubCategoryMap = {}; // SubCategoryId -> Set<SubSubCategoryId>

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.catagoriesId.isNotEmpty) {
        loadSubCategories(widget.catagoriesId);
      } else {
        debugPrint("❌ ERROR: categoryId is empty in initState");
      }
    });
  }

  Future<void> handleAddProduct() async {
    final String title = titleController.text.trim();
    final String description = descriptionController.text.trim();
    final String priceText = priceController.text.trim();

    if (title.isEmpty || description.isEmpty || priceText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    int? price = int.tryParse(priceText);
    if (price == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter a valid price")),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    // Extract selected subCategory and subSubCategory IDs
    final selectedSubCategoryIds = selectedSubCategoryMap.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    final selectedSubSubCategoryIds = selectedSubSubCategoryMap.values
        .expand((set) => set)
        .toList();

    await ApiService().createProductData(
      title: title,
      description: description,
      price: price,
      categoryId: widget.catagoriesId,
      subCategoryId: "", // optional or refactor API to accept list
      subSubCategoryId: selectedSubSubCategoryIds,
      imageUrl: imageUrlController.text, // 👈 From TextFormField
    );

    final selectedSubCategoryNames = subCategories
        .where((sub) => selectedSubCategoryMap[sub['_id']] == true)
        .map((sub) => sub['name'] as String)
        .toList();

    final selectedSubSubCategoryNames = selectedSubSubCategoryMap.entries
        .expand((entry) {
      final subCategoryId = entry.key;
      final selectedIds = entry.value;
      return subSubCategoriesMap[subCategoryId]!
          .where((subSub) => selectedIds.contains(subSub['_id']))
          .map((subSub) => subSub['name'] as String);
    }).toList();


    setState(() {
      isLoading = false;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProductReviewPage(
          title: title,
          description: description,
          price: price,
          subCategoryNames: selectedSubCategoryNames,
          subSubCategoryNames: selectedSubSubCategoryNames,
          imageUrl: imageUrlController.text, // 👈 Send it here
        ),
      ),
    );
  }

  void loadSubCategories(String categoryId) async {
    final data = await ApiService().fetchSubCategories(categoryId);
    setState(() {
      subCategories = data;
      for (var sub in data) {
        selectedSubCategoryMap[sub['_id']] = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: 'Enter Product Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Enter Description',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              // TextFormField(
              //   controller: imageUrlController,
              //   decoration: const InputDecoration(
              //     hintText: 'Add Image Url',
              //     border: OutlineInputBorder(),
              //   ),
              // ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: imageUrlController,
                    decoration: const InputDecoration(
                      hintText: 'Add Image Url',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (_) {
                      setState(() {}); // 👈 Refresh UI when URL changes
                    },
                  ),
                  const SizedBox(height: 10),

                  // 👇 Image Preview Section
                  if (imageUrlController.text.isNotEmpty)
                    Image.network(
                      imageUrlController.text,
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                      const Text("❌ Invalid Image URL"),
                    ),
                ],
              ),

              const SizedBox(height: 10),
              TextFormField(
                controller: priceController,
                decoration: const InputDecoration(
                  hintText: 'Enter Price',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.all(6.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      showSubCategorySection = !showSubCategorySection;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.black),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Select SubCategories",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          showSubCategorySection ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),

              if (showSubCategorySection) ...[
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: subCategories.length,
                  itemBuilder: (context, index) {
                    final sub = subCategories[index];
                    final subCategoryId = sub['_id'];
                    final subCategoryName = sub['name'];
                    final isSelected = selectedSubCategoryMap[subCategoryId] ?? false;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          child: CheckboxListTile(
                            value: isSelected,
                            title: Text(subCategoryName),
                            onChanged: (value) async {
                              setState(() {
                                selectedSubCategoryMap[subCategoryId] = value ?? false;
                              });
                              if (value == true && !subSubCategoriesMap.containsKey(subCategoryId)) {
                                final subSubList = await ApiService().fetchSubSubCategories(subCategoryId);
                                setState(() {
                                  subSubCategoriesMap[subCategoryId] = subSubList;
                                  selectedSubSubCategoryMap[subCategoryId] = {};
                                });
                              }
                            },
                          ),
                        ),
                        if (isSelected && subSubCategoriesMap.containsKey(subCategoryId))
                          ...subSubCategoriesMap[subCategoryId]!.map((subSub) {
                            final subSubId = subSub['_id'];
                            final subSubName = subSub['name'];
                            final selectedSet = selectedSubSubCategoryMap[subCategoryId] ?? {};
                            final isSubSubSelected = selectedSet.contains(subSubId);

                            return Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: CheckboxListTile(
                                value: isSubSubSelected,
                                title: Text(subSubName),
                                onChanged: (value) {
                                  setState(() {
                                    if (value == true) {
                                      selectedSet.add(subSubId);
                                    } else {
                                      selectedSet.remove(subSubId);
                                    }
                                    selectedSubSubCategoryMap[subCategoryId] = selectedSet;
                                  });
                                },
                              ),
                            );
                          }).toList(),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 10),

                if (selectedSubCategoryMap.containsValue(true))
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showSelectedSummary = true;
                          showSubCategorySection = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple.shade300,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      ),
                      child: const Text("Done", style: TextStyle(color: Colors.white)),
                    ),
                  ),

                const SizedBox(height: 20),
              ],

              if (showSelectedSummary)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Selected Items:",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),

                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [

                        // SubCategory Chips
                        ...selectedSubCategoryMap.entries
                            .where((e) => e.value)
                            .map((entry) {
                          final subCategoryId = entry.key;
                          final subCategoryName = subCategories.firstWhere((sub) => sub['_id'] == subCategoryId)['name'];

                          return Container(
                            key: ValueKey('sub_$subCategoryId'),
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(subCategoryName),
                                const SizedBox(width: 6),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedSubCategoryMap[subCategoryId] = false;
                                      selectedSubSubCategoryMap.remove(subCategoryId);
                                      subSubCategoriesMap.remove(subCategoryId);
                                      if (selectedSubCategoryMap.values.every((v) => !v)) {
                                        showSelectedSummary = false;
                                      }
                                    });
                                  },
                                  child: const Icon(Icons.close, size: 16, color: Colors.red),
                                ),
                              ],
                            ),
                          );
                        }),

                        // SubSubCategory Chips
                        ...selectedSubSubCategoryMap.entries.expand((entry) {
                          final subCategoryId = entry.key;
                          final selectedIds = entry.value;
                          final subSubList = subSubCategoriesMap[subCategoryId] ?? [];

                          return subSubList
                              .where((subSub) => selectedIds.contains(subSub['_id']))
                              .map((subSub) {
                            final subSubId = subSub['_id'];
                            final subSubName = subSub['name'];

                            return Container(
                              key: ValueKey('subsub_$subSubId'),
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(subSubName),
                                  const SizedBox(width: 6),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedSubSubCategoryMap[subCategoryId]?.remove(subSubId);
                                        if (selectedSubSubCategoryMap[subCategoryId]?.isEmpty ?? true) {
                                          selectedSubSubCategoryMap.remove(subCategoryId);
                                        }

                                        // Auto-hide if nothing left
                                        final anySelected = selectedSubCategoryMap.containsValue(true) ||
                                            selectedSubSubCategoryMap.values.any((s) => s.isNotEmpty);
                                        if (!anySelected) {
                                          showSelectedSummary = false;
                                        }
                                      });
                                    },
                                    child: const Icon(Icons.close, size: 16, color: Colors.red),
                                  ),
                                ],
                              ),
                            );
                          });
                        }),
                      ],
                    ),
                  ],
                ),


              const SizedBox(height: 25),

              GestureDetector(
                onTap: isLoading ? null : handleAddProduct,
                child: Container(
                  height: 40,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isLoading ? Colors.grey : Colors.purple.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                    'Add Product',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






























// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: GestureDetector(
//     onTap: () {
//       setState(() {
//         showSubCategorySection = !showSubCategorySection;
//       });
//     },
//     child: Container(
//     //  height: 40,
//       //width: 200,
//       padding: EdgeInsets.all(10),
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//        // color: isLoading ? Colors.grey : Colors.purple.withOpacity(0.6),
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(width: 1, color: Colors.black),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           const Text(
//             "Select SubCategories",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(width: 8),
//           Icon(
//             showSubCategorySection ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
//             size: 20,
//           ),
//         ],
//       ),
//     ),
//   ),
// ),
//
// const SizedBox(height: 8),
//
// if (showSubCategorySection)
//   ListView.builder(
//     shrinkWrap: true,
//     physics: const NeverScrollableScrollPhysics(),
//     itemCount: subCategories.length,
//     itemBuilder: (context, index) {
//       final sub = subCategories[index];
//       final subCategoryId = sub['_id'];
//       final subCategoryName = sub['name'];
//       final isSelected = selectedSubCategoryMap[subCategoryId] ?? false;
//
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Card(
//             child: CheckboxListTile(
//               value: isSelected,
//               title: Text(subCategoryName),
//               onChanged: (value) async {
//                 setState(() {
//                   selectedSubCategoryMap[subCategoryId] = value ?? false;
//                 });
//                 if (value == true && !subSubCategoriesMap.containsKey(subCategoryId)) {
//                   final subSubList = await ApiService().fetchSubSubCategories(subCategoryId);
//                   setState(() {
//                     subSubCategoriesMap[subCategoryId] = subSubList;
//                     selectedSubSubCategoryMap[subCategoryId] = {};
//                   });
//                 }
//               },
//             ),
//           ),
//           if (isSelected && subSubCategoriesMap.containsKey(subCategoryId))
//             ...subSubCategoriesMap[subCategoryId]!.map((subSub) {
//               final subSubId = subSub['_id'];
//               final subSubName = subSub['name'];
//               final selectedSet = selectedSubSubCategoryMap[subCategoryId] ?? {};
//               final isSubSubSelected = selectedSet.contains(subSubId);
//
//               return Padding(
//                 padding: const EdgeInsets.only(left: 20.0),
//                 child: CheckboxListTile(
//                   value: isSubSubSelected,
//                   title: Text(subSubName),
//                   onChanged: (value) {
//                     setState(() {
//                       if (value == true) {
//                         selectedSet.add(subSubId);
//                       } else {
//                         selectedSet.remove(subSubId);
//                       }
//                       selectedSubSubCategoryMap[subCategoryId] = selectedSet;
//                     });
//                   },
//                 ),
//               );
//             }).toList(),
//         ],
//       );
//     },
//   ),





// if (showSelectedSummary) ...[
//   const Text(
//     "Selected Items:",
//     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//   ),
//   const SizedBox(height: 10),
//   ...selectedSubCategoryMap.entries.where((e) => e.value).map((entry) {
//     final subCategoryName = subCategories.firstWhere((sub) => sub['_id'] == entry.key)['name'];
//     final subSubNames = (subSubCategoriesMap[entry.key] ?? [])
//         .where((subSub) => selectedSubSubCategoryMap[entry.key]?.contains(subSub['_id']) ?? false)
//         .map((e) => e['name'])
//         .toList();
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text("• $subCategoryName", style: const TextStyle(fontWeight: FontWeight.w500)),
//           if (subSubNames.isNotEmpty)
//             Padding(
//               padding: const EdgeInsets.only(left: 15.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: subSubNames.map((name) => Text("- $name")).toList(),
//               ),
//             ),
//         ],
//       ),
//     );
//   }),
// ],