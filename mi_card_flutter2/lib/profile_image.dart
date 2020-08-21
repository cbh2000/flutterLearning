import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final ImageProvider image;
  final Color borderColor;

  ProfileImage({
    @required this.borderColor,
    @required this.image,
  });

  @override
  Widget build(BuildContext context) {
    // The tricky thing here was to place an image that purposefully
    // overlaps with the background image. What I decided to do was
    // to place a container of size (width: 80, height: 0) in between
    // the image and personal information. The profile image then
    // sits in the center of it and overflows its parent's bounds.
    return SizedOverflowBox(
      // Sets icon in middle (0.0), but slightly up (0.15)
      alignment: Alignment(0, 0.15),
      size: Size(88, 0),
      child: CircleAvatar(
        // This first circle provides the white background
        radius: 29.0,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          // Provides an off-white bg to match parent
          radius: 29.0,
          backgroundColor: borderColor,
          child: Material(
            // Provides the shadow
            color: Colors.black.withAlpha(0),
            shape: CircleBorder(), // Makes shadow a circle shape
            elevation: 1,
            child: CircleAvatar(
              // Actual image
              radius: 26.0,
              backgroundColor: Colors.grey[300],
              backgroundImage: image,
            ),
          ),
        ),
      ),
    );
  }
}
