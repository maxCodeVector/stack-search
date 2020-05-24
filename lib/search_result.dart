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
      SearchButton(0.35),
//                        Text(""),
      Text("\nsearch result of: heap. This is page 1\n",
          style: TextStyle(fontSize: 20)),
      Expanded(child: _buildResultList())
    ]);
  }

  Widget _buildResultList() {
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
              margin: const EdgeInsets.only(bottom: 8), child: ResultItem());
        });
  }
}

class ResultItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.album),
            title: Text('The Enchanted Nightingale'),
            subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('BUY TICKETS'),
                onPressed: () {
                  /* ... */
                },
              ),
              FlatButton(
                child: const Text('LISTEN'),
                onPressed: () {
                  /* ... */
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//class TravelDestinationItem extends StatelessWidget {
//  const TravelDestinationItem({Key key}) : super(key: key);
//
//  // This height will allow for all the Card's content to fit comfortably within the card.
//  static const height = 338.0;
//
//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//      top: false,
//      bottom: false,
//      child: Padding(
//        padding: const EdgeInsets.all(8),
//        child: ResultItem(),
//      ),
//    );
//  }
//}
