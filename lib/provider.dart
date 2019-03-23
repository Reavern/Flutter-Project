import 'package:flutter/widgets.dart';
import 'bloc_interface.dart';

class BlocProvider<T extends BlocInterface> extends StatefulWidget {
  final T bloc;
  final Widget child;

  BlocProvider({Key key, this.child, @required this.bloc}) : super(key: key);

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static Type _typeOf<T>() => T;

  BlocProvider<T> toTree(Widget child) {
    return BlocProvider<T>(
      child: child,
      bloc: bloc,
    );
  }

  @override
  bool updateShouldNotify(_) => false;

  static T of<T extends BlocInterface>(BuildContext context) {
    final type = _typeOf<BlocProvider<T>>();
    BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }
}

class _BlocProviderState<T> extends State<BlocProvider<BlocInterface>> {
  @override
  Widget build(BuildContext context) {
    return widget.child ?? Container();
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}

class BlocProviderTree extends StatelessWidget {
  final List<BlocProvider> blocProviders;
  final Widget child;

  BlocProviderTree({@required this.blocProviders, @required this.child});

  @override
  Widget build(BuildContext context) {
    Widget tree = child;
    for (final blocProvider in blocProviders.reversed) {
      tree = blocProvider.toTree(tree);
    }

    return tree;
  }
}
