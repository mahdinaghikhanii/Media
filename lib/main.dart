import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'helper/get_di.dart' as di;
import 'views/chat/chat.dart';

Future<void> main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.grey,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
          useMaterial3: true,
        ),
        home: ChatPage());
  }
}
