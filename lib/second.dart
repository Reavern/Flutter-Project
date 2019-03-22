import 'package:flutter/material.dart';
import 'provider.dart';
import 'bloc.dart';
import 'third.dart';

class SecondHomePage extends StatefulWidget {
  SecondHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SecondHomePageState createState() => _SecondHomePageState();
}

class _SecondHomePageState extends State<SecondHomePage> {
  
  Bloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = BlocProvider.of<Bloc>(context);
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
            FlatButton(
              child: Text("data"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ThirdHomePage(title: "Third",)));
              },
            )
            
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

}