import 'dart:developer';

import 'package:ecommerceapp/controller/bloc/searchBloc/search_bloc.dart';
import 'package:ecommerceapp/core/utils/utils.dart';
import 'package:ecommerceapp/view/presentation/admin/adminHome.dart';
import 'package:ecommerceapp/view/presentation/user/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ecommerceapp/view/presentation/login/signUP.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchBloc(),
        ),
      ],
      child: MaterialApp(
        scaffoldMessengerKey: Utils.messengerKey,
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(fontFamily: TradeGothic),
        home: mainPage(),
      ),
    );
  }
}

class mainPage extends StatelessWidget {
  mainPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          final user = FirebaseAuth.instance.currentUser;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Something Went Wrong'),
            );
          } else if (snapshot.hasData) {
                //admin navigation
            if (user!.email == 'admin@gmail.com') {
              return const AdminHomePage();
            } else {
              //user page navigation
              return const NavigationScreenUser();
            }
          } else {
            return const SignUpPage();
          }
        },
      ),
    );
  }

  // Widget NavigationChecker() {
  //   if (user.email == 'admin@gmail.com') {
  //     return const AdminHomePage();
  //   } else if (user.email == 'harikrishnanmv@gmail.com') {
  //     return const NavigationScreenUser();
  //   }
  // }
}
