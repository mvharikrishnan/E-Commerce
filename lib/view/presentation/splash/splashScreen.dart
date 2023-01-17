import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/appConstants.dart';
import 'package:ecommerceapp/main.dart';
import 'package:ecommerceapp/view/widget/internetScreen.dart';
import 'package:flutter/material.dart';
import 'package:internet_connectivity_checker/internet_connectivity_checker.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertdialog = false;

  @override
  void initState() {
    // TODO: implement initState
    gotoHomeScreen(context);
    super.initState();
  }

  //connection checking
  // getConnectivity()=>subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async{
  //   final isConnected = await InternetConnectivity().isConnectedToInternet();
  // });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isConnected = InternetConnectivity().isConnectedToInternet();
    return Scaffold(
      backgroundColor: skyBlueLightK,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 0.7 * size.width,
                width: 0.7 * size.width,
                child: LottieBuilder.asset(
                    "assets/drawingImage/splashScreen.json")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ARTIFY",
                  style: TextStyle(fontFamily: TradeGothic, fontSize: 24),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> gotoHomeScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>InternetStream(),
        ));
    
  }
}

class InternetStream extends StatelessWidget {
  const InternetStream({super.key});

  @override
  Widget build(BuildContext context) {
    Stream<bool> stream = InternetConnectivity().isConnectedToInternet();
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        log("Internet Stream ");        if (snapshot.hasData && (snapshot.data as bool) == true) {
          return mainPage();
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const InternetScreen();
        }
      },
    );
  }
}
