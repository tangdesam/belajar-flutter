class Source {
  Source({
    this.id,
    required this.name,
  });

  dynamic id;
  String name;

  // factory Source.fromJson(Map<String, dynamic> json) => Source(
  //   id: json["id"],
  //   name: json["name"],
  // );

  factory Source.fromJson(Map<String, dynamic> json) {
    if (json["id"] != null && json["name"] != null) {
      return Source(id: json["id"], name: json["name"]);
    }
    else return Source(id: "", name: "");
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}