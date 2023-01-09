import 'dart:developer';

import 'package:ecommerceapp/controller/bloc/searchBloc/search_bloc.dart';

import 'package:ecommerceapp/core/colors/colors.dart';

import 'package:ecommerceapp/core/constants/user/constants.dart';

import 'package:ecommerceapp/view/presentation/user/discover/widgets/searchScreenTile.dart';
import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ScreenDiscoverUser extends StatelessWidget {
  const ScreenDiscoverUser({super.key});

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   BlocProvider.of<SearchBloc>(context).add()
    // });
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
                onChanged: (value) {
                  log(value);
                  BlocProvider.of<SearchBloc>(context)
                      .add(SearchProduct(input: value));
                },
                decoration: InputDecoration(
                  hintText: 'we have something for you',
                  hintStyle: TextStyle(
                      color: KWhite, fontSize: 15, fontWeight: FontWeight.bold),
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.white,
                  fillColor: skyBlueLightK,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: skyBlueLightK,
                    ),
                  ),
                ),
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
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state.productList.isEmpty) {
                      return Center(
                        child: Lottie.asset(
                            'assets/drawingImage/lookingForArt.json'),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: state.productList.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) {
                          return searchScreenTile(
                              productModel: state.productList[index]);
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
