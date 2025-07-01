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



class _PostCreateProductState extends State<PostCreateProduct> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  bool isLoading = false;
  List<Map<String, dynamic>> subCategories = [];
  List<Map<String, dynamic>> subSubCategories = [];

  String? selectedSubCategoryId;
  List<String> selectedSubSubCategoryIds = [];

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
     // subSubCategoryId: selectedSubSubCategoryIds, // Assuming API supports list
     // subSubCategoryId: selectedSubSubCategoryIds.join(','), // converts List<String> to comma-separated String
      subSubCategoryId: selectedSubSubCategoryIds, // <== keep as List<String>


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
      selectedSubSubCategoryIds.clear(); // reset on change
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
                    selectedSubSubCategoryIds.clear();
                    subSubCategories = [];
                  });
                  if (value != null) loadSubSubCategories(value);
                },
              ),
              const SizedBox(height: 10),
              if (subSubCategories.isNotEmpty) ...[
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Select Sub-SubCategories",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: subSubCategories.length,
                  itemBuilder: (context, index) {
                    final subSub = subSubCategories[index];
                    final id = subSub['_id'];
                    final name = subSub['name'];
                    final isSelected = selectedSubSubCategoryIds.contains(id);

                    return Card(
                      child: ListTile(
                        title: Text(name),
                        leading: Checkbox(
                          value: isSelected,
                          onChanged: (value) {
                            setState(() {
                              if (value == true) {
                                selectedSubSubCategoryIds.add(id);
                              } else {
                                selectedSubSubCategoryIds.remove(id);
                              }
                            });
                          },
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.add_circle_outline, color: Colors.purple),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Added "$name"')),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
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
