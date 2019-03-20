import 'package:flutter/material.dart';
import 'provider.dart';
import 'my_home.dart';
import 'next.dart';

void main() => runApp(MyApp());

final routes = <String, WidgetBuilder> {
    '/': (BuildContext context) =>  MyHomePage(title: 'Home'),
    '/test': (BuildContext context) => NextHomePage(title: 'Next',),
  };

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(child: MaterialApp(
        title: 'Flutter Testing',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: routes,
      ),);
  }
}