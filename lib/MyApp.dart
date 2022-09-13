import 'package:flutter/material.dart';
import 'ImageGrid.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ImageGrid(),
        backgroundColor: Colors.black,
      ),
    );
  }
}
