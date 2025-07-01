// import 'package:flutter/material.dart';
// import 'package:post_api_assignment/Screens/Home/allCategoryView.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//
//   final List<Map<String, dynamic>> buttons = [
//     {
//       'title': 'Create Post',
//       'color': Colors.grey,
//       'onTap': () {
//         CreatePost();
//       },
//     },
//     {
//       'title': 'View All Product',
//       'color': Colors.deepPurple,
//       'onTap': () {
//        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CreatePost()));
//       },
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home Screen'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: GridView.count(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 36,
//           childAspectRatio: 3 / 1,
//           children: buttons.map((btn) {
//             return ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: btn['color'],
//                 foregroundColor: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               onPressed: btn['onTap'],
//               child: Text(
//                 btn['title'],
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:post_api_assignment/Screens/Home/Category_AllProduct_Page.dart';
import 'package:post_api_assignment/Screens/Home/allCategoryView.dart';
import 'package:post_api_assignment/Screens/Home/theme_notifier.dart';
import 'package:post_api_assignment/Services/ApiService.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/ProfileAssignModel.dart';
import '../../utils/Auth_Storage.dart';
import '../Auth/Login_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ProfileAssignModel? profileData;
 // List<String> categoryNames = [];
  List<Map<String, dynamic>> categories = [];
  bool isLoading = true;


  // void fetchData()async{
  //   final profile = await ApiService().fetchAndStoreUserProfile();
  //   setState(() {
  //     profileData = profile;
  //   });
  // }


  Future<void> fetchAndStoreUserProfile() async {
    ProfileAssignModel? profile = await ApiService().getProfileData();
    if (profile != null) {
      setState(() {
        profileData = profile;
      });
    }
  }


  // Future<void> fetchCategory()async{
  //   final names = await ApiService().getMainCategory();
  //   setState(() {
  //     categoryNames = names;
  //     isLoading = false;
  //   });
  // }


  Future<void> fetchCategory()async{
    final names = await ApiService().getMainCategory();
    setState(() {
      categories = names;
      isLoading = false;
    });
  }


  @override
  void initState() {
    fetchAndStoreUserProfile();
    fetchCategory();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> buttons = [
      {
        'title': 'Create Post',
        'color': Colors.grey,
        'onTap': () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const CreatePost()),
          );
        },
      },
      {
        'title': 'View All Product',
        'color': Colors.deepPurple,
        'onTap': () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const CategoryAllProductPage()),
          );
        },
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: (){
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu, color: Colors.black87,)
            );
          }
        )
      ),


      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 36,
                      ),
                      const SizedBox(height: 3,),
                      Text(
                        profileData?.name ?? 'Loading....',
                        //'Pooja Jadhav',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 3,),
                       Text(
                         profileData?.email ?? '',
                        //'pooja@gmail.com',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      ValueListenableBuilder<ThemeMode>(
                        valueListenable: themeNotifier,
                        builder: (context, mode, _) {
                          return IconButton(
                            icon: Icon(
                              mode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode,
                              color: Colors.white,
                              size: 28,
                            ),
                            onPressed: () {
                              themeNotifier.value = mode == ThemeMode.light
                                  ? ThemeMode.dark
                                  : ThemeMode.light;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
            ),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                await AuthStorage.clearStorage();
                print('objecttttttttttt : ${AuthStorage.clearStorage()}');
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
            ),


          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
             width: double.infinity,
              child: Image.network('https://images.unsplash.com/39/lIZrwvbeRuuzqOoWJUEn_Photoaday_CSD%20%281%20of%201%29-5.jpg?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') ,
            ),

            // Container(
            //   height: 150,
            //   decoration: const BoxDecoration(
            //    // color: Colors.black26
            //   ),
            //   child: ListView.builder(
            //     itemCount: categoryNames.length,
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (context, index){
            //       return Padding(
            //         padding: const EdgeInsets.all(4.0),
            //         child: InkWell(
            //           onTap: (){
            //             Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategoryAllProductPage()));
            //           },
            //           child: Container(
            //             decoration:  BoxDecoration(
            //               borderRadius: BorderRadius.circular(15),
            //               color: Colors.blueGrey
            //             ),
            //             child: Column(
            //               children: [
            //                 Image.asset('assets/arts_service.png', scale: 50,),
            //                 Text(
            //                   categoryNames[index],
            //                   textAlign: TextAlign.center,
            //                   style: const TextStyle(fontSize: 16, color: Colors.black),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       );
            //
            //       }),
            // ),


            Container(
              height: 160,
              child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const CategoryAllProductPage(),
                          ),
                        );
                      },
                      child: Container(
                        width: 120,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blueGrey.shade100,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              spreadRadius: 1,
                              offset: Offset(2, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/arts_service.png', scale: 2),
                            const SizedBox(height: 8),
                            Text(
                              categories[index]['name'] ?? '',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),



            Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 36,
                childAspectRatio: 3 / 1,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: buttons.map((btn) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: btn['color'],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: btn['onTap'],
                    child: Text(
                      btn['title'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
