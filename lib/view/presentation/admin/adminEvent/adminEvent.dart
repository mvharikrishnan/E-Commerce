import 'package:ecommerceapp/controller/readDataFromFB.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/appConstants.dart';
import 'package:ecommerceapp/model/eventModel/eventModel.dart';
import 'package:ecommerceapp/view/presentation/admin/adminEvent/addEvent.dart';
import 'package:ecommerceapp/view/presentation/admin/widgets/adminAppBar.dart';
import 'package:ecommerceapp/view/presentation/admin/widgets/eventTile.dart';
import 'package:ecommerceapp/view/presentation/creator/widgets/back_ground_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AdminEventScren extends StatelessWidget {
  const AdminEventScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backGroundColor(),
      child: Scaffold(
        backgroundColor: kTransparent,
        appBar: PreferredSize(
            child:
                AdminAppBar(isVisible: false, TitleText: ConstantNames.events),
            preferredSize: const Size(double.infinity, 60)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder<List<eventModel>>(
                stream: fetchEvents(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Something error occurs'),
                    );
                  }

                  if (snapshot.hasData) {
                    final currentEvents = snapshot.data!;

                    return ListView(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      children: currentEvents.map(BuildEvents).toList(),
                    );
                  } else {
                    return const Center(
                      child: Text('Please Add Events'),
                    );
                  }
                },
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //Button for adding event
            showPopUpFORM(context);
          },
          backgroundColor: darkBlueK,
          child: const Icon(Icons.add_circle),
        ),
      ),
    );
  }

  showPopUpFORM(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => const AddEvent(),
    );
  }
}

Widget BuildEvents(eventModel ModelEvent) => EventTIle(ModelEvent: ModelEvent);
