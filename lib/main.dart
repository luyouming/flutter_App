import 'package:famous_app/pages/home_page.dart';
import 'package:flutter/material.dart';

// 程序入口
void main() {
  runApp(const MyApp()); // const 要求所有的状态都是final
}

// 有状态组件 StatelessWidget
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = ThemeData(
        brightness: Brightness.light, // 主题亮度
        primaryColor: Colors.blue // 主题色
        );
    // Container()
    return MaterialApp(
      theme: theme,
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
