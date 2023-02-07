class PhotoModel {
  List<Photo>? _data;

  PhotoModel(this._data);
  List<Photo>? get data => _data;
  set data(List<Photo>? data) => _data = data;

  PhotoModel.fromJson(List<dynamic> json) {
    _data = <Photo>[];
    for (var v in json) {
      _data!.add(Photo.fromJson(v));
    }
  }
}

class Photo {
  Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  Photo.fromJson(dynamic json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['albumId'] = albumId;
    map['id'] = id;
    map['title'] = title;
    map['url'] = url;
    map['thumbnailUrl'] = thumbnailUrl;
    return map;
  }
}
