import 'package:bloc_counter_app/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _controller ;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Counter Bloc'),
        ),
        body: BlocConsumer<CounterBloc, CounterState>(
          builder: (context, state) {
           final invalidValue = (state is CounterStateInValid) ? state.inValidValue : '' ;
            return Column(
              children: [
                Text('Current value is => ${state.value}'),
                Visibility(
                  visible: state is CounterStateInValid,
                  child: Text('Invalid input : $invalidValue'),
                  ),
                  TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Enter Number Here',
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(DecrementEvents(_controller.text)); 
                        }, 
                        child: const Text('_'),
                        ),
                      TextButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(IncrementEvents(_controller.text));
                        }, 
                        child: const Text('+'),
                        ),
                    ],
                  )
              ],
            );
          }, 
          listener: (context, state) {
            _controller.clear();
          }
          ),
      ),
    );
  }
}