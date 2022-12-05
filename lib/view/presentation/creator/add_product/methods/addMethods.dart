import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Center iconImageAdd() {
  return const Center(
    child: Icon(
      Icons.add_photo_alternate,
    ),
  );
}
 Text AddProductFormTitle({required String Title}) {
    return  Text(
                    Title,
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  );
  }
