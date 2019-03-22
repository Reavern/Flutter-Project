import 'package:rxdart/rxdart.dart';
import 'bloc_interface.dart';

class Bloc extends BlocInterface {

  int counter = 0;


  final _counterController = BehaviorSubject<int>();

  Function(int) get changeCounter => _counterController.sink.add;

  Observable<int> get counterValue => _counterController.stream;

  void increment() { changeCounter(++counter); }

  void dispose() {
    _counterController?.close();
  }
}