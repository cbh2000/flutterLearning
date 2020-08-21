import 'package:flutter/material.dart';
import 'profile_image.dart';
import 'information_row.dart';

class BusinessCard<BackImageProvider, ProfImageProvider>
    extends StatelessWidget {
  final Color backgroundColor;
  final ImageProvider<BackImageProvider> backgroundImage;
  final ImageProvider<ProfImageProvider> profileImage;
  final String title;
  final List<InformationRow> information;

  BusinessCard({
    this.backgroundColor = Colors.white,
    this.backgroundImage,
    this.profileImage,
    this.title,
    this.information,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: backgroundColor, // Background color of the entire card
        width: 320.0, // Sets the width of the entire card
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.0), // Matches that of the card
          // This is the column that contains the background image,
          // profile image, and personal information.
          child: Column(
            mainAxisSize:
                // Default is .max which causes card to
                // be taller than necessary and have empty space
                MainAxisSize.min,
            // Default is .centerTop, which is not what we want.
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // The container exists just to set a background color.
              Container(
                color: backgroundColor.withAlpha(255),
                // The SizedBox helps us size the image.
                child: SizedBox(
                  // double.infinity means, "Take all available space,
                  // horizontally."
                  width: double.infinity,
                  height: 200,
                  child: Image(
                    fit: BoxFit.cover, // Cover means in UIKit terms, "fill."
                    image: backgroundImage,
                  ),
                ),
              ),
              ProfileImage(
                image: profileImage,
                borderColor: backgroundColor,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  10, // A standard, "Looks good," left padding
                  35, // Needs to be higher to avoid intersecting with profile image
                  10, // Matches left padding.
                  12, // Spacing between bottom of personal information and card
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      // Padding: all column items need +8 padding at the
                      // start, so that the tapped area on the
                      // buttons extends past the edges to look better and
                      // increase tappable area.
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Column(
                      children: information,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
