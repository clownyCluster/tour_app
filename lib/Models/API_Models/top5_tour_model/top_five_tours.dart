class TopFiveModel {
  String? status;
  String? requestedAt;
  num? length;
  List<Data>? data;

  TopFiveModel({this.status, this.requestedAt, this.length, this.data});

  TopFiveModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    requestedAt = json['requestedAt'];
    length = json['length'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['requestedAt'] = this.requestedAt;
    data['length'] = this.length;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  num? ratingsAverage;
  List<Guides>? guides;
  String? sId;
  String? name;
  num? duration;
  String? difficulty;
  num? price;
  String? summary;
  num? durationWeeks;
  String? id;
  String? imageCover;

  Data({
    this.ratingsAverage,
    this.guides,
    this.sId,
    this.name,
    this.duration,
    this.difficulty,
    this.price,
    this.summary,
    this.durationWeeks,
    this.id,
    this.imageCover,
  });

  Data.fromJson(Map<String, dynamic> json) {
    ratingsAverage = json['ratingsAverage'];
    if (json['guides'] != null) {
      guides = <Guides>[];
      json['guides'].forEach((v) {
        guides!.add(new Guides.fromJson(v));
      });
    }
    sId = json['_id'];
    name = json['name'];
    duration = json['duration'];
    difficulty = json['difficulty'];
    price = json['price'];
    summary = json['summary'];
    durationWeeks = json['durationWeeks'];
    id = json['id'];
    imageCover = json['imageCover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ratingsAverage'] = this.ratingsAverage;
    if (this.guides != null) {
      data['guides'] = this.guides!.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['duration'] = this.duration;
    data['difficulty'] = this.difficulty;
    data['price'] = this.price;
    data['summary'] = this.summary;
    data['durationWeeks'] = this.durationWeeks;
    data['id'] = this.id;
    data['imageCover'] = this.imageCover;
    return data;
  }
}

class Guides {
  String? role;
  String? photo;
  String? sId;
  String? name;
  String? email;
  String? id;

  Guides({this.role, this.photo, this.sId, this.name, this.email, this.id});

  Guides.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    photo = json['photo'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this.role;
    data['photo'] = this.photo;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['id'] = this.id;
    return data;
  }
}
