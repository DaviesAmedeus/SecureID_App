import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices{

  // final String url = 'https://reqres.in/';

  login(data) async {

    final url = Uri.parse('https://reqres.in/api/login');
      try{
        final response = await http.post(
            url,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(data)
        );


        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);
          final token = jsonData['token'];

          print('Login successful!');
          print('Token: $token');
        } else {
          print('>>>>Login failed with status: ${response.statusCode}');
        }
      } catch (error) {
        print('>>>>>>>Error occurred while logging in: $error');
      }





  }


}