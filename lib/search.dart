import 'package:flutter/material.dart';
import 'package:web_search/search_button.dart';

class SearcherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "hy-search",
        home: new Material(
            child: new Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage('images/bg1.jpeg'),
                      fit: BoxFit.cover),
                ),
                child: new Column(
                  children: <Widget>[
                    new SearchBar(),
                    new Expanded(
                        flex: 3,
                        child: new Container(
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                                    image: new AssetImage(
                                        'images/stackoverflow.png'))))),
                    new SearchButton(),
                    new Expanded(flex: 7, child: new Text(""))
                  ],
                ))));
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 50.0, // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.white10),
      // Row 是水平方向的线性布局（linear layout）
      child: new Row(
        //列表项的类型是 <Widget>
        children: <Widget>[
          // Expanded expands its child to fill the available space.
          new Expanded(
            child: new Text(""),
            flex: 5,
          ),
          new FlatButton(
            child: new Text("About", style: TextStyle(fontSize: 24)),
            onPressed: null,
          ),
          new Expanded(
            child: new Text(""),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
