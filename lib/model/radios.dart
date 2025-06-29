class RadiosList {
  RadiosList({
    this.radios,
  });

  RadiosList.fromJson(dynamic json) {
    if (json['radios'] != null) {
      radios = [];
      json['radios'].forEach((v) {
        radios?.add(RadioItem.fromJson(v));
      });
    }
  }

  List<RadioItem>? radios;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (radios != null) {
      map['radios'] = radios?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class RadioItem {
  RadioItem({
    this.id,
    this.name,
    this.url,
    this.recentDate,
  });

  RadioItem.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    recentDate = json['recent_date'];
  }

  int? id;
  String? name;
  String? url;
  String? recentDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['url'] = url;
    map['recent_date'] = recentDate;
    return map;
  }
}
