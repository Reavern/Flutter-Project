import 'package:flutter/widgets.dart';
import 'bloc_interface.dart';

class BlocProvider<T extends BlocInterface> extends StatefulWidget {
  final T bloc;
  final Widget child;

  BlocProvider({Key key, @required this.child, @required this.bloc})
      : super(key: key);

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static Type _typeOf<T>() => T;

  @override
  bool updateShouldNotify(_) => true;

  static T of<T extends BlocInterface>(BuildContext context) {
    final type = _typeOf<BlocProvider<T>>();
    BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }
}

class _BlocProviderState<T> extends State<BlocProvider<BlocInterface>> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
