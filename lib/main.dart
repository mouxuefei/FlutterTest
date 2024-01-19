import 'package:demo1/Second.dart';
import 'package:demo1/extends.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/", // 默认加载的界面，这里为RootPage
      routes: { // 显式声明路由
        // "/":(context) => RootPage(),
        "/Second":(context) =>const SecondPage("XXX"),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyAppBar extends StatelessWidget {
  //不可变的widget需要 const，并且内容加final
  const MyAppBar({required this.title, super.key});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: const BoxDecoration(color: Color(0x33333333)),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                //TODO:
              },
              icon: const Icon(Icons.menu)),
          Expanded(child: title),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/Second",arguments:{"argms":"这是传入A的参数"});
              },
              icon: const Icon(Icons.search))
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class IconData {
  final String title;
  final String icon;

  IconData(this.title, this.icon);
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget _createTitleWidget() {
    return const Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "xxxxxx asdasdsaf",
          style: TextStyle(fontSize: 20, color: Color(0xFF000000)),
        ),
        Text("xxxxxx asdasdsaf"),
      ],
    ));
  }

  Container buildContainer() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: const Row(
        children: [
          Icon(Icons.star, color: Colors.yellow),
          Text(
            "41",
            style: TextStyle(color: Color(0xFF000000), fontSize: 20),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<IconData> iconList = [
      IconData("123", 'apple.png'.img),
      IconData("456", 'apple.png'.img),
      IconData("789", 'apple.png'.img)
    ];
    return Material(
      child: Column(
        children: [
          MyAppBar(
            title: Text(
              'Example title',
              style: Theme.of(context) //
                  .primaryTextTheme
                  .titleLarge,
            ),
          ),
          Column(
            children: [
              Image.network(
                height: 300,
                fit: BoxFit.cover,
                width: 600,
                'https://images.pexels.com/photos/850359/pexels-photo-850359.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=375',
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                child: Row(
                  children: [_createTitleWidget(), buildContainer()],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: iconList.map((e) {
                  return GestureDetector(
                    child: Column(
                      children: [
                        Image.asset(e.icon),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(e.title),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                child: const Text(
                    "这份指南之前溯源一步解释了 Flutter 中的布局方式，以及展示了如何在屏幕中放置单个 widget。"
                    "经过了如何水平以及竖直放置 widgets 的讨论之后，一些最常使用的 widgets 都涉及到了。"),
              )
            ],
          )
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final Widget? titleWidget;
  final BorderRadiusGeometry? borderRadius;

  const MyButton(
      {super.key,
      this.onPressed,
      this.title = "",
      this.titleWidget,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: borderRadius ?? BorderRadius.circular(8)),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(8),
        child: Center(
          child: titleWidget ?? Text(title),
        ),
      ),
    );
  }
}
