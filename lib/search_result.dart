import 'package:flutter/material.dart';
import 'package:web_search/search_button.dart';

class ResultPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ResultState();
}

class ResultState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "hy-search",
        home: new Material(
            child: new Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage('images/bg2.jpeg'),
                      fit: BoxFit.cover),
                ),
                child: new Column(
                  children: [
                    new Row(
                      children: [
                        new Expanded(child: new Text(""), flex: 1),
                        new FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: new Text("Back Home",
                                style: TextStyle(fontSize: 24))),
                        new Expanded(child: new Text(""), flex: 9)
                      ],
                    ),
                    new SearchButton(),
                    new Text(""),
                    new Text("search result of: heap. This is page 1",
                        style: TextStyle(fontSize: 24)),
                  ],
                ))));
  }
}

class ResultItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
