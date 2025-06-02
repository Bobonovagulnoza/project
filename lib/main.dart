import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/screen/home_screen.dart';

import 'bloc/bloc.dart';
import 'data/network/doi.dart';
import 'data/repositorys/user_repository.dart';

void main() {
  final dioClient = DioClient();
  final userRepository = UserRepository(dioClient: dioClient);

  runApp(MyApp(userRepository: userRepository));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  const MyApp({super.key, required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => UserBloc(userRepository),
        child: HomeScreen(),
      ),
    );
  }
}
