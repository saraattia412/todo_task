import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/features/random/presentation/cubit/cubit.dart';
import 'package:todo_task/features/random/presentation/views/todo_screen.dart';
import 'bloc_observer.dart';
import 'features/themes/app_themes.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();//import use with async
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => ToDoCubit()..getData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
        home: TodoScreen() ,
      ),
    );
  }
}

