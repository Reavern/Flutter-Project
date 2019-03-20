import 'package:flutter/material.dart';
import 'provider.dart';
import 'bloc.dart';

class NextHomePage extends StatefulWidget {
  NextHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NextHomePageState createState() => _NextHomePageState();
}

class _NextHomePageState extends State<NextHomePage> {
  
  Bloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = Provider.of(context);
  }

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
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
              initialData: 0,
              stream: _bloc.counterValue,
              builder: (context, AsyncSnapshot<int> snapshot) {
                return Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
            FlatButton(child: Text("data"),onPressed: (){Navigator.pushNamed(context, '/');},),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _bloc.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    //_bloc.dispose();
    super.dispose();
  }
}
