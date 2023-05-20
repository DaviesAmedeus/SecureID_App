import 'package:flutter/material.dart';
import 'package:secure_id_app/constants/constants.dart';
import 'package:secure_id_app/screens/home_screen.dart';

class GetStartedScreen extends StatelessWidget {
  static String id = '/getStartedScreen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              Center(
                child: CircleAvatar(
                  backgroundColor: kPaleBlackColor,
                  radius: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset('images/google_logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 34),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'NIT',
                      style: kLargeTextStyle.copyWith(color: kGreenColor),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      'SECURED',
                      style: kMediumTextStyle.copyWith(color: kGreenColor),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      'ID CARD',
                      style: kMediumTextStyle.copyWith(
                          color: kPaleWhiteColor, letterSpacing: 1.5),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                  width: 300,
                  height: 60,
                  // color: Colors.blueGrey,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, HomeScreen.id);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPaleBlackColor,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          side: BorderSide(
                            color: kPaleBlackColor,
                          )),
                    ),
                    child: Text(
                      'GET STARTED',
                      style: kDefaultTextStyle.copyWith(
                          color: kGreenColor, letterSpacing: 2),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
