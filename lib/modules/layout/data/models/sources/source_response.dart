import 'source.dart';

class SourceResponse {
  SourceResponse({this.status, this.message, this.code, this.sources});

  SourceResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Sources.fromJson(v));
      });
    }
  }
  String? status;
  List<Sources>? sources;
  String? message;
  String? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['code'] = code;
    if (sources != null) {
      map['sources'] = sources?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
