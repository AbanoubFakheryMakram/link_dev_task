
import 'package:intl/intl.dart';
import 'package:link_dev_task/models/base_response_model.dart';

class Articles extends BaseResponse {
  Articles({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
  });

  Articles.fromJson(Map<String, dynamic> map) {
    author = map['author'];
    title = map['title'];
    description = map['description'];
    url = map['url'];
    urlToImage = map['urlToImage'];
    publishedAt = map['publishedAt'] != null && map['publishedAt'].isNotEmpty ?
                  DateFormat('MMMM dd, yyyy').format(DateTime.parse(map['publishedAt'])) :
                  '';
  }

  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    return map;
  }

  @override
  List<Object> get props => [this.author, this.url, this.urlToImage, this.description, this.publishedAt];
}
