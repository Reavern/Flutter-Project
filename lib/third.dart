import 'package:flutter/material.dart';
import 'provider.dart';
import 'bloc.dart';

class ThirdHomePage extends StatefulWidget {
  ThirdHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ThirdHomePageState createState() => _ThirdHomePageState();
}

class _ThirdHomePageState extends State<ThirdHomePage> {
  
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
