import 'package:ecommerceapp/controller/readDataFromFB.dart';
import 'package:ecommerceapp/controller/userNameChange.dart';
import 'package:ecommerceapp/model/roleModels/roleModels.dart';
import 'package:ecommerceapp/view/presentation/login/widgets/createFormFiled.dart';

import 'package:ecommerceapp/view/presentation/login/widgets/methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class account_edit_button extends StatelessWidget {
  account_edit_button({
    Key? key,
  }) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final email = FirebaseAuth.instance.currentUser!.email;

    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () async {
          final usernameuser = await fetchUserEmails(email: email!);
          showEditDialog(context, usernameuser.userName);
        },
        child: Container(
          width: 103,
          height: 23,
          child: Center(
              child: const Text(
            'Edit',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }

  showEditDialog(BuildContext context, String username) {
    final TextEditingController _nameController =
        TextEditingController(text: username);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Name"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              formFieldTitle("Name"),
              createFormField(
                obscureText: false,
                TexteditingController: _nameController,
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
              onPressed: (() {
                final model = userModel(
                    userEmail: user.email!,
                    userName: _nameController.text.trim());
                editUserName(
                    User: model, currentUser: 'UserEmail', context: context);
              }),
              child: const Text("Update"))
        ],
      ),
    );
  }
}
