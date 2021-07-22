import 'dart:async';

import 'package:bredux/src/bloc/event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Bredux<S> extends Bloc<UpdateEvent<S>, S> {
  Bredux({
    required S initialState,
  }) : super(initialState);

  void replace(S state) => add(UpdateEvent<S>(state));

  void update(S Function(S state) stateUpdater) => replace(stateUpdater(state));

  @override
  Stream<S> mapEventToState(UpdateEvent<S> event) async* {
    yield event.state;
  }
}
