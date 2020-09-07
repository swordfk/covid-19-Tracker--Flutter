import 'package:flutter/material.dart';
import 'package:flutter_covid19/dataSource.dart';

import 'HomePage.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Circula',
      primaryColor: primaryBlack
    ),
    home: HomePage(),
  ));
}
