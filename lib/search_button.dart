import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        height: 50.0, // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(color: Colors.white),
        child: new ExampleWidget());
  }
}

/// Opens an [AlertDialog] showing what the user typed.
class ExampleWidget extends StatefulWidget {
  ExampleWidget({Key key}) : super(key: key);

  @override
  _ExampleWidgetState createState() => new _ExampleWidgetState();
}

/// State for [ExampleWidget] widgets.
class _ExampleWidgetState extends State<ExampleWidget> {
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("HY SEARCH   "),
          new Expanded(
              child: new TextField(controller: _controller, decoration: null)),
          new IconButton(
            icon: new Icon(Icons.search),
            onPressed: () {
              showDialog(
                context: context,
                child: new AlertDialog(
                  title: new Text('What you typed'),
                  content: new Text(_controller.text),
                ),
              );
            },
          ),
        ]);
  }
}
