import 'package:flutter/material.dart';

List splashData = [
    {
      "text":
          "Welcome to Our App, It's Our App!\nYou are always assured of a pleasant welcome.",
      "image": "assets/b1.png"
    },
    {
      "text":
          "Try working in an adjective to describe\n the quality of your welcome more fully.",
      "image": "assets/b2.png"
    },
    {
      "text":
          "It's gratifying to look around and see so many familiar faces.This is feel-good central and we aim ",
      "image": "assets/b3.png"
    },
  ];

  BoxDecoration xdeco = BoxDecoration(boxShadow: [
  BoxShadow(
      color: Colors.blue.shade100,
      spreadRadius: 1,
      blurRadius: 10,
      offset: const Offset(0, 5)),
], color: Colors.grey.shade50, border: Border.all(color: Colors.blue.shade300));
 List jobs = [
    'Flutter Developer',
    'Training Coordinator',
    'Python Developer',
    'Django Developer',
    'IT Specialist',
    'Backend Developer',
    'Frontend Developer',
    'Native Developer',
    'Node Js Developer',
    'Java Developer',
  ];

   List items = [
    'HR',
    'Marketing',
    'Customer Service',
    'Supply chain',
    'Business modeling ',
    'Finance technology',
    'Sales',
    'Digital Marketing',
  ];
  extension DateTimeExtension on DateTime {
  DateTime applied(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute);
  }
}