import 'package:flutter/material.dart';
import 'provider.dart';
import 'bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Bloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = Provider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    Firestore.instance.collection('users').snapshots().listen((onData) {
      onData.documents.forEach((f) => print(f['name']));
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: StreamBuilder(
          stream: _bloc.nameList(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.data != null) {
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(snapshot.data.documents[i]['name']),
                  );
                },
              );
            }
            return Text("No Data");
          },
        ),
      ),
    );
  }
}
