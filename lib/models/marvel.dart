class MarvelModel<T> {
  int offset;
  int limit;
  int total;
  int count;
  List results;

  MarvelModel({
    required this.count,
    required this.limit,
    required this.offset,
    required this.total,
    required this.results,
  });

  factory MarvelModel.fromJson(Map<String, dynamic> json) {
    return MarvelModel(
      offset: json['offset'],
      limit: json['limit'],
      total: json['total'],
      count: json['count'],
      results: json['results'],
    );
  }
}

class CharacterModel {
  int id;
  String name;
  Thumbnail thumbnail;

  CharacterModel({
    required this.id,
    required this.name,
    required this.thumbnail,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      thumbnail: Thumbnail.fromJson(json['thumbnail']),
    );
  }
}

class Thumbnail {
  String path;
  String extension;

  Thumbnail({
    required this.path,
    required this.extension,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) {
    return Thumbnail(
      path: json['path'],
      extension: json['extension'],
    );
  }
}

class SerieModel {
  int id;
  String title;

  SerieModel({required this.id, required this.title});

  factory SerieModel.fromJson(Map<String, dynamic> json) {
    return SerieModel(id: json['id'], title: json['title']);
  }
}

class EventModel {
  int id;
  String title;

  EventModel({required this.id, required this.title});

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(id: json['id'], title: json['title']);
  }
}

// class EventModel implements BaseModel {
//   @override
//   int? id;
//   @override
//   String? title;

//   EventModel({this.id, this.title});
// }
