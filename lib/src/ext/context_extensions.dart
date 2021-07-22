import 'package:bredux/src/bloc/bredux.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension ContextStateBloc on BuildContext {
  Bredux<S> bredux<S>() => read<Bredux<S>>();

  S stateValue<S>() => bredux<S>().state;
  SubS stateSubValue<S, SubS>(SubS Function(S state) mapper) => mapper(stateValue<S>());

  Stream<S> stateStream<S>() => bredux<S>().stream;
  Stream<SubS> stateSubStream<S, SubS>(SubS Function(S state) mapper) => stateStream<S>().map(mapper);

  void stateReplace<S>(S appState) => bredux<S>().replace(appState);
  void stateUpdate<S>(S Function(S appState) stateUpdater) => bredux<S>().update(stateUpdater);
}
