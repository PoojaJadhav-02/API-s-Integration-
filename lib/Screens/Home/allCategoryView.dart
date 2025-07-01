/*
import 'package:flutter/material.dart';

import '../../Services/ApiService.dart';
import 'Category_AllProduct_Page.dart';
import 'Create_Product.dart';
import 'PostCreateProduct.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {

  bool isLoading = true;
  List<String> categoryNames = [];
  List<Map<String, dynamic>> categories = [];


  Future<void> fetchCategory()async{
    final names = await ApiService().getMainCategory();
    setState(() {
      categories = names;
      isLoading = false;
    });
  }


  @override
  void initState() {
    fetchCategory();
    super.initState();
  }

  final List<String> categoryImages = [
    'assets/arts_service.png',
    'assets/homePageImage.jpg',
    'assets/homePageImage.jpg',
    'assets/arts_service.png',
    'assets/arts_service.png',
    'assets/homePageImage.jpg',
    'assets/homePageImage.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Product Post', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
    child: SingleChildScrollView(
    child: Column(
      children: [
      Container(
      height: 1000,
      child: GridView.builder(
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 12,
          childAspectRatio: 1.5,
        ),
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          final imageIndex = index % categoryImages.length;
          final name = categories[index]['name'] ?? '';
          final sId = categories[index]['_id'] ?? '';

          print('Sid $sId');
          print('name $name');

          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                // builder: (context) => CreateProduct(
                //   categoryName: name,
                //   catagoriesId: sId,
                // ),
                builder: (context) => PostCreateProduct(
                  categoryName: name,
                  catagoriesId: sId,
                ),
              ));
              print('Category name : $name');
              print('Category Id : $sId');
            },
            child: Container(
              //height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 4,
                    spreadRadius: 1,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        categoryImages[imageIndex],
                        width: 35,
                        height: 40,
                      ),
                      const SizedBox(height: 7),
                      Text(
                        name,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: "Roboto_Regular",
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ),
    ],
    ),
    ),
    ),

      backgroundColor: Colors.grey[200],
    );
  }

}




*/




import 'package:flutter/material.dart';

import '../../Services/ApiService.dart';
import 'Category_AllProduct_Page.dart';
import 'Create_Product.dart';
import 'PostCreateProduct.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  bool isLoading = true;
  List<Map<String, dynamic>> categories = [];

  Future<void> fetchCategory() async {
    final fetchedCategories = await ApiService().getMainCategory();
    setState(() {
      categories = fetchedCategories;
      isLoading = false;
    });
  }

  @override
  void initState() {
    fetchCategory();
    super.initState();
  }

  final List<String> categoryImages = [
    'assets/arts_service.png',
    'assets/homePageImage.jpg',
    'assets/homePageImage.jpg',
    'assets/arts_service.png',
    'assets/arts_service.png',
    'assets/homePageImage.jpg',
    'assets/homePageImage.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All Product Post',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 12,
            childAspectRatio: 1.5,
          ),
          padding: const EdgeInsets.all(8),
          itemBuilder: (context, index) {
            final imageIndex = index % categoryImages.length;
            final name = categories[index]['name'] ?? '';
            final sId = categories[index]['id'] ?? '';

            return InkWell(
              onTap: () {
                if (sId.isEmpty) {
                  debugPrint("❌ Skipping navigation: Category ID is empty for '$name'");
                  return;
                }
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PostCreateProduct(
                      categoryName: name,
                      catagoriesId: sId,
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 4,
                      spreadRadius: 1,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          categoryImages[imageIndex],
                          width: 35,
                          height: 40,
                        ),
                        const SizedBox(height: 7),
                        Text(
                          name,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: "Roboto_Regular",
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
