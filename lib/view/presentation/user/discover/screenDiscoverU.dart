import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/appConstants.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:flutter/material.dart';

class ScreenDiscoverUser extends StatelessWidget {
  const ScreenDiscoverUser({super.key});

  @override
  Widget build(BuildContext context) {
    List DummyArts = [
      'assets/drawingImage/drawing1.jpeg',
      'assets/drawingImage/drawing2.jpeg',
      'assets/drawingImage/drawing3.jpeg',
      'assets/drawingImage/drawing4.jpeg',
      'assets/drawingImage/drawing5.jpeg'
    ];
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                offWhiteK,
              ]),
          color: darkBlueLightK,
          borderRadius: BorderRadius.circular(10)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBarUser(context),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //TextFieldButton
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle:  TextStyle(
                        color: KWhite,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: Colors.white,
                    fillColor: skyBlueLightK,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      width: 3,
                      color: skyBlueLightK,
                    ))),
              ),
              sizedBoxHeight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'All Products',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              sizedBoxHeight10,
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Container(
                            height: 140,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  // BoxShadow(
                                  //   color: Colors.grey,
                                  //   blurRadius:
                                  //       5.0, // has the effect of softening the shadow
                                  //   spreadRadius:
                                  //       1.0, // has the effect of extending the shadow
                                  //   offset: Offset(
                                  //     8.0, // horizontal, move right 10
                                  //     2.0, // vertical, move down 10
                                  //   ),
                                  // )
                                ],
                                borderRadius: BorderRadius.circular(10),
                                color: skyBlueLightK),
                          ),
                          Positioned(
                            left: 15,
                            top: 15,
                            child: Container(
                              width: 109,
                              height: 109,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(DummyArts[index]),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 140,
                            top: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Girl Portrait - A4(Pencil Portrait)',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: TradeGothic),
                                ),
                                sizedBoxHeight10,
                                const Text(
                                  "150/-",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                sizedBoxHeight10,
                                const Text('Portrait')
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            right: 10,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_rounded,
                                  color: Colors.red,
                                )),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: DummyArts.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
