class RickyAndMortyResponse {
  RickyAndMortyResponse({
    this.info,
    this.results,
  });

  Info? info;
  List<Result>? results;

  factory RickyAndMortyResponse.fromJson(Map<String, dynamic> json) => RickyAndMortyResponse(
    info: json["info"] == null ? null : Info.fromJson(json["info"]),
    results: json["results"] == null ? null : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "info": info == null ? null : info!.toJson(),
    "results": results == null ? null : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Info {
  Info({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });

  int? count;
  int? pages;
  String? next;
  dynamic prev;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    count: json["count"] == null ? null : json["count"],
    pages: json["pages"] == null ? null : json["pages"],
    next: json["next"] == null ? null : json["next"],
    prev: json["prev"],
  );

  Map<String, dynamic> toJson() => {
    "count": count == null ? null : count,
    "pages": pages == null ? null : pages,
    "next": next == null ? null : next,
    "prev": prev,
  };
}

class Result {
  Result({
    this.id,
    this.name,
    this.type,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
    this.gender,
    this.status,
    this.species
  });

  int? id;
  String? name;
  String? type;
  String? gender;
  String? status;
  String? species;
  Location? origin;
  Location? location;
  String? image;
  List<String>? episode;
  String? url;
  DateTime? created;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    type: json["type"] == null ? null : json["type"],
    gender: json["gender"] == null ? null : json["gender"],
    status: json["status"] == null ? null : json["status"],
    species: json["species"] == null ? null : json["species"],
    origin: json["origin"] == null ? null : Location.fromJson(json["origin"]),
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    image: json["image"] == null ? null : json["image"],
    episode: json["episode"] == null ? null : List<String>.from(json["episode"].map((x) => x)),
    url: json["url"] == null ? null : json["url"],
    created: json["created"] == null ? null : DateTime.parse(json["created"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "type": type == null ? null : type,
    "gender": gender == null ? null : gender,
    "status": status == null ? null : status,
    "species": species == null ? null : species,
    "origin": origin == null ? null : origin!.toJson(),
    "location": location == null ? null : location!.toJson(),
    "image": image == null ? null : image,
    "episode": episode == null ? null : List<dynamic>.from(episode!.map((x) => x)),
    "url": url == null ? null : url,
    "created": created == null ? null : created!.toIso8601String(),
  };
}

class Location {
  Location({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"] == null ? null : json["name"],
    url: json["url"] == null ? null : json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "url": url == null ? null : url,
  };
}


