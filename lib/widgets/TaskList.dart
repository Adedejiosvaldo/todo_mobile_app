import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo/main.dart';

class TaskLists extends StatefulWidget {
  const TaskLists({super.key});

  @override
  State<TaskLists> createState() => _TaskListsState();
}

class _TaskListsState extends State<TaskLists> {
  var listCount;

  Future<Map<String, dynamic>> fetchData() async {
    final response = await http
        .get(Uri.parse('https://task-manager-jfma.onrender.com/api/v1/tasks'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      Map<String, dynamic> data = json.decode(response.body);
      // print(da);
      listCount = data['tasks'].length;

      return data;
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              // Data loaded successfully
              Map<String, dynamic> data = snapshot.data as Map<String, dynamic>;
              return ListView.builder(
                  physics: ClampingScrollPhysics(),
                  itemCount: listCount,
                  itemBuilder: (context, index) {
                    List<dynamic> myMap = data['tasks'];

                    return Container(
                      // title: Text("${myMap[index]['name']}"),
                      child: ,
                    );
                    // }
                  });
            }
          }),
    );
  }
}
