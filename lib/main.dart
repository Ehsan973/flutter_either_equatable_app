import 'package:either_equatable_app/bloc/home_bloc.dart';
import 'package:either_equatable_app/bloc/home_event.dart';
import 'package:either_equatable_app/bloc/home_state.dart';
import 'package:either_equatable_app/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => HomeBloc(),
        child: EquatableScreen(),
      ),
    );
  }
}

class EitherScreen extends StatefulWidget {
  const EitherScreen({
    super.key,
  });

  @override
  State<EitherScreen> createState() => _EitherScreenState();
}

class _EitherScreenState extends State<EitherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              var either = sendDataRequest(1);
              either.fold((messageError) {
                print(messageError);
              }, (response) {
                response.forEach(
                  (element) {
                    print(element);
                  },
                );
              });
            },
            child: const Text('Click me!'),
          ),
        ),
      ),
    );
  }
}

class EquatableScreen extends StatelessWidget {
  const EquatableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<HomeBloc>(context).add(ClickEvent());
                },
                child: const Text('Click Me!'),
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is InitHome) {
                    return const Text('0');
                  } else if (state is UpdateHome) {
                    print('Doing the job...');
                    return Text('${state.x}');
                  } else {
                    return const Text('Error');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
