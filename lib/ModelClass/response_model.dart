

class ResponseModel {
  List<Products>? products;
  int? total;
  int? skip;
  int? limit;

  ResponseModel({this.products, this.total, this.skip, this.limit});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['skip'] = skip;
    data['limit'] = limit;
    return data;
  }
}

class Products {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<Reviews>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  Meta? meta;
  List<String>? images;
  String? thumbnail;

  Products(
      {this.id,
        this.title,
        this.description,
        this.category,
        this.price,
        this.discountPercentage,
        this.rating,
        this.stock,
        this.tags,
        this.brand,
        this.sku,
        this.weight,
        this.warrantyInformation,
        this.shippingInformation,
        this.availabilityStatus,
        this.reviews,
        this.returnPolicy,
        this.minimumOrderQuantity,
        this.meta,
        this.images,
        this.thumbnail});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    price = json['price'];
    discountPercentage = json['discountPercentage'].runtimeType == int ? double.tryParse(json['discountPercentage'].toString()) : json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    tags = json['tags'].cast<String>();
    brand = json['brand'] ?? "N/A";
    sku = json['sku'];
    weight = json['weight'];
    warrantyInformation = json['warrantyInformation'];
    shippingInformation = json['shippingInformation'];
    availabilityStatus = json['availabilityStatus'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
    returnPolicy = json['returnPolicy'];
    minimumOrderQuantity = json['minimumOrderQuantity'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    images = json['images'].cast<String>();
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['category'] = category;
    data['price'] = price;
    data['discountPercentage'] = discountPercentage;
    data['rating'] = rating;
    data['stock'] = stock;
    data['tags'] = tags;
    data['brand'] = brand;
    data['sku'] = sku;
    data['weight'] = weight;
    data['warrantyInformation'] = warrantyInformation;
    data['shippingInformation'] = shippingInformation;
    data['availabilityStatus'] = availabilityStatus;
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    data['returnPolicy'] = returnPolicy;
    data['minimumOrderQuantity'] = minimumOrderQuantity;
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['images'] = images;
    data['thumbnail'] = thumbnail;
    return data;
  }
}

class Reviews {
  int? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;

  Reviews(
      {this.rating,
        this.comment,
        this.date,
        this.reviewerName,
        this.reviewerEmail});

  Reviews.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    comment = json['comment'];
    date = json['date'];
    reviewerName = json['reviewerName'];
    reviewerEmail = json['reviewerEmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rating'] = rating;
    data['comment'] = comment;
    data['date'] = date;
    data['reviewerName'] = reviewerName;
    data['reviewerEmail'] = reviewerEmail;
    return data;
  }
}

class Meta {
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;

  Meta({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  Meta.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    barcode = json['barcode'];
    qrCode = json['qrCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['barcode'] = barcode;
    data['qrCode'] = qrCode;
    return data;
  }
}