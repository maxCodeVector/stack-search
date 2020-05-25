import 'package:flutter/material.dart';
import 'package:web_search/search_result.dart';

class SearchButton extends StatelessWidget {
  final double width_prop;
  final String queryText;
  final Function function;

  const SearchButton(this.width_prop, {Key key, this.queryText, this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.0,
        // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
        width: MediaQuery.of(context).size.width * width_prop,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
//            border: new Border.all(color: Color(0xFFFF0000), width: 0.5),
            // 边色与边宽度
// 生成俩层阴影，一层绿，一层黄， 阴影位置由offset决定,阴影模糊层度由blurRadius大小决定（大就更透明更扩散），阴影模糊大小由spreadRadius决定
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(1.0, 1.0),
                  blurRadius: 5.0,
                  spreadRadius: 1.0),
//              BoxShadow(color: Color(0x9900FF00), offset: Offset(1.0, 1.0)),
//              BoxShadow(color: Color(0xFF0000FF))
            ], color: Colors.white),
        child: ExampleWidget(queryText: queryText, function: function));
  }
}

/// Opens an [AlertDialog] showing what the user typed.
class ExampleWidget extends StatefulWidget {
  final String queryText;
  final Function function;

  ExampleWidget({Key key, this.queryText, this.function}) : super(key: key);

  @override
  _ExampleWidgetState createState() => _ExampleWidgetState(queryText, function);
}

/// State for [ExampleWidget] widgets.
class _ExampleWidgetState extends State<ExampleWidget> {
  TextEditingController _controller = TextEditingController();
  final String queryText;
  final Function function;

  _ExampleWidgetState(this.queryText, this.function);

  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController(text: queryText);
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text("Search ", style: TextStyle(fontSize: 20)),
      Expanded(child: TextField(controller: _controller, decoration: null)),
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          var queryText = _controller.text;
          if (queryText != null && queryText.isNotEmpty) {
            if (function == null) {
              changeToSearchResult(context, queryText);
            } else {
              function(context, queryText);
            }
          }
        },
      ),
    ]);
  }
}

void changeToSearchResult(BuildContext currContext, String text) async {
  var resultList = await queryFromSearcher(text);
  Navigator.push(
    currContext,
    MaterialPageRoute(
        builder: (context) =>
            ResultPage(searchText: text, initResultList: resultList)),
  );
}
