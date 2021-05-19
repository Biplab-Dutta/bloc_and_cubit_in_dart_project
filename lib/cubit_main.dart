import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

void main() async {
  final cubit = CounterCubit();
  final streamSubs = cubit.stream.listen(print);
  cubit.increment(); //1
  cubit.increment(); //2
  cubit.increment(); //3
  cubit.decrement(); //2
  cubit.decrement(); //1

  await Future.delayed(Duration.zero);
  await streamSubs.cancel();
}
