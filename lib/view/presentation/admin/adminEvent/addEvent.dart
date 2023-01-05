import 'dart:developer';
import 'dart:io';

import 'package:ecommerceapp/controller/adminAddEvent.dart';
import 'package:ecommerceapp/controller/fireBase_api.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/appConstants.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/model/eventModel/eventModel.dart';
import 'package:ecommerceapp/view/presentation/admin/widgets/addCategoryFormField.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

File? ImageFile1;

class _AddEventState extends State<AddEvent> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController eventNameController = TextEditingController();

    return AlertDialog(
      scrollable: true,
      backgroundColor: darkBlueK,
      contentPadding: EdgeInsets.all(2),
      content: Stack(
        children: <Widget>[
          Positioned(
            right: 5.0,
            top: 5.0,
            child: InkResponse(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                radius: 15,
                child: Icon(
                  Icons.close,
                  size: 20,
                ),
                backgroundColor: KWhite,
              ),
            ),
          ),
          Container(
            height: 400,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ADD EVENT',
                      style: TextStyle(
                          color: KWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                sizedBoxHeight10,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: AddCategoryFormField(
                                  controller: eventNameController,
                                  labelText: ConstantNames.eventName,
                                  validator: (value) {
                                    //validator
                                    if (value!.isEmpty) {
                                      return ConstantNames.pleaseEnterErrorText;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              sizedBoxHeight10,
                            ],
                          ),
                        ),
                        sizedBoxHeight10,
                        InkWell(
                          onTap: () => selectFile(),
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 192, 191, 191),
                              image: (ImageFile1 != null)
                                  ? DecorationImage(
                                      image: FileImage(File(ImageFile1!.path)))
                                  : null,
                            ),
                          ),
                        )
                      ],
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(KWhite)),
                      onPressed: () async {
                        // upload image in category
                        final String fileURL = await uploadFile();
                        //submit form
                        final newEvent = eventModel(
                            eventName: eventNameController.text.trim(),
                            eventImageURL: fileURL);
                        log('Before Adding');
                        await AddEventToFB(modelevent: newEvent);
                        log('Added done');

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            '${eventNameController.text} Successfully Added',
                            style: TextStyle(color: KWhite),
                          ),
                          backgroundColor: kGreen,
                        ));
                        Navigator.pop(context);
                      },
                      child: Text(
                        ConstantNames.submit,
                        style: TextStyle(
                          color: darkBlueK,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  //files adding
  Future selectFile() async {
    log('Select method called');
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;
    setState(() {
      ImageFile1 = File(path);
    });
    log(ImageFile1!.path);
  }

  //For uploading flie
  Future uploadFile() async {
    log('uploadFile method called');
    if (ImageFile1 == null) return;
    final fileName = ImageFile1!.path;

    final destination = 'events/$fileName';

    final ImageURL = await FireBaseApi.uploadFile(destination, ImageFile1!);
    log('Download Link of image: $ImageURL');
    return ImageURL;
  }
}
