import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/view/presentation/user/category_viewing_list/category_viewing_List.dart';
import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:flutter/material.dart';

class ScreenCategoryUser extends StatelessWidget {
  const ScreenCategoryUser({super.key});

  @override
  Widget build(BuildContext context) {
    //Dummy catefory list for UI
    List dummylistNames = [
      'Paintings',
      'Craft',
      'Pencil Drawings',
      'Sculptures',
      'Antiques'
    ];
    return Scaffold(
      appBar: appBarUser(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                itemCount: dummylistNames.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      //screen to category viewing list screen
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Category_Viewing_List_Screen(
                            CategoryName: dummylistNames[index]),
                      ));
                    },
                    child: Container(
                      width: 166,
                      height: 168,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: skyBlueLightK,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            dummylistNames[index],
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 88,
                            height: 79,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(userDummyImage),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
