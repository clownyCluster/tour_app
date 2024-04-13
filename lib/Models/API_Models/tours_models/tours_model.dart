class ToursModel {
  String? status;
  String? requestedAt;
  num? length;
  List<Data>? data;

  ToursModel({this.status, this.requestedAt, this.length, this.data});

  ToursModel.fromJson(Map<String, dynamic> json) {
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
  StartLocation? startLocation;
  num? ratingsAverage;
  num? ratingsQuantity;
  List<String>? images;
  List<String>? startDates;
  bool? secretTour;
  List<Guides>? guides;
  String? sId;
  num? rating;
  String? name;
  num? duration;
  num? maxGroupSize;
  String? difficulty;
  num? price;
  String? summary;
  String? description;
  String? imageCover;
  List<Locations>? locations;
  String? slug;
  num? durationWeeks;
  String? id;

  Data(
      {this.startLocation,
      this.ratingsAverage,
      this.ratingsQuantity,
      this.images,
      this.startDates,
      this.secretTour,
      this.guides,
      this.sId,
      this.rating,
      this.name,
      this.duration,
      this.maxGroupSize,
      this.difficulty,
      this.price,
      this.summary,
      this.description,
      this.imageCover,
      this.locations,
      this.slug,
      this.durationWeeks,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    startLocation = json['startLocation'] != null
        ? new StartLocation.fromJson(json['startLocation'])
        : null;
    ratingsAverage = json['ratingsAverage'];
    ratingsQuantity = json['ratingsQuantity'];
    images = json['images'].cast<String>();
    startDates = json['startDates'].cast<String>();
    secretTour = json['secretTour'];
    if (json['guides'] != null) {
      guides = <Guides>[];
      json['guides'].forEach((v) {
        guides!.add(new Guides.fromJson(v));
      });
    }
    sId = json['_id'];
    rating = json['rating'];
    name = json['name'];
    duration = json['duration'];
    maxGroupSize = json['maxGroupSize'];
    difficulty = json['difficulty'];
    price = json['price'];
    summary = json['summary'];
    description = json['description'];
    imageCover = json['imageCover'];
    if (json['locations'] != null) {
      locations = <Locations>[];
      json['locations'].forEach((v) {
        locations!.add(new Locations.fromJson(v));
      });
    }
    slug = json['slug'];
    durationWeeks = json['durationWeeks'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.startLocation != null) {
      data['startLocation'] = this.startLocation!.toJson();
    }
    data['ratingsAverage'] = this.ratingsAverage;
    data['ratingsQuantity'] = this.ratingsQuantity;
    data['images'] = this.images;
    data['startDates'] = this.startDates;
    data['secretTour'] = this.secretTour;
    if (this.guides != null) {
      data['guides'] = this.guides!.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['rating'] = this.rating;
    data['name'] = this.name;
    data['duration'] = this.duration;
    data['maxGroupSize'] = this.maxGroupSize;
    data['difficulty'] = this.difficulty;
    data['price'] = this.price;
    data['summary'] = this.summary;
    data['description'] = this.description;
    data['imageCover'] = this.imageCover;
    if (this.locations != null) {
      data['locations'] = this.locations!.map((v) => v.toJson()).toList();
    }
    data['slug'] = this.slug;
    data['durationWeeks'] = this.durationWeeks;
    data['id'] = this.id;
    return data;
  }
}

class StartLocation {
  String? type;
  List<double>? coordinates;
  String? description;
  String? address;

  StartLocation({this.type, this.coordinates, this.description, this.address});

  StartLocation.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
    description = json['description'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    data['description'] = this.description;
    data['address'] = this.address;
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

class Locations {
  String? type;
  List<double>? coordinates;
  String? sId;
  String? description;
  num? day;

  Locations(
      {this.type, this.coordinates, this.sId, this.description, this.day});

  Locations.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
    sId = json['_id'];
    description = json['description'];
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    data['_id'] = this.sId;
    data['description'] = this.description;
    data['day'] = this.day;
    return data;
  }
}
