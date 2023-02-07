import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:helocheck/Screens/components/function.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String url = 'https://api.github.com/users';
  // ignore: prefer_typing_uninitialized_variables
  var data;
  String output = '';
  String ch = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                onChanged: (value) {
                  url = 'https://ascii-value-api.onrender.com/api?query=$value';
                  ch = value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter any Character',
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 243, 124, 33)),
              ),
              onPressed: () async {
                data = await fetchData(url);
                data = jsonDecode(data);
                setState(() {
                  output = data['output'];
                });
              },
              child: const Text('Fetch Ascii Value'),
            ),
            const SizedBox(height: 20),
            Text(
              output == '' ? '' :"Ascii value of $ch : $output",
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
