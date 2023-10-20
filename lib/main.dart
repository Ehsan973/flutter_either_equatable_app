import 'package:either_equatable_app/test.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Application());
}

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
      ),
    );
  }
}
