import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final String title;

  const SecondPage(this.title, {super.key});

  @override
  SecondPageState createState() => SecondPageState();
}

class SecondPageState extends State<SecondPage> {
  int count = 0;

  void execute(callback) {
    callback(); //执行传入的函数
  }

  /// 可选参数
  String dealStrWidthOptParam(String name, String subName, [String? title, String? hidden]) {
    String str = name + subName;
    if (title != null) {
      str += title;
    }
    return str;
  }

  /// 可选命名参数(使用时带参数名)
  String dealStrWidthNamedOptParam(String name, String subName,
      {String? bold, String? hidden}) {
    String str = name + subName;
    if (bold != null) {
      str += bold;
    }
    if (hidden != null) {
      str += hidden;
    }
    return str;
  }

  @override
  Widget build(BuildContext context) {
    dealStrWidthOptParam("", "xxx");
    dealStrWidthOptParam("", "xxx", "xx");
    dealStrWidthOptParam("", "xxx", "xx", "xxxx");

    dealStrWidthNamedOptParam("", "xxx");
    dealStrWidthNamedOptParam("", "xxx", bold: "xx");
    dealStrWidthNamedOptParam("", "xxx", hidden: "xx", bold: "xxxx");

    List<String> items = List<String>.generate(10000, (i) => 'Item $i');
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        prototypeItem: ListTile(
          title: Text(items.first),
        ),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
          );
        },
      ),
    );
  }
}
