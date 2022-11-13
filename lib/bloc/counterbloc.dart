import 'dart:async';

class CounterBloc {
  final _stateStreamController = StreamController<int>();

  StreamSink get counterSink => _stateStreamController.sink;
  Stream get counterStream => _stateStreamController.stream;
}
