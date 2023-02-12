import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/screens/cubit/home_cubit.dart';
import 'package:mobile_app/screens/home3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Mobile App',
      home: BlocProvider<HomeCubit>(
        create: (context) => HomeCubit(),
        child: Home3(),
      ),
    );
  }
}
