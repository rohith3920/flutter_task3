import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './home.dart';

class Login2 extends StatefulWidget {
  final String fullname;
  const Login2({super.key, required this.fullname});

  @override
  State<Login2> createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  final _formKey = GlobalKey<FormState>();
  List<Home> home = [];

  late String fullname;
  void initState() {
    super.initState();
    fullname = widget.fullname;
  }

  TextEditingController enterId = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 16, left: 20, right: 20),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.view_headline),
                  Icon(Icons.chat_outlined),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    'Good Morning ${fullname}!',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    'Lorem ipsum dolor sit amet, consetetur',
                    style: TextStyle(color: Colors.black26),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: enterId,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) {
                      getData(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter Id',
                      labelStyle: TextStyle(color: Colors.black26),
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      isDense: true,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                child: FutureBuilder(
                    // future: getData(String enterId),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          // itemCount: 4,
                          itemCount: home.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 350,
                                height: 170,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black38,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 10),
                                      child: Text('title'),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 10),
                                      child: Text('${home[index].title}'),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 10),
                                      child: Text('id'),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 10),
                                      child: Text('${home[index].id}'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<List<Home>> getData(String enterId) async {
    UserModel1? user;
    Home? filter;
    List<Home> homes = [];
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/$enterId'));
    

    if (response.statusCode == 200) {
      if (enterId == '') {
        var data = jsonDecode(response.body.toString());
        for (Map<String, dynamic> index in data) {
          home.add(Home.fromJson(index));
        }
        return home;
      } else {
        user = userModel1FromJson(response.body);
        filter=(id:user.id,title:user.title,completed:user.completed) as Home?;
        homes.add(filter!);
        return homes;
      }
    } else {
      return home;
    }
  }
}
