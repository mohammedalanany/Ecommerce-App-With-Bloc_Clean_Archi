class StoreModel {
  int? id;
  String? title;
  String? photo;
  int? categoryId;
  int? productId;
  dynamic clientPrice;
  dynamic offerPrice;
  String? offerType;
  int? offerTypeId;
  int? quantity;
  int? isLiked;
  int? cartCount;
  int? productRate;
  int? hasTax;
  String? video;
  List<Photos>? photos;
//  List<ProductOffer> productOffer;

  StoreModel({
    this.id,
    this.title,
    this.photo,
    this.categoryId,
    this.productId,
    this.clientPrice,
    this.offerPrice,
    this.offerType,
    this.offerTypeId,
    this.quantity,
    this.isLiked,
    this.cartCount,
    this.productRate,
    this.hasTax,
    this.video,
    this.photos,
    // this.productOffer
  });
  switchLike() {
    isLiked == 0 ? isLiked = 1 : isLiked = 0;
  }

  StoreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    photo = json['photo'];
    categoryId = json['category_id'];
    productId = json['product_id'];
    clientPrice = json['client_price'];
    offerPrice = json['offer_price'];
    offerType = json['offer_type'];
    offerTypeId = json['offer_type_id'];
    quantity = json['quantity'];
    isLiked = json['is_liked'];
    cartCount = json['cart_count'];
    productRate = json['product_rate'];
    hasTax = json['has_tax'];
    video = json['video'];
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(new Photos.fromJson(v));
      });
    }
    // if (json['product_offer'] != null) {
    //   productOffer = new List<ProductOffer>();
    //   json['product_offer'].forEach((v) {
    //     productOffer.add(new ProductOffer.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['photo'] = this.photo;
    data['category_id'] = this.categoryId;
    data['product_id'] = this.productId;
    data['client_price'] = this.clientPrice;
    data['offer_price'] = this.offerPrice;
    data['offer_type'] = this.offerType;
    data['offer_type_id'] = this.offerTypeId;
    data['quantity'] = this.quantity;
    data['is_liked'] = this.isLiked;
    data['cart_count'] = this.cartCount;
    data['product_rate'] = this.productRate;
    data['has_tax'] = this.hasTax;
    data['video'] = this.video;
    if (this.photos != null) {
      data['photos'] = this.photos!.map((v) => v.toJson()).toList();
    }
    // if (this.productOffer != null) {
    //   data['product_offer'] = this.productOffer.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Photos {
  int? id;
  String? photo;
  int? productId;
  String? thumb;

  Photos({this.id, this.photo, this.productId, this.thumb});

  Photos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    productId = json['product_id'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['photo'] = this.photo;
    data['product_id'] = this.productId;
    data['thumb'] = this.thumb;
    return data;
  }
}

class ProductOffer {
  int? id;
  int? productId;
  int? offerId;
  int? typeId;
  Null priceDiscount;
  int? isFree;
  Null percentage;
  int? quantity;
  int? getQuantity;
  Null numberOfUsers;
  Null oneUserUse;
  String? nameEn;
  Offer? offer;

  ProductOffer(
      {this.id,
      this.productId,
      this.offerId,
      this.typeId,
      this.priceDiscount,
      this.isFree,
      this.percentage,
      this.quantity,
      this.getQuantity,
      this.numberOfUsers,
      this.oneUserUse,
      this.nameEn,
      this.offer});

  ProductOffer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    offerId = json['offer_id'];
    typeId = json['type_id'];
    priceDiscount = json['price_discount'];
    isFree = json['is_free'];
    percentage = json['percentage'];
    quantity = json['quantity'];
    getQuantity = json['get_quantity'];
    numberOfUsers = json['number_of_users'];
    oneUserUse = json['one_user_use'];
    nameEn = json['name_en'];
    offer = json['offer'] != null ? new Offer.fromJson(json['offer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['offer_id'] = this.offerId;
    data['type_id'] = this.typeId;
    data['price_discount'] = this.priceDiscount;
    data['is_free'] = this.isFree;
    data['percentage'] = this.percentage;
    data['quantity'] = this.quantity;
    data['get_quantity'] = this.getQuantity;
    data['number_of_users'] = this.numberOfUsers;
    data['one_user_use'] = this.oneUserUse;
    data['name_en'] = this.nameEn;
    if (this.offer != null) {
      data['offer'] = this.offer!.toJson();
    }
    return data;
  }
}

class Offer {
  int? id;
  int? typeId;
  int? userId;
  int? status;
  Null priceDiscount;
  int? isFree;
  Null percentage;
  int? quantity;
  int? getQuantity;
  Null offerAr;
  Null offerEn;
  String? startDate;
  String? endDate;
  Null numberOfUsers;
  Null oneUserUse;
  Null deletedAt;
  String? createdAt;
  String? updatedAt;
  String? offerType;

  Offer(
      {this.id,
      this.typeId,
      this.userId,
      this.status,
      this.priceDiscount,
      this.isFree,
      this.percentage,
      this.quantity,
      this.getQuantity,
      this.offerAr,
      this.offerEn,
      this.startDate,
      this.endDate,
      this.numberOfUsers,
      this.oneUserUse,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.offerType});

  Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeId = json['type_id'];
    userId = json['user_id'];
    status = json['status'];
    priceDiscount = json['price_discount'];
    isFree = json['is_free'];
    percentage = json['percentage'];
    quantity = json['quantity'];
    getQuantity = json['get_quantity'];
    offerAr = json['offer_ar'];
    offerEn = json['offer_en'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    numberOfUsers = json['number_of_users'];
    oneUserUse = json['one_user_use'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    offerType = json['offer_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type_id'] = this.typeId;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['price_discount'] = this.priceDiscount;
    data['is_free'] = this.isFree;
    data['percentage'] = this.percentage;
    data['quantity'] = this.quantity;
    data['get_quantity'] = this.getQuantity;
    data['offer_ar'] = this.offerAr;
    data['offer_en'] = this.offerEn;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['number_of_users'] = this.numberOfUsers;
    data['one_user_use'] = this.oneUserUse;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['offer_type'] = this.offerType;
    return data;
  }
}

// class MainStoreModel {
//   int id;
//   String title;
//   String photo;
//   int categoryId;
//   int productId;
//   int clientPrice;
//   int offerPrice;
//   String offerType;
//   int offerTypeId;
//   int quantity;
//   int isLiked;
//   int cartCount;
//   int productRate;
//   int hasTax;
//   String video;
//   List<Photos> photos;
//  //ProductOffer productOffer;
//
//   MainStoreModel(
//       {this.id,
//         this.title,
//         this.photo,
//         this.categoryId,
//         this.productId,
//         this.clientPrice,
//         this.offerPrice,
//         this.offerType,
//         this.offerTypeId,
//         this.quantity,
//         this.isLiked,
//         this.cartCount,
//         this.productRate,
//         this.hasTax,
//         this.video,
//         this.photos,
//       // this.productOffer
//       });
//
//   MainStoreModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     photo = json['photo'];
//     categoryId = json['category_id'];
//     productId = json['product_id'];
//     clientPrice = json['client_price'];
//     offerPrice = json['offer_price'];
//     offerType = json['offer_type'];
//     offerTypeId = json['offer_type_id'];
//     quantity = json['quantity'];
//     isLiked = json['is_liked'];
//     cartCount = json['cart_count'];
//     productRate = json['product_rate'];
//     hasTax = json['has_tax'];
//     video = json['video'];
//     if (json['photos'] != null) {
//       photos = new List<Photos>();
//       json['photos'].forEach((v) {
//         photos.add(new Photos.fromJson(v));
//       });
//     }
//     // productOffer = json['product_offer'] != null
//     //     ? new ProductOffer.fromJson(json['product_offer'])
//     //     : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['photo'] = this.photo;
//     data['category_id'] = this.categoryId;
//     data['product_id'] = this.productId;
//     data['client_price'] = this.clientPrice;
//     data['offer_price'] = this.offerPrice;
//     data['offer_type'] = this.offerType;
//     data['offer_type_id'] = this.offerTypeId;
//     data['quantity'] = this.quantity;
//     data['is_liked'] = this.isLiked;
//     data['cart_count'] = this.cartCount;
//     data['product_rate'] = this.productRate;
//     data['has_tax'] = this.hasTax;
//     data['video'] = this.video;
//     if (this.photos != null) {
//       data['photos'] = this.photos.map((v) => v.toJson()).toList();
//     }
//     // if (this.productOffer != null) {
//     //   data['product_offer'] = this.productOffer.toJson();
//     // }
//     return data;
//   }
// }
//
// class Photos {
//   int id;
//   String photo;
//   int productId;
//   String thumb;
//
//   Photos({this.id, this.photo, this.productId, this.thumb});
//
//   Photos.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     photo = json['photo'];
//     productId = json['product_id'];
//     thumb = json['thumb'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['photo'] = this.photo;
//     data['product_id'] = this.productId;
//     data['thumb'] = this.thumb;
//     return data;
//   }
// }
//
// class ProductOffer {
//   int id;
//   int productId;
//   int offerId;
//   int typeId;
//   String priceDiscount;
//   int isFree;
//   Null percentage;
//   Null quantity;
//   Null getQuantity;
//   int numberOfUsers;
//   int oneUserUse;
//   String nameEn;
//   Offer offer;
//
//   ProductOffer(
//       {this.id,
//         this.productId,
//         this.offerId,
//         this.typeId,
//         this.priceDiscount,
//         this.isFree,
//         this.percentage,
//         this.quantity,
//         this.getQuantity,
//         this.numberOfUsers,
//         this.oneUserUse,
//         this.nameEn,
//         this.offer});
//
//   ProductOffer.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     productId = json['product_id'];
//     offerId = json['offer_id'];
//     typeId = json['type_id'];
//     priceDiscount = json['price_discount'];
//     isFree = json['is_free'];
//     percentage = json['percentage'];
//     quantity = json['quantity'];
//     getQuantity = json['get_quantity'];
//     numberOfUsers = json['number_of_users'];
//     oneUserUse = json['one_user_use'];
//     nameEn = json['name_en'];
//     offer = json['offer'] != null ? new Offer.fromJson(json['offer']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['product_id'] = this.productId;
//     data['offer_id'] = this.offerId;
//     data['type_id'] = this.typeId;
//     data['price_discount'] = this.priceDiscount;
//     data['is_free'] = this.isFree;
//     data['percentage'] = this.percentage;
//     data['quantity'] = this.quantity;
//     data['get_quantity'] = this.getQuantity;
//     data['number_of_users'] = this.numberOfUsers;
//     data['one_user_use'] = this.oneUserUse;
//     data['name_en'] = this.nameEn;
//     if (this.offer != null) {
//       data['offer'] = this.offer.toJson();
//     }
//     return data;
//   }
// }
//
// class Offer {
//   int id;
//   int typeId;
//   int userId;
//   int status;
//   String priceDiscount;
//   int isFree;
//   Null percentage;
//   Null quantity;
//   Null getQuantity;
//   Null offerAr;
//   Null offerEn;
//   String startDate;
//   String endDate;
//   int numberOfUsers;
//   int oneUserUse;
//   Null deletedAt;
//   String createdAt;
//   String updatedAt;
//   String offerType;
//
//   Offer(
//       {this.id,
//         this.typeId,
//         this.userId,
//         this.status,
//         this.priceDiscount,
//         this.isFree,
//         this.percentage,
//         this.quantity,
//         this.getQuantity,
//         this.offerAr,
//         this.offerEn,
//         this.startDate,
//         this.endDate,
//         this.numberOfUsers,
//         this.oneUserUse,
//         this.deletedAt,
//         this.createdAt,
//         this.updatedAt,
//         this.offerType});
//
//   Offer.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     typeId = json['type_id'];
//     userId = json['user_id'];
//     status = json['status'];
//     priceDiscount = json['price_discount'];
//     isFree = json['is_free'];
//     percentage = json['percentage'];
//     quantity = json['quantity'];
//     getQuantity = json['get_quantity'];
//     offerAr = json['offer_ar'];
//     offerEn = json['offer_en'];
//     startDate = json['start_date'];
//     endDate = json['end_date'];
//     numberOfUsers = json['number_of_users'];
//     oneUserUse = json['one_user_use'];
//     deletedAt = json['deleted_at'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     offerType = json['offer_type'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['type_id'] = this.typeId;
//     data['user_id'] = this.userId;
//     data['status'] = this.status;
//     data['price_discount'] = this.priceDiscount;
//     data['is_free'] = this.isFree;
//     data['percentage'] = this.percentage;
//     data['quantity'] = this.quantity;
//     data['get_quantity'] = this.getQuantity;
//     data['offer_ar'] = this.offerAr;
//     data['offer_en'] = this.offerEn;
//     data['start_date'] = this.startDate;
//     data['end_date'] = this.endDate;
//     data['number_of_users'] = this.numberOfUsers;
//     data['one_user_use'] = this.oneUserUse;
//     data['deleted_at'] = this.deletedAt;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['offer_type'] = this.offerType;
//     return data;
//   }
// }
