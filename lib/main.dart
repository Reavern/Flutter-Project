import 'package:flutter/material.dart';

import 'first.dart';
import 'provider.dart';

import 'bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocProvider<Bloc>(
      bloc: Bloc(),
      child: MaterialApp(
        title: 'Flutter Testing',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FirstHomePage(title: 'First',),
      )
    );

  }
}