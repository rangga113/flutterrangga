import 'package:backend_rpl/cubit/create_users/create_user_cubit.dart';
import 'package:backend_rpl/repository/auth_repository.dart';
import 'package:backend_rpl/screen/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreateUserCubit(AuthRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const AuthScreen(),
      ),
    );
  }
}