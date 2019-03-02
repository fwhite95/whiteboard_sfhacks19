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

  Widget _onListButtonPressed(){
    return new Column(
      children: <Widget>[
        FloatingActionButton(
          onPressed: _controller.undo,
          child: const Icon(Icons.undo, size: 36.0,),
        ),
        FloatingActionButton(
          onPressed: _controller.clear,
          child: const Icon(Icons.clear, size: 36.0,),
        ),

      ],
    );
  }

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
      body: new Stack(
        children: <Widget>[
          Painter(_controller),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: _onListButtonPressed,
                    child: const Icon(Icons.add, size: 36.0,),
                  ),
                ],
              ),
            ),
          )
        ],
      )

    );
  }
  
}

