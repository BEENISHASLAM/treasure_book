
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/releated_products.dart';
import '../const/app_colors.dart';
import '../const/custom_searchbar.dart';
import '../const/custom_tab.dart';
import '../const/custome_text.dart';
import '../const/product_tile.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
   HomeView({Key? key}) : super(key: key);
   final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.black,
      appBar: AppBar(
        backgroundColor: Appcolor.black,
        title:heading("Treasure Book"),
        leading: IconButton(
          icon: Image.asset(
            'assets/icons/hamburger.png',
            width: 24,
            height: 24,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                     //mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomSearchBar(),
                  HorizontalButtonList(
                    categories: ['Fiction', 'Non-Fiction', 'Poetry','Mystery',  'Romance' ],
                    onCategorySelected: (category) {
                      print('Selected category: $category');
                      // Handle category selection
                    },),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                            child: heading("Recent")),
                      ),
                      SizedBox(height: 10,),
                      ProductView(),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(onPressed: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return PopupForm(
                                authorController:homeController.authorController,
                                nameController:homeController.nameController,
                                categoryController:homeController.categoryController,
                              );
                            },
                          );

                        }, icon: Icon(Icons.add_circle_outline, size: 30,), color:Appcolor.orange,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: heading("Most Related")),
                      ),
                      SizedBox(height: 10,),
                      RelatedProduct(),

                    ],

                  ),
                ),
              ),
            );
          },
        ),

    bottomNavigationBar: Obx(
    () => BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.orange,
      selectedFontSize: 14.0,
      unselectedFontSize: 14.0,
      selectedIconTheme: IconThemeData(color: Appcolor.black),
      currentIndex: homeController.selectedIndex.value,
      unselectedItemColor: Colors.grey,
      onTap: homeController.changePage,
      items: [
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                if (homeController.selectedIndex == 0)
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Container(
                      height: 2,
                      color: Appcolor.orange,
                    ),
                  ),
                Obx(() =>Image.asset(
                  'assets/icons/home1.png',
                  width: 30,
                  height: 30,
                  color: homeController.selectedIndex == 0 ? Appcolor.orange : Colors.grey,
                )),
              ],
            ),
          ),
          label: 'Library',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                if (homeController.selectedIndex == 1)
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Container(
                      height: 2,
                      color: Appcolor.orange,
                    ),
                  ),
                Image.asset(
                  'assets/icons/favorite.png',
                  width: 30,
                  height: 30,
                  color: homeController.selectedIndex == 1 ? Appcolor.orange : Colors.grey,
                ),
              ],
            ),
          ),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                if (homeController.selectedIndex == 2)
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Container(
                      height: 2,
                      color: Appcolor.orange,
                    ),
                  ),
                Image.asset(
                  'assets/icons/profile.png',
                  width: 30,
                  height: 30,
                  color: homeController.selectedIndex == 2 ? Appcolor.orange : Colors.grey,
                ),
              ],
            ),
          ),
          label: 'My Profile',
        ),
      ],
    ),



    )

    );
  }
}







class PopupForm extends StatelessWidget {
  HomeController controller = Get.find();
  final TextEditingController authorController;
  final TextEditingController nameController;
  final TextEditingController categoryController;

   PopupForm({
    Key? key,
    required this.authorController,
    required this.categoryController,
     required this.nameController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Book'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller:controller.nameController,
            decoration: InputDecoration(labelText: 'Book Name'),
          ),
          TextField(
            controller:controller.authorController,
            decoration: InputDecoration(labelText: 'Author Name'),
          ),
          TextField(
            controller:controller.categoryController,
            decoration: InputDecoration(labelText: 'Add Category'),
          ),
          ElevatedButton(
            onPressed: (){
              controller.pickImage();
            },
            child: Text('Add cover Image'),
          ),
          // controller.imageFile != null
          //     ? Image.file(controller.imageFile!! as File)
          //     : Placeholder(fallbackHeight: 200.0),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            controller.submitForm();
            Navigator.pop(context);
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}




