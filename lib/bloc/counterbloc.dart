import 'dart:async';

enum CounterActions { increment, decrement, reset }

class CounterBloc {
  int counter = 0;
  final _stateStreamController = StreamController<int>();

  StreamSink get counterSink => _stateStreamController.sink;
  Stream get counterStream => _stateStreamController.stream;

  final _eventStateStream = StreamController<CounterActions>();

  StreamSink get counterEventSink => _eventStateStream.sink;
  Stream get counterEventStream => _eventStateStream.stream;

  CounterBloc() {
    counter = 0;
    counterEventStream.listen((event) {
      if (event == CounterActions.increment) {
        counter++;
      } else if (event == CounterActions.decrement) {
        counter--;
      } else if (event == CounterActions.reset) {
        counter = 0;
      }

      counterSink.add(counter);
    });
  }
}
