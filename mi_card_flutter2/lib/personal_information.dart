import 'package:flutter/foundation.dart';

class PersonalInformation {
  final String name;
  final String role;
  final String phone;
  final String email;
  final String schedule;
  final String backgroundImage;

  PersonalInformation({
    @required this.name,
    @required this.role,
    @required this.phone,
    @required this.email,
    @required this.schedule,
    @required this.backgroundImage,
  });
}

PersonalInformation myInfo = PersonalInformation(
  name: 'Christopher B. Henderson',
  role: 'Software Developer',
  phone: '(801) 228-7578',
  email: 'cbh2000@gmail.com',
  schedule: '10 AM-9 PM, Mon-Sat',
  backgroundImage:
//      'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/the-spring-flowering-stachyurus-praecox-shrub-or-royalty-free-image-919659436-1544472182.jpg?crop=1.00xw:0.757xh;0,0.0711xh&resize=980:*',
      'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/red-flowers-1582569749.jpg?crop=1.00xw:0.752xh;0,0.248xh&resize=980:*',
//      'https://www.ftd.com/blog/content/uploads/2018/06/hero-green-flowers.jpg',
//      'https://image4.uhdpaper.com/wallpaper-hd/astronaut-outer-space-stars-planet-uhdpaper.com-hd-4.26.jpg', // This one is broken
//      'https://images8.alphacoders.com/468/468739.jpg',
);
