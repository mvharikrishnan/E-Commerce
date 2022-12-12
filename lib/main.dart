import 'package:ecommerceapp/core/utils/utils.dart';
import 'package:ecommerceapp/view/presentation/user/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ecommerceapp/view/presentation/login/signUP.dart';

import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(fontFamily: TradeGothic),
      home: mainPage(),
    );
  }
}

class mainPage extends StatelessWidget {
  const mainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if(snapshot.hasError){
            return const Center(child: Text('Something Went Wrong'),);
          }else 
          if (snapshot.hasData) {
            return const NavigationScreenUser();
          } else {
            return const SignUpPage();
          }
        },
      ),
    );
  }
}
