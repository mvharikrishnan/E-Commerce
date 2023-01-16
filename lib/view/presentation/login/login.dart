import 'dart:developer';

import 'package:ecommerceapp/controller/loginController/authentication.dart';
import 'package:ecommerceapp/controller/loginController/google_sign_in.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/main.dart';
import 'package:ecommerceapp/view/presentation/login/createaccount.dart';
import 'package:ecommerceapp/view/presentation/login/identifyUser.dart';
import 'package:ecommerceapp/view/presentation/login/widgets/createFormFiled.dart';
import 'package:ecommerceapp/view/presentation/login/widgets/methods.dart';

import 'package:ecommerceapp/view/presentation/user/navigation.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: offWhiteK,
      body: SingleChildScrollView(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Log in',
                        style: TextStyle(
                            color: darkBlueK,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      sizedBoxHeight10,
                      sizedBoxHeight10,
                      sizedBoxHeight10,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          formFieldTitle('Email'),
                          sizedBoxHeight10,
                          createFormField(
                            TexteditingController: emailController,
                            validate: (text) =>
                                text != null && !EmailValidator.validate(text)
                                    ? "Enter a vaild email"
                                    : null,
                            obscureText: false,
                          ),
                          sizedBoxHeight10,
                          formFieldTitle('Password'),
                          sizedBoxHeight10,
                          createFormField(
                            TexteditingController: passwordController,
                            obscureText: true,
                            validate: (text) => text != null && text.length < 6
                                ? "Password too Short"
                                : null,
                          ),
                          sizedBoxHeight10,
                          sizedBoxHeight10,
                          InkWell(
                            onTap: () async {
                              log('Login Called');
          
                              log("Validation finished");
          
                              await signIn(emailController.text.trim(),
                                  passwordController.text.trim(), context);
          
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 56,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: darkBlueK),
                              child: Center(
                                child: Text(
                                  'Continue',
                                  style: TextStyle(
                                    color: KWhite,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 0.300 * size.height,
                    width: 0.300 * size.height,
                    child: Lottie.network(
                        'https://assets2.lottiefiles.com/packages/lf20_umqaz2yv.json'),
                  ),
                  sizedBoxHeight10,
                  sizedBoxHeight10,
                  sizedBoxHeight10,
                  sizedBoxHeight10,
                  sizedBoxHeight10,
                  Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          await SignUP.SignInWithGoogle(context);
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 56,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(19),
                              border: Border.all(width: 2)),
                          child: ListTile(
                            leading: Image.network(
                                'http://pngimg.com/uploads/google/google_PNG19635.png',
                                fit: BoxFit.cover),
                            title: Text(
                              '         Continue with Google',
                              style: TextStyle(color: darkBlueK),
                            ),
                          ),
                        ),
                      ),
                      sizedBoxHeight10,
                      sizedBoxHeight10,
                      TextButton(
                          onPressed: () {
                            //give push and remove until
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => const IdentifyRoleScreen(),
                            ));
                          },
                          child: const Text('Create an account?'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
