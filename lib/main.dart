import 'dart:async';

import 'package:kdigital_test/src/di/main_di_module.dart';
import 'package:kdigital_test/src/presentation/ui/character_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  runZonedGuarded(
    () {
      MainDIModule().configure(GetIt.I);
      runApp(const MyApp());
    },
    (error, stack) {
      print('Error zone - $error;\n$stack');
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test app',
      home: CharactersScreen(),
    );
  }
}
