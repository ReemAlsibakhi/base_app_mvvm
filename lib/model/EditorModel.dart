class EditorModel {
  int? _code;
  String? _status;
  List<Editor>? _data;

  EditorModel({int? code, String? status, List<Editor>? data}) {
    if (code != null) {
      this._code = code;
    }
    if (status != null) {
      this._status = status;
    }
    if (data != null) {
      this._data = data;
    }
  }

  int? get code => _code;
  set code(int? code) => _code = code;
  String? get status => _status;
  set status(String? status) => _status = status;
  List<Editor>? get data => _data;
  set data(List<Editor>? data) => _data = data;

  EditorModel.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _status = json['status'];
    if (json['data'] != null) {
      _data = <Editor>[];
      json['data'].forEach((v) {
        _data!.add(new Editor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    data['status'] = this._status;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Editor {
  String? _identifier;
  String? _language;
  String? _name;
  String? _englishName;
  String? _format;
  String? _type;
  String? _direction;

  Editor(
      {String? identifier,
      String? language,
      String? name,
      String? englishName,
      String? format,
      String? type,
      String? direction}) {
    if (identifier != null) {
      this._identifier = identifier;
    }
    if (language != null) {
      this._language = language;
    }
    if (name != null) {
      this._name = name;
    }
    if (englishName != null) {
      this._englishName = englishName;
    }
    if (format != null) {
      this._format = format;
    }
    if (type != null) {
      this._type = type;
    }
    if (direction != null) {
      this._direction = direction;
    }
  }

  String? get identifier => _identifier;
  set identifier(String? identifier) => _identifier = identifier;
  String? get language => _language;
  set language(String? language) => _language = language;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get englishName => _englishName;
  set englishName(String? englishName) => _englishName = englishName;
  String? get format => _format;
  set format(String? format) => _format = format;
  String? get type => _type;
  set type(String? type) => _type = type;
  String? get direction => _direction;
  set direction(String? direction) => _direction = direction;

  Editor.fromJson(Map<String, dynamic> json) {
    _identifier = json['identifier'];
    _language = json['language'];
    _name = json['name'];
    _englishName = json['englishName'];
    _format = json['format'];
    _type = json['type'];
    _direction = json['direction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identifier'] = this._identifier;
    data['language'] = this._language;
    data['name'] = this._name;
    data['englishName'] = this._englishName;
    data['format'] = this._format;
    data['type'] = this._type;
    data['direction'] = this._direction;
    return data;
  }
}
