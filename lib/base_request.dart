import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:oxs_candidate/result.dart';

import 'article.dart';

enum RequestType { post, get, put, delete }

class BaseRequest<T> {
  RequestType type = RequestType.get;
  Map<String, dynamic>? body;
  Map<String, String> headers = {'Content-Type': 'application/json'};
  Map<String, String>? queries;


  final String link;
  BaseRequest({required this.link});

  Uri uri() {
    return Uri.parse(link);
  }

  OxsResult<T, String> parse(Response response) {
    return json.decode(utf8.decode(response.bodyBytes));
  }

  Future<OxsResult> call() {
    return APIHandler.get(this);
  }
}

class APIHandler {
  static Future<OxsResult> get<T>(BaseRequest request) async {
    final response = await http.get(request.uri(), headers: request.headers);
    return request.parse(response);
  }
}


class ArticlesRequest extends BaseRequest<List<Article>> {
  ArticlesRequest({required super.link});

  @override
  OxsResult<List<Article>, String> parse(http.Response response) {
    var body = json.decode(utf8.decode(response.bodyBytes)) as List<dynamic>;
    return OxsResult.success(success: body.map((e) => Article.fromMap(e)).toList());
  }
}