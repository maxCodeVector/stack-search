import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web_search/answer_page.dart';
import 'package:web_search/search_button.dart';
import 'package:dio/dio.dart';

class ResultPage extends StatefulWidget {
  final String searchText;
  final List<dynamic> initResultList;

  const ResultPage({Key key, this.searchText, this.initResultList})
      : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      ResultState(searchText, initResultList);
}

class ResultState extends State<ResultPage> {
  String searchText;
  int currentPageIndex = 1;
  List<dynamic> currResultList;

  ResultState(this.searchText, this.currResultList);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "hy-search",
        home: Material(
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/bg2.jpg'), fit: BoxFit.cover),
                ),
                child: Row(children: [
                  Expanded(flex: 3, child: Align()),
                  Expanded(
                      flex: 6,
                      child: Column(children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Back Home",
                                  style: TextStyle(fontSize: 18))),
                        ),
                        Expanded(child: _buildResult())
                      ])),
                  Expanded(flex: 3, child: Text("")),
                ]))));
  }

  Widget _buildResult() {
    return Column(children: [
      SearchButton(0.35, queryText: this.searchText,
          function: (BuildContext currContext, String text) async {
        var resultList = await queryFromSearcher(text);
        currResultList = resultList;
        setState(() {
          this.searchText = text;
        });
      }),
      Center(
        child: Row(children: [
          Text(
              (currResultList == null
                      ? "0"
                      : currResultList.length.toString()) +
                  " search result of: " +
                  this.searchText,
              style: TextStyle(fontSize: 20)),
          Expanded(child: Align()),
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              if (currentPageIndex <= 1) {
                return;
              }
              setState(() {
                this.currentPageIndex--;
              });
            },
          ),
          Text(currentPageIndex.toString()),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              if (this.currResultList == null ||
                  currentPageIndex * 10 > currResultList.length) {
                return;
              }
              setState(() {
                this.currentPageIndex++;
              });
            },
          )
        ]),
      ),
      Expanded(child: _buildResultList())
    ]);
  }

  Widget _buildResultList() {
    if (currResultList != null && currResultList.length != 0) {
      int resultLen = currResultList.length;
      return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: min(resultLen, 10),
          padding: const EdgeInsets.all(16.0),
          // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
          // 在偶数行，该函数会为单词对添加一个ListTile row.
          // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
          // 注意，在小屏幕上，分割线看起来可能比较吃力。
          itemBuilder: (context, i) {
            int offset = (currentPageIndex - 1) * 10;
            return Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: ResultItem(SearchResultContent(
                    currResultList[offset + i][1],
                    currResultList[offset + i][1],
                    "Here is a piece of C++ code that shows some very peculiar behavior. For some strange reason, ")));
          });
    }
    var example = SearchResultContent(
        "https://maxcodevector.github.io",
        "Your search text has no result",
        "Would you want to give me a cup of coffee?");
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 1,
        padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (context, i) {
          return Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: ResultItem(example));
        });
  }
}

class SearchResultContent {
  final String url;
  final String title;
  final String description;

  SearchResultContent(this.url, this.title, this.description);
}

class ResultItem extends StatelessWidget {
  final SearchResultContent content;

  const ResultItem(this.content, {Key key})
      : assert(content != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.album),
            title: Text(content.title),
            subtitle: Text(content.description),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('COPY LINK'),
                onPressed: () {
                  /* ... */
                },
              ),
              FlatButton(
                child: const Text('VIEW'),
                onPressed: () {
                  launchURL(content.url);
                  /* ... */
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                        builder: (context) => AnswerPage(
//                              url: content.url,
//                              title: "result demo",
//                            )),
//                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

queryFromSearcher(String queryText) async {
  try {
    Response response;
    Dio dio = new Dio();
    response = await Dio().get("http://127.0.0.1:5000/query/" + queryText);
//        await dio.get("https://www.baidu.com");
    return response.data["answer"];
  } catch (e) {
    print(e);
  }
}
