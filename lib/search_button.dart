import 'package:flutter/material.dart';
import 'package:web_search/search_result.dart';

class SearchButton extends StatelessWidget {
  final double width_prop;

  const SearchButton(this.width_prop, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.0,
        // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
        width: MediaQuery.of(context).size.width * width_prop,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(color: Colors.white),
        child: ExampleWidget());
  }
}

/// Opens an [AlertDialog] showing what the user typed.
class ExampleWidget extends StatefulWidget {
  ExampleWidget({Key key}) : super(key: key);

  @override
  _ExampleWidgetState createState() => _ExampleWidgetState();
}

/// State for [ExampleWidget] widgets.
class _ExampleWidgetState extends State<ExampleWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text("Search ", style: TextStyle(fontSize: 20)),
      Expanded(child: TextField(controller: _controller, decoration: null)),
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          changeToSearchResult(context);
        },
      ),
    ]);
  }
}

void changeToSearchResult(BuildContext currContext) {
  Navigator.push(
    currContext,
    MaterialPageRoute(builder: (context) => ResultPage()),
  );
}
