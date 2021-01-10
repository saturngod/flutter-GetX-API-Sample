// To parse this JSON data, do
//
//     final casts = castsFromJson(jsonString);

import 'dart:convert';

Casts castsFromJson(String str) => Casts.fromJson(json.decode(str));

String castsToJson(Casts data) => json.encode(data.toJson());

class Casts {
  Casts({
    this.id,
    this.cast,
    this.crew,
  });

  int id;
  List<Cast> cast;
  List<Cast> crew;

  factory Casts.fromJson(Map<String, dynamic> json) => Casts(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
        crew: List<Cast>.from(json["crew"].map((x) => Cast.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
        "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
      };
}

class Cast {
  Cast({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
    this.department,
    this.job,
  });

  bool adult;
  int gender;
  int id;
  Department knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String profilePath;
  int castId;
  String character;
  String creditId;
  int order;
  Department department;
  String job;

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: departmentValues.map[json["known_for_department"]],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
        castId: json["cast_id"] == null ? null : json["cast_id"],
        character: json["character"] == null ? null : json["character"],
        creditId: json["credit_id"],
        order: json["order"] == null ? null : json["order"],
        department: json["department"] == null
            ? null
            : departmentValues.map[json["department"]],
        job: json["job"] == null ? null : json["job"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": departmentValues.reverse[knownForDepartment],
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath == null ? null : profilePath,
        "cast_id": castId == null ? null : castId,
        "character": character == null ? null : character,
        "credit_id": creditId,
        "order": order == null ? null : order,
        "department":
            department == null ? null : departmentValues.reverse[department],
        "job": job == null ? null : job,
      };
}

enum Department {
  ACTING,
  CREW,
  DIRECTING,
  PRODUCTION,
  SOUND,
  ART,
  EDITING,
  COSTUME_MAKE_UP,
  CAMERA,
  WRITING,
  VISUAL_EFFECTS,
  CREATOR,
  LIGHTING
}

final departmentValues = EnumValues({
  "Acting": Department.ACTING,
  "Art": Department.ART,
  "Camera": Department.CAMERA,
  "Costume & Make-Up": Department.COSTUME_MAKE_UP,
  "Creator": Department.CREATOR,
  "Crew": Department.CREW,
  "Directing": Department.DIRECTING,
  "Editing": Department.EDITING,
  "Lighting": Department.LIGHTING,
  "Production": Department.PRODUCTION,
  "Sound": Department.SOUND,
  "Visual Effects": Department.VISUAL_EFFECTS,
  "Writing": Department.WRITING
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
