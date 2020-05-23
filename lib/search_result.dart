import 'package:flutter/material.dart';
import 'package:web_search/search_button.dart';

class ResultPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ResultState();
}

class ResultState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "hy-search",
        home: Material(
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/bg2.jpeg'), fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text(""), flex: 1),
                        FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Back Home",
                                style: TextStyle(fontSize: 24))),
                        Expanded(child: Text(""), flex: 9)
                      ],
                    ),
                    SearchButton(),
                    Text(""),
                    Text("search result of: heap. This is page 1",
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
