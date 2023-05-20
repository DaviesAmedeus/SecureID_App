import 'package:flutter/material.dart';
import 'package:secure_id_app/constants/constants.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'homescreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Text('Not Yet Implemented', style: kDefaultTextStyle.copyWith(color: Colors.white70),),
          ),

        ),
    );
  }
}
