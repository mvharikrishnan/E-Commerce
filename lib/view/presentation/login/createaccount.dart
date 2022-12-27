

import 'package:ecommerceapp/controller/loginController/authentication.dart';
import 'package:ecommerceapp/controller/loginController/google_sign_in.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/main.dart';
import 'package:ecommerceapp/view/presentation/login/widgets/createFormFiled.dart';
import 'package:ecommerceapp/view/presentation/login/widgets/methods.dart';
import 'package:ecommerceapp/view/presentation/user/home/screenHomeU.dart';
import 'package:ecommerceapp/view/presentation/user/navigation.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    return Scaffold(
      backgroundColor: offWhiteK,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign up',
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
                        formFieldTitle('Full Name'),
                        sizedBoxHeight10,
                        createFormField(
                          TexteditingController: nameController,
                          obscureText: false,
                          validate: (text) {
                            text != null && text.length < 3
                                ? 'Enter Valid Name'
                                : null;
                          },
                        ),
                        sizedBoxHeight10,
                        formFieldTitle('Email'),
                        sizedBoxHeight10,
                        createFormField(
                          TexteditingController: emailController,
                          obscureText: false,
                          validate: (text) {
                            text != null && !EmailValidator.validate(text)
                                ? "Enter a valid email"
                                : null;
                          },
                        ),
                        sizedBoxHeight10,
                        formFieldTitle('Password'),
                        sizedBoxHeight10,
                        createFormField(
                            TexteditingController: passwordController,
                            obscureText: true,
                            validate: (text) {
                              text != null && text.length > 6
                                  ? 'Enter is too short'
                                  : null;
                            }),
                        sizedBoxHeight10,
                        sizedBoxHeight10,
                        GestureDetector(
                          onTap: () async {
                            //authenticate and then navigate
                            await signUP(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                                nameController.text.trim(),
                                context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => mainPage(),
                                ));
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
                  height: 300,
                  width: 300,
                  child: Lottie.network(
                      'https://assets2.lottiefiles.com/packages/lf20_umqaz2yv.json'),
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () async{
                        await SignUP.SignInWithGoogle();
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
                        onPressed: () {},
                        child: const Text('Already have an account?'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
