import 'package:flutter/material.dart';

import '../../Model/CreateAllCatModel.dart';
import 'Product_Detail_View.dart';

class CategoryAllProductPage extends StatefulWidget {
  const CategoryAllProductPage({super.key});

  @override
  State<CategoryAllProductPage> createState() => _CategoryAllProductPageState();
}

class _CategoryAllProductPageState extends State<CategoryAllProductPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
         body: SingleChildScrollView(
           child: Container(
                 height: 1000,
              child: GridView.builder(
                itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 0,
                      childAspectRatio: 1.5,
                  ),
                  itemBuilder: (context, index){
                     return InkWell(
                       onTap: (){
                         // Navigator.push(
                         //   context,
                         //   MaterialPageRoute(
                         //     builder: (context) => ProductDetailView(product: Data ),
                         //   ),
                         // );

                         //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProductDetailView(title: '', description: '', price: 0, subCategory: '',)));
                       },
                       child: Container(
                         //height: 200,
                        // padding: EdgeInsets.all(10),
                         margin: const EdgeInsets.only(left: 10, right: 10),
                         decoration: BoxDecoration(
                           border: Border.all(color: Colors.purpleAccent, width: 1),
                           borderRadius: BorderRadius.circular(15),
                           color: Colors.black26
                         ),
                         child: Column(
                           children: [

                           ],
                         ),
                       ),
                     );
                  }
              ),
               )
         )
    );
  }
}
