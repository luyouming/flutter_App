// 类似components
import 'package:famous_app/models/local/channel_item.dart';
import 'package:flutter/material.dart';

class NewsList extends StatefulWidget {
  final ChannelItem channel;

  const NewsList({Key? key, required this.channel}) : super(key: key);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  Widget _renderRow(int i) {
    return Text('新闻卡片');
  }

  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, i) => _renderRow(i),
        padding: const EdgeInsets.all(10.0),
        itemCount: 10);
  }
}
