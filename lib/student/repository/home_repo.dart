import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:schedular_application/student/Model/Model1.dart';



class HomeRepo {
  static Future<List<Model1>> HomeRepoFetchEvent() async {
    var client = http.Client();
    List<Model1> student = [];
    try {
      print(1);
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      //String jsonData = await rootBundle.loadString('assets/data.json');
      List result = jsonDecode(response.body);
      print(student);
      //List<dynamic> result = jsonDecode(jsonData);
      //print(result);
      for (int i = 0; i < result.length; i++) {
        Model1 examinar =
        Model1.fromJson(result[i] as Map<String, dynamic>);
        student.add(examinar);
      }
      print(student);
      return student;
    } finally {
      client.close();
    }
  }
}

// class HomeRepo {
//   List<Model1> abc=[];
//   Future <List<Model1>> getApi() async{
//     final responce =await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
//     var data=jsonDecode(responce.body.toString());
//     if(responce.statusCode==200)
//     {
//       for(var index in data)
//       {
//         abc.add(Model1.fromJson(index));
//       }
//       return abc;
//     }
//     else
//     {
//       return abc;
//     }
//   }
// }