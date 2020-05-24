import 'package:flutter/material.dart';
import 'package:web_search/search_button.dart';

class SearcherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "hy-search",
        home: Material(
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/bg1.jpeg'), fit: BoxFit.cover),
                ),
                child: Column(
                  children: <Widget>[
                    SearchBar(),
                    Expanded(
                        flex: 3,
                        child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'images/stackoverflow.png'))))),
                    Text("Help you search question in stackoverflow",
                        style: TextStyle(fontSize: 20)),
                    Text(""),
                    SearchButton(0.45),
                    Expanded(flex: 7, child: Text(""))
                  ],
                ))));
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0, // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.white10),
      // Row 是水平方向的线性布局（linear layout）
      child: Row(
        //列表项的类型是 <Widget>
        children: <Widget>[
          // Expanded expands its child to fill the available space.
          Expanded(
            child: Text(""),
            flex: 5,
          ),
          FlatButton(
            child: Text("About", style: TextStyle(fontSize: 24)),
            onPressed: null,
          ),
          Expanded(
            child: Text(""),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
