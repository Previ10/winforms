import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CounterCubit(), child: const _CubitCounterView());
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  void increasedCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    // final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterCubit value) {
          return Text("cubit counter : ${value.state.transactionCount}");
        }),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                context.read<CounterCubit>().reset();
              },
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(child: BlocBuilder<CounterCubit, CounterState>(
        // buildWhen: (previous, current) => current.counter != previous.counter,
        builder: (context, state) {
          // print("counter cambio");
          return Text("Counter Value:  ${state.counter} ");
        },
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 1,
            child: const Text("+3"),
            onPressed: () => increasedCounterBy(context, 3),
          ),
          const SizedBox(height: 30),
          FloatingActionButton(
            heroTag: 2,
            child: const Text("+2"),
            onPressed: () => increasedCounterBy(context, 2),
          ),
          const SizedBox(height: 30),
          FloatingActionButton(
            heroTag: 3,
            child: const Text("+1"),
            onPressed: () => increasedCounterBy(context, 1),
          )
        ],
      ),
    );
  }
}