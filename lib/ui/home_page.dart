import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;
  int _offSet = 0;

  Future<Map> _getGifs() async{
    http.Response response;
    if(_search == null){
      response = await http.get("https://api.giphy.com/v1/gifs/trending?api_key=29hEJBnuzGk81hdIyB1J4Uc6qQ3DB8Gb&limit=20&rating=g");
    }else{
      response = await http.get("https://api.giphy.com/v1/gifs/search?api_key=29hEJBnuzGk81hdIyB1J4Uc6qQ3DB8Gb&q=$_search&limit=25&offset=$_offSet&rating=g&lang=en");
    }
    return json.decode(response.body);
  }


  @override
  void initState() {
    super.initState();
    _getGifs().then((map) => print(map));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network("https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
              labelText: "Pesquise aqui",
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            ),
            style: TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        )
      ],),

    );
  }
}
