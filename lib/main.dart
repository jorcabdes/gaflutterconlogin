import 'package:flutter/material.dart';
import 'package:gaflutter/config/router/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'package:gaflutter/injection.dart';
import 'package:gaflutter/blocs/tasks/tasks_bloc.dart'; 
import 'package:gaflutter/blocs/tasks/tasks_event.dart';// Import your TasksBloc


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  injectDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) {
          TasksBloc tasksBloc = getIt<TasksBloc>();
          tasksBloc.add(LoadTasksEvent());
          tasksBloc.add(StreamTasksEvent());
          return tasksBloc;
        }),
      ],
    child: MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Comarcas',
        )
      );
  }
}