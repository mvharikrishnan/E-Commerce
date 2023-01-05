import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceapp/controller/readDataFromFB.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/appConstants.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';
import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:ecommerceapp/view/presentation/user/home/widget/homeScreenProductTile.dart';
import 'package:ecommerceapp/view/presentation/user/home/widget/slidingBarItemTile.dart';
import 'package:flutter/material.dart';

class ScreenHomeUser extends StatelessWidget {
  const ScreenHomeUser({super.key});

  @override
  Widget build(BuildContext context) {
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
        drawer: Drawer(
          backgroundColor: offWhiteK,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SlidingBarItem(),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(
                          'HEY ',
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 30,fontFamily: TradeGothic),
                        ),
                        Text(
                          'ARTAHOLIC',
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 25,fontFamily: TradeGothic),
                        ),
                      ],
                    ),
                    //end

                    

                  ],
                ),
              ),
              sizedBoxHeight10,
              CarouselSlider(
                options: CarouselOptions(height: 185.0),
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                'assets/drawingImage/artfestposter2.jpg'),
                          ),
                          // color: Colors.amber,
                        ),
                        // child: Text(
                        //   'text $i',
                        //   style: TextStyle(fontSize: 16.0),
                        // ),
                      );
                    },
                  );
                }).toList(),
              ),
              sizedBoxHeight10,
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Top Artworks',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              sizedBoxHeight10,
              Flexible(
                fit: FlexFit.loose,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StreamBuilder<List<ProductModel>>(
                    stream: FetchProducts(CollectionName: 'CreatorsProducts'),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something Went Wrong ${snapshot.error}');
                      }

                      if (snapshot.hasData) {
                        final Products = snapshot.data!;

                        return GridView(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 1 / 1.5,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 4.0,
                                  mainAxisSpacing: 10.0),
                          children: Products.map(BuildProducts).toList(),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),
              // HomeScreenGridTile()
            ],
          ),
        ),
      ),
    );
  }
}

Widget BuildProducts(ProductModel productModel) =>
    HomeScreenGridTile(productModel: productModel);
