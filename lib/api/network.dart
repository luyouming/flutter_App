import 'package:http/http.dart' as http;

class Network {
  static Future<String> get(String url, [Map<String, String>? params]) async {
    if (params != null && params.isNotEmpty) {
      StringBuffer sb = StringBuffer('?');
      params.forEach((key, value) {
        sb.write('$key=$value');
      });

      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }
    http.Response res = await http.post(Uri.parse(url),
        body: params, headers: getCommonHeaders());

    print('发起 get 请求');
    print('$url');
    print('返回数据: ${res.body}');
  }

  static Map<String, String> getCommonHeaders() {
    Map<String, String> header = {};
    header['User-Agent'] = '';
    return header;
  }
}
