class News {
  String title;
  String time;
  String imgSrc;

  News(this.title, this.time, this.imgSrc);

  News.fromJson(Map<String, dynamic> jsonObj)
      : title = jsonObj['title'],
        time = jsonObj['time'],
        imgSrc = jsonObj['imgSrc'];
}
