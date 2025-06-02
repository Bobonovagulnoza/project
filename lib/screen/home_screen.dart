import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import '../bloc/event.dart';
import '../bloc/state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Foydalanuvchilar")),
      body: Center(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserInitial) {
              return ElevatedButton(
                onPressed: () {
                  context.read<UserBloc>().add(FetchUsersEvent());
                },
                child: Text("Foydalanuvchilarni yuklash"),
              );
            } else if (state is UserLoading) {
              return CircularProgressIndicator();
            } else if (state is UserLoaded) {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                  );
                },
              );
            } else if (state is UserError) {
              return Text("Xatolik: ${state.message}");
            } else {
              return Text("Noma'lum holat");
            }
          },
        ),
      ),
    );
  }
}
