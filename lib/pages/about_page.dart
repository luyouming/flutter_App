import 'package:famous_app/constant/constant.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text(Copywriter.aboutTitle)),
        body: Center(
            // ==  display flex justify-content center align-itens center
            // child: const FlutterLogo(size: 100.0)
            child: Column(
                // flex-direction column
                mainAxisAlignment: MainAxisAlignment.center, // 主轴居中
                children: <Widget>[
              const FlutterLogo(size: 100.0),
              Container(padding: const EdgeInsets.all(10.0)
                  // width: MediaQuery.of(context).size.width * 0.5,
                  // decoration: BoxDecoration(
                  //     color: Colors.red,
                  //     border: Border.all(
                  //       color: Colors.red,
                  //       width: 3,
                  //       style: BorderStyle.solid,
                  //     ),
                  //     borderRadius: BorderRadius.circular(10),
                  //     gradient:
                  //         LinearGradient(colors: [Colors.red, Colors.green])))
                  ),
              const Text(
                Copywriter.author,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
            ])));
  }
}
