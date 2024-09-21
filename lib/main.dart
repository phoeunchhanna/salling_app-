
import 'package:cart_app/screen/product_list.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => MyApp(),
       enabled: true,
       tools:const [
          ...DevicePreview.defaultTools,
       ],
    ),
    
  );
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  ProductListPage(),
    );
  }
}
