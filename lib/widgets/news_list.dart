// 类似components
import 'package:famous_app/models/local/channel_item.dart';
import 'package:flutter/material.dart';

// import 'package:famous_app/models/network/news_list.dart';

class NewsList extends StatefulWidget {
  final ChannelItem channel;

  final List<dynamic> newsList;

  const NewsList({Key? key, required this.channel, required this.newsList})
      : super(key: key);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  Widget _renderRow(int i) {
    // return Text(Copywriter.newsListTitle);
    var news = widget.newsList[i];
    // const
    return Card(
        child: ListTile(
          // leading: FlutterLogo(size: 60.0),
          leading: Image.network(news['imgsrc']),
          title: Text(news['title']),
          subtitle: Text(news['mtime']),
          trailing: Icon(Icons.share, color: Colors.black54),
        ),
        margin: EdgeInsets.all(8.0));
  }

  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, i) => _renderRow(i),
        padding: const EdgeInsets.all(10.0),
        itemCount: widget.newsList.length);
  }
}
