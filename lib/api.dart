import 'dart:convert';

import 'package:http/http.dart' as http;

var jsonData;

Future apiList() async {
  var url = "https://reqres.in/api/users?page=2";
  final response = await http.get(Uri.parse(url), headers: {"accpet": "*/*"});
  if (response.statusCode == 200) {
    jsonData = jsonDecode(response.body.toString());
    print(jsonData);
  } else {
    jsonData = 0;
    print("Error");
  }
  return jsonData;
}
