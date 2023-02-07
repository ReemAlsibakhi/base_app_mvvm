import 'package:flutter/material.dart';
import 'package:mvvm_design_patttern/view/PhotoScreen.dart';
import 'package:mvvm_design_patttern/view_model/PhotosVM.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Notes",
        home: ChangeNotifierProvider(
          create: (context) => PhotoListVM(),
          child: PhotoScreen(),
        ));
  }
}
