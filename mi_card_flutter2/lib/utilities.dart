import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/widgets.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:url_launcher/url_launcher.dart';

// Calculate dominant color from ImageProvider.
// MAY RETURN NULL.
Future<Color> getImagePalette(ImageProvider imageProvider) async {
  if (imageProvider == null) {
    return null;
  }

  try {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(imageProvider);
    if (paletteGenerator != null) {
      if (paletteGenerator.dominantColor != null) {
        return paletteGenerator.dominantColor.color;
      }
    }
    return null;
  } catch (e) {
    return null;
  }
}

void sendEmailTo(String address) async {
  var url = Uri.encodeFull('mailto:$address');
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void callPhoneNumber(String number) async {
  var url = Uri.encodeFull('tel:$number');
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

String getProfileImageURI(String email) {
  var asMd5String = md5.convert(utf8.encode(email)).toString();
  return 'https://www.gravatar.com/avatar/${asMd5String}';
}
