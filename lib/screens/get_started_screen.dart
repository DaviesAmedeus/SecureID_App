import 'package:flutter/material.dart';
class GetStartedScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'First Time Here?',
            ),
            Text(
              'WELCOME',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
