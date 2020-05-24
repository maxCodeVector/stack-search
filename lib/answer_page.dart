import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_web_view/easy_web_view.dart';

class AnswerPage extends StatelessWidget {
  final String url;
  final String title;

  const AnswerPage({Key key, this.url, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [_buildReturnBar(context), _buildWebView()],
    );
  }

  Widget _buildWebView() {
    return Expanded(
        child: EasyWebView(
      src: url,
      isHtml: false, // Use Html syntax
      isMarkdown: false, // Use markdown syntax
      convertToWidets: false, // Try to convert to flutter widgets
      // width: 100,
      // height: 100,
    ));
  }

  Widget _buildReturnBar(BuildContext context) {
    return Container(
        height: 50.0,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(color: Colors.white10),
        // Row 是水平方向的线性布局（linear layout）
        child: Row(children: [
          FlatButton(
            child: Text("Back", style: TextStyle(fontSize: 24)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          FlatButton(
            child:
                Text("Open in Another Window", style: TextStyle(fontSize: 24)),
            onPressed: () {
              launchURL(url);
            },
          )
        ]));
  }
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
