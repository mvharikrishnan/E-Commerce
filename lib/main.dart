import 'dart:developer';

import 'package:ecommerceapp/controller/bloc/searchBloc/search_bloc.dart';
import 'package:ecommerceapp/controller/roles.dart';
import 'package:ecommerceapp/core/utils/utils.dart';
import 'package:ecommerceapp/view/presentation/admin/adminHome.dart';
import 'package:ecommerceapp/view/presentation/creator/home/creator_home_screen.dart';
import 'package:ecommerceapp/view/presentation/splash/splashScreen.dart';
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
        home: const SplashScreen(),
      ),
    );
  }
}

class mainPage extends StatelessWidget {
  mainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FetchAllCreator(),
          builder: (context, snap) {
            if (snap.hasError) {
              log(snap.error.toString());
              return Center(
                child: Text('SNAP has error ${snap.error}'),
              );
            } else if (snap.hasData) {
              final creatorList = snap.data!;
              log(creatorList.toString());

              if (creatorList.isEmpty) {
                return const Text('Creator List is empty');
              }
              final List<String> listOfCreator = [];
              for (var creator in creatorList) {
                listOfCreator.add(creator.creatorEmail);
              }
              log("ListOfCreator = $listOfCreator");
              return StreamBuilder<User?>(
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

                      // bool containsEmail = listOfCreator
                      //     .where((creator) => creator == currentUserEmail)
                      //     .isNotEmpty;
                      final currentUserEmail = user.email;
                      bool containsEmail =
                          listOfCreator.any((mail) => mail == currentUserEmail);

                      //for console
                      (containsEmail)
                          ? log('Creator Logged In')
                          : log("user Logged in");
                      log(containsEmail.toString());
                      return containsEmail
                          ? const Creator_Home_screen()
                          : const NavigationScreenUser();
                    }
                  }
                  return const SignUpPage();
                },
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
