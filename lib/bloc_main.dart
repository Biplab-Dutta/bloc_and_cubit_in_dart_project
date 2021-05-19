import 'package:bloc/bloc.dart';

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);
  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;
      case CounterEvent.decrement:
        yield state - 1;
        break;
    }
    throw UnimplementedError();
  }
}

void main() async {
  final bloc = CounterBloc();
  final streamSubs = bloc.stream.listen(print);

  bloc.add(CounterEvent.increment); //1
  bloc.add(CounterEvent.increment); //2
  bloc.add(CounterEvent.decrement); //1
  bloc.add(CounterEvent.increment); //2
  bloc.add(CounterEvent.decrement); //1

  await Future.delayed(Duration.zero);
  await streamSubs.cancel();
  await bloc.close();
}
