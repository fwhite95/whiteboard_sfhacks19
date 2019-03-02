import 'package:flutter/material.dart';
import 'package:painter/painter.dart';
import 'dart:typed_data';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

//void main() => runApp(new WhiteBoardApp());

class WhiteBoardApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: ('Whiteboard Test'),
      home: new WhiteBoardPage(),
    );
  }
}

class WhiteBoardPage extends StatefulWidget{
  @override
  _WhiteBoardPageState createState() => new _WhiteBoardPageState();

}

class _WhiteBoardPageState extends State<WhiteBoardPage>{
  PainterController _controller;
  bool _finished;

  @override
  void initState(){
    super.initState();
    _finished = false;
    _controller = _newController();
  }
  
  PainterController _newController(){
    PainterController controller=new PainterController();
    controller.thickness=3.0;
    controller.backgroundColor=Colors.white;
    return controller;
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: const Text('Painter'),
        
      ),
      body: new Center(

        child: new Painter(_controller),),

    );
  }
  
}