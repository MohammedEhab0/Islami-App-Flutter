class RecitersResponse {
  RecitersResponse({
    this.reciters,
  });

  RecitersResponse.fromJson(dynamic json) {
    if (json['reciters'] != null) {
      reciters = [];
      json['reciters'].forEach((v) {
        reciters?.add(Reciter.fromJson(v));
      });
    }
  }

  List<Reciter>? reciters;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (reciters != null) {
      map['reciters'] = reciters?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Reciter {
  Reciter({
    this.id,
    this.name,
    this.letter,
    this.date,
    this.moshaf,
  });

  Reciter.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    letter = json['letter'];
    date = json['date'];
    if (json['moshaf'] != null) {
      moshaf = [];
      json['moshaf'].forEach((v) {
        moshaf?.add(Moshaf.fromJson(v));
      });
    }
  }

  int? id;
  String? name;
  String? letter;
  String? date;
  List<Moshaf>? moshaf;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['letter'] = letter;
    map['date'] = date;
    if (moshaf != null) {
      map['moshaf'] = moshaf?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Moshaf {
  Moshaf({
    this.id,
    this.name,
    this.server,
    this.surahTotal,
    this.moshafType,
    this.surahList,
  });

  Moshaf.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    server = json['server'];
    surahTotal = json['surah_total'];
    moshafType = json['moshaf_type'];
    surahList = json['surah_list'];
  }

  int? id;
  String? name;
  String? server;
  int? surahTotal;
  int? moshafType;
  String? surahList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['server'] = server;
    map['surah_total'] = surahTotal;
    map['moshaf_type'] = moshafType;
    map['surah_list'] = surahList;
    return map;
  }
}
