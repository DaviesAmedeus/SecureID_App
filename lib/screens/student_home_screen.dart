import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:secure_id_app/constants/constants.dart';

import '../api/api_services.dart';

class StudentHomeScreen extends StatefulWidget {
  // static String id = 'student_homescreen';

  String? username, password, token;



  StudentHomeScreen({this.username, this.password, this.token});

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  bool isFrontSide = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '${widget.username}',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: kBlackColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.logout_rounded),
            tooltip: 'Logout',
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),

              ///The Logo
              Center(
                child: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 20, 20, 22),
                  radius: 80,
                  child: Image.asset('images/Qr_id.png'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              ///The Container Card
              Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  // color: Color.fromARGB(255, 81, 79, 86),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 81, 79, 86),
                      // blurRadius: 1,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CircleAvatar(
                              radius: 40,
                              child: GestureDetector(
                                onTap: () {
                                  fetchStudentInfo(context);
                                  // _view_ID_Dialog(context);

                                },
                                child: const Icon(
                                  Icons.visibility,
                                  size: 50,
                                  color: kBlackColor,
                                ),
                              ),
                            )),
                        const Text(
                          'View ID',
                          style: TextStyle(
                              color: kPaleWhiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CircleAvatar(
                              child: GestureDetector(
                                onTap: () {
                                  print('=====REQUESTING ID=====');
                                  _request_ID_Instructions_Dialog(context);
                                },
                                child: const Icon(
                                  Icons.add_card,
                                  size: 50,
                                  color: kBlackColor,
                                ),
                              ),
                              radius: 40,
                            )),
                        const Text(
                          'Reques ID',
                          style: TextStyle(
                              color: kPaleWhiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'NIT',
                      style: kLargeTextStyle.copyWith(color: kGreenColor),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      'SECURED',
                      style: kMediumTextStyle.copyWith(color: kGreenColor),
                    ),
                    const SizedBox(
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
            ],
          ),
        ),
      ),
    );
  }

  ///---- DIALOG FUNCTIONS -------

  void _view_ID_FrontSideDialog(BuildContext context, var student_credentials) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(


            // title: Text('Identity Card'),
            content: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  // color: Colors.black,
                  child: Center(
                    child: Column(children: [
                      OurIdText(
                        title: 'NATIONAL INSTITUTE OF TRANSPORT', fontWeight: FontWeight.bold, textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      OurIdText(
                        title: 'STUDENT IDENTITY CARD', fontWeight: FontWeight.bold, textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        'images/IMG-20221231-WA0009_1.jpg',
                        scale: 3,
                      ),
                    ]),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 250,
                  // color: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OurIdText(
                        title: 'Programme:', fontWeight: FontWeight.bold, textAlign: TextAlign.start,
                      ),
                      OurIdText(
                        title: '${student_credentials['programme']}',  textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 10,),
                      OurIdText(
                        title: 'Name:', fontWeight: FontWeight.bold, textAlign: TextAlign.start,
                      ),
                      OurIdText(
                        title: '${student_credentials['name']}',  textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 10,),
                      OurIdText(
                        title: 'Registration Number:', fontWeight: FontWeight.bold,  textAlign: TextAlign.start,
                      ),
                      OurIdText(
                        title: '${student_credentials['student_code']}',  textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 10,),
                      OurIdText(
                        title: 'Signature:', fontWeight: FontWeight.bold,  textAlign: TextAlign.start,
                      ),
                      OurIdText(
                        title: '${student_credentials['signature']}',  textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 10,),
                      OurIdText(
                        title: 'Exp_Date:', fontWeight: FontWeight.bold,  textAlign: TextAlign.start,
                      ),
                      OurIdText(
                        title: '${student_credentials['exp_date']}',  textAlign: TextAlign.start, color: Colors.pinkAccent,
                      ),

                      // Text('REG#: ${student_credentials['student_code']}'),
                      // Text('Signature: ${student_credentials['signature']}'),
                      // Text('EXP DATE: ${student_credentials['signature']}'),
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  print('+++++++++++++FRONT SIDE TURNED+++++++++++++++++++++');
                  print(isFrontSide);
                  print('++++++++++++++++++++++++++++++++++');

                  if(isFrontSide == true){
                    setState(() {
                      isFrontSide = !isFrontSide;
                    });
                    _view_ID_BackSideDialog(context);
                  }
                  print('+++++++++++++FRONT SIDE TURNED+++++++++++++++++++++');
                  print(isFrontSide);
                  print('++++++++++++++++++++++++++++++++++');
                  Navigator.pop(context);


                },
                child: const Text('View Back'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Perform printing action
                  Navigator.pop(context);
                },
                child: const Text('Print'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Perform cancel action
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
            ],
          );
        });
  }

  void _view_ID_BackSideDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(


            // title: Text('Identity Card'),
            content: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  // color: Colors.black,
                  child: Center(
                    child: Column(children: [
                      OurIdText(
                        title: 'National Institute of Transport', fontWeight: FontWeight.bold, textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      OurIdText(
                        title: 'Official Student Identification', fontWeight: FontWeight.bold, textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        'images/IMG-20221231-WA0009_1.jpg',
                        scale: 3,
                      ),
                    ]),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 250,
                  // color: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OurIdText(
                        title: '1. This is an institute property and not transferable', fontWeight: FontWeight.bold, textAlign: TextAlign.start,
                      ),
                      OurIdText(
                        title: '1. This is an institute property and not transferable', fontWeight: FontWeight.bold, textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 10,),
                      OurIdText(
                        title: 'Name:', fontWeight: FontWeight.bold, textAlign: TextAlign.start,
                      ),
                      OurIdText(
                        title: '1. This is an institute property and not transferable', fontWeight: FontWeight.bold, textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 10,),
                      OurIdText(
                        title: 'Registration Number:', fontWeight: FontWeight.bold,  textAlign: TextAlign.start,
                      ),
                      OurIdText(
                        title: '1. This is an institute property and not transferable', fontWeight: FontWeight.bold, textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 10,),
                      OurIdText(
                        title: 'Signature:', fontWeight: FontWeight.bold,  textAlign: TextAlign.start,
                      ),


                      // Text('REG#: ${student_credentials['student_code']}'),
                      // Text('Signature: ${student_credentials['signature']}'),
                      // Text('EXP DATE: ${student_credentials['signature']}'),
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  // Perform printing action
                  // Navigator.pop(context);
                  setState(() {
                    isFrontSide = !isFrontSide;
                    print('+++++++++++++FRONT SIDE TURNED+++++++++++++++++++++');
                    print(isFrontSide);
                    print('++++++++++++++++++++++++++++++++++');

                  });
                },
                child: const Text('View Back'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Perform printing action
                  Navigator.pop(context);
                },
                child: const Text('Print'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Perform cancel action
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
            ],
          );
        });
  }

  void _request_ID_Instructions_Dialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Instructions'),
            content: Column(
              mainAxisSize:
                  MainAxisSize.min, // Reduce the vertical size of the column
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Here are steps to follow:',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('1. You should purchase control number for loss report.'),
                SizedBox(
                  height: 10,
                ),
                Text('2. Upload a loss report.'),
                SizedBox(
                  height: 10,
                ),
                Text('3. Pay control number for new ID.'),
              ],
            ),
            actions: [
              ButtonBar(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Perform next action
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Perform cancel action
                      Navigator.pop(context);
                      _control_Number_Dialog(context);
                    },
                    child: const Text('Next'),
                  ),
                ],
              ),
            ],
          );
        });
  }

  void _control_Number_Dialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Control Number'),
            content: Column(
              mainAxisSize:
                  MainAxisSize.min, // Reduce the vertical size of the column
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Your control number is  B11122. Pay 10,000/= to get loss report',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black54),
                ),
              ],
            ),
            actions: [
              ButtonBar(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Perform next action
                      Navigator.pop(context);
                      _request_ID_Instructions_Dialog(context);
                    },
                    child: const Text('Back'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Perform cancel action
                      Navigator.pop(context);
                      _control_Number_Payment_Dialog(context);
                    },
                    child: const Text('Pay'),
                  ),
                ],
              ),
            ],
          );
        });
  }

  void _control_Number_Payment_Dialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Control Number Payment'),
            content: Column(
              mainAxisSize:
                  MainAxisSize.min, // Reduce the vertical size of the column
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Payment Successful! \n \nYour Registration Number is: \n NIT/BIT/2020/1214 \n\nPlease visit the registration office to pick up your hard copy ID',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black54),
                ),
              ],
            ),
            actions: [
              ButtonBar(
                children: [
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // Perform next action
                  //     Navigator.pop(context);
                  //     _request_ID_Instructions(context);
                  //   },
                  //   child: const Text('Back'),
                  // ),
                  ElevatedButton(
                    onPressed: () {
                      // Perform cancel action
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            ],
          );
        });
  }

  ///FUNCTIONS CALLING API
  void fetchStudentInfo(BuildContext context) async {
    String studentCode = '${widget.username!.replaceAll('/', '_')}';
    print(
        '----------------------PRINTING STUDENT CODE-------------------------------\n \n \n');
    print('${studentCode}');
    print(
        '\n \n \n--------------------------------------------------------------------');

    var res = await ApiServices()
        .authenticatedGetRequest('/cardDetails/$studentCode/');

    var body = jsonDecode(res.body);
    print(
        '----------------------PRINTING BODY CONTENTS-------------------------------\n \n \n');
    print('${body.toString()}');

    print(
        '\n \n \n -----------------------------------------------------------------');

    _view_ID_FrontSideDialog(context, body);
  }
}

class OurIdText extends StatelessWidget {
  String? title;
  double? fontsize;
  TextAlign? textAlign;
  FontWeight? fontWeight;
  Color? color;

  OurIdText({
    required this.title,
    this.fontsize,
    this.textAlign,
    this.fontWeight,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title",
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: fontWeight,
        color: color
      ),
      textAlign: textAlign,
    );
  }
}
