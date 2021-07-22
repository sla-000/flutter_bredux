import 'package:bredux/src/bloc/bredux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreduxProvider<S> extends StatelessWidget {
  const BreduxProvider({
    Key? key,
    required this.initialState,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final S initialState;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<Bredux<S>>(
      create: (_) => Bredux<S>(initialState: initialState),
      child: child,
    );
  }
}
