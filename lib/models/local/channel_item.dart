class ChannelItem {
  String channelName;
  String channelType;
  String channelId;

  ChannelItem(this.channelName, this.channelType, this.channelId);

  ChannelItem.fromJson(Map<String, dynamic> jsonObj)
      : channelName = jsonObj['name'],
        channelType = jsonObj['key'],
        channelId = jsonObj['id'];
}
