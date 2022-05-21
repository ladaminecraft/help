import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab_32/repository/user_repository.dart';


import 'bloc/bloc.dart';
import 'bloc/event.dart';
import 'dashboard_page.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepository(),
      child: BlocProvider(
        create: (context) => DashboardBloc(
          userRepository: RepositoryProvider.of<UserRepository>(context),
        )..add(InitUserBox()),
        child: const MaterialApp(
          home: DashboardPage(),
        ),
      ),
    );
  }
}