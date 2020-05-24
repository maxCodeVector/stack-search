import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web_search/answer_page.dart';
import 'package:web_search/search_button.dart';

class ResultPage extends StatefulWidget {
  final String searchText;

  const ResultPage({Key key, this.searchText}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ResultState(searchText);
}

class ResultState extends State<ResultPage> {
  String searchText;
  int currentPageIndex = 1;

  ResultState(this.searchText);

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
      SearchButton(0.35, queryText: this.searchText),
      Center(
        child: Row(children: [
          Text("search result of: " + this.searchText,
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
    var example = SearchResultContent(
        "https://stackoverflow.com/questions/11227809/why-is-processing-a-sorted-array-faster-than-processing-an-unsorted-array",
        "Why is processing a sorted array faster than processing an unsorted array?",
        "Here is a piece of C++ code that shows some very peculiar behavior. For some strange reason, "
            "sorting the data miraculously makes the code almost six times faster:");
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
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
