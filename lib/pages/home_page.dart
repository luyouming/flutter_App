import 'dart:convert';

import 'package:famous_app/models/local/channel_item.dart';
import 'package:flutter/material.dart';
import 'package:famous_app/constant/constant.dart';
import 'about_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

// mixin SingleTickerProviderStateMixin 动画定时器 就是动画出现时才作用，页面不再有动画时取消定时器
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // tab 数据
  List<ChannelItem> channels = [];

  late TabController _tabController;

  // 初始化数据
  _initData() async {
    List<dynamic> listData = [];
    String data = await DefaultAssetBundle.of(context)
        .loadString('assets/config/channel.json');

    listData = json.decode(data);

    setState(() {
      // listData.forEach((tmp) => channels.add(ChannelItem.fromJson(tmp)));
      for (var item in listData) {
        channels.add(ChannelItem.fromJson(item));
      }
      _tabController = TabController(length: listData.length, vsync: this);
      // !代表是一定有值 强制断言
      _tabController!.addListener(() {
        // print('当前点击的是${_tabController?.index}个tab');

        // 第一次点击 重复两次解决方案1
        // int _curIdx = _tabController!.index;
        // var offset = _tabController!.animation?.value;
        // if (_curIdx == offset) {
        //    print('当前点击的是${_tabController?.index}个tab');
        // }

        // 第一次点击 重复两次解决方案2 动画正在执行  indexIsChanging 为true 结束为false
        if (!_tabController!.indexIsChanging) {
          print('当前点击的是第${_tabController?.index}个tab');
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: channels.length,
      child: Scaffold(
        appBar: AppBar(
            leading: const Icon(Icons.title),
            bottom: TabBar(
              controller: _tabController,
              // Color(0xFFff4400)
              // Color.fromRGBO(0,0,0，.5)
              indicatorColor: Colors.blue[100],
              tabs: channels.map((ChannelItem channel) {
                return Tab(text: channel.channelName);
              }).toList(),
            ),
            title: const Text(Copywriter.appTitle,
                style: TextStyle(color: Colors.white)),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.assessment),
                onPressed: (() {
                  // 动态路由  支持传参
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutPage()));
                }),
              )
            ]),
        body: const Text('内容区'),
      ),
    );
  }
}
