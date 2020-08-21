import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'business_card_container.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BusinessCardContainer(),
    );
  }
}
