import 'package:flutter/material.dart';
import 'provider.dart';
import 'bloc.dart';
import 'second.dart';

class FirstHomePage extends StatefulWidget {
  FirstHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FirstHomePageState createState() => _FirstHomePageState();
}

class _FirstHomePageState extends State<FirstHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("data"),
              onPressed: () {
                // Navigator.pushNamed(context, '/2');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SecondHomePage(
                                title: "Second",
                              )
                    )
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
