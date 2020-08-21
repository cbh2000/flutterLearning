import 'package:flutter/material.dart';
import 'utilities.dart';
import 'personal_information.dart';
import 'business_card.dart';
import 'information_row.dart';

// This class is responsible for populating the card with data
class BusinessCardContainerState extends State {
  Color imageColor = Colors.blueGrey;

  BusinessCardContainerState() {
    getImagePalette(NetworkImage(myInfo.backgroundImage)).then((value) {
      if (value != null) {
        this.setState(() {
          this.imageColor = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: imageColor.withAlpha(100), // Area behind card
        child: SafeArea(
          child: Center(
            child: BusinessCard(
              backgroundColor: imageColor.withAlpha(10),
              backgroundImage: NetworkImage(myInfo.backgroundImage),
              profileImage: NetworkImage(getProfileImageURI(myInfo.email)),
              title: myInfo.name,
              information: [
                InformationRow(
                  icon: Icons.business,
                  text: myInfo.role,
                ),
                InformationRow(
                  icon: Icons.phone,
                  text: myInfo.phone,
                  onTap: () {
                    callPhoneNumber(myInfo.phone);
                  },
                ),
                InformationRow(
                  icon: Icons.email,
                  text: myInfo.email,
                  onTap: () {
                    sendEmailTo(myInfo.email);
                  },
                ),
                InformationRow(
                  icon: Icons.access_time,
                  text: myInfo.schedule,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BusinessCardContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BusinessCardContainerState();
  }
}
