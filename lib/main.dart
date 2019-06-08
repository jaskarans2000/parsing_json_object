import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async{
  List _data= await getJSON();


  runApp(
    new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("JSON Parsing"),
          backgroundColor: Colors.orange,
          centerTitle: true,
        ),
        body: new ListView.builder(
            itemCount: _data.length,
            itemBuilder: (BuildContext context, int position){
              return new Column(
                children: <Widget>[
                  Divider(height: 4.0,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                      title: new Text(_data[position]["title"],
                      style: new TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      subtitle: new Text(_data[position]["body"]),
                        leading: new CircleAvatar(
                          backgroundColor: Colors.orange,
                          child: new Text(_data[position]["title"][0]),
                        ),onTap: ()=> showMessage( context, position),
                  ),
                    ),

                ],
              );
            }),
      ),
    )
  );
}

showMessage( BuildContext context, int position) {
  AlertDialog alertDialog=new AlertDialog(
    title: Text("Alert!"),
    actions: <Widget>[

      FlatButton(
        child: Text("okay!"),
        onPressed: ()=> Navigator.of(context).pop(),
      ),
    ],
  );
  showDialog(context: context,builder: (context){
    return alertDialog;
  });
}
Future<List> getJSON() async{
  String apiURL="https://jsonplaceholder.typicode.com/posts";
  http.Response  response= await http.get(apiURL);
  return json.decode(response.body);
}