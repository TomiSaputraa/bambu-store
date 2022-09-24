import 'package:flutter/material.dart';
import 'package:test_app/datas/repositories/product_repo.dart';

import 'bloc/bloc_imports.dart';
import 'presentations/pages/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.black),
      ),
      home: RepositoryProvider(
        create: (context) => ProductRepository(),
        child: const HomePage(),
      ),
    );
  }
}
