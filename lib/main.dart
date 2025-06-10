import 'package:flutter/material.dart';

import 'core/services/dependency_injection_instance.dart';
import 'features/main/presentation/screens/main_screen.dart';
import 'features/main/view/pages/main_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Elaro',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
