class ProductModel {
  String? message;
  Data? data;

  ProductModel({this.message, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    if (this.data != null) {
      data['Data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  // List<Null> mainBanners;
  List<MobileMainBanners>? mobileMainBanners;
  List<TopCategories>? topCategories;
  // List<Null> promo21;
  // List<Null> promoFull;
  // // List<MobilePromoFull> mobilePromoFull;
  // // List<Null> banner25;
  // // List<Null> banner75;
  // // List<Null> promo1in2x4;
  // // List<Null> bannermiddle;
  // List<Category4in1x2> category4in1x2;
  // List<Category4in1> category4in1;
  // // List<Category5in1x2> category5in1x2;
  // Null loginImg;
  // List<MobileOfferZoneBanners>? mobileOfferZoneBanners;

  Data({
    // this.mainBanners,
    this.mobileMainBanners,
    this.topCategories,
    // this.promo21,
    // this.promoFull,
    // this.mobilePromoFull,
    // this.banner25,
    // this.banner75,
    // this.promo1in2x4,
    // this.bannermiddle,
    // this.category4in1x2,
    // this.category4in1,
    // this.category5in1x2,
    // this.loginImg,
    // this.mobileOfferZoneBanners
  });

  Data.fromJson(Map<String, dynamic> json) {
    // if (json['MainBanners'] != null) {
    //   mainBanners = new List<Null>();
    //   json['MainBanners'].forEach((v) {
    //     mainBanners.add(new Null.fromJson(v));
    //   });
    // }
    if (json['MobileMainBanners'] != null) {
      mobileMainBanners = [];
      json['MobileMainBanners'].forEach((v) {
        mobileMainBanners?.add(new MobileMainBanners.fromJson(v));
      });
    }
    if (json['TopCategories'] != null) {
      // ignore: deprecated_member_use
      topCategories = [];
      json['TopCategories'].forEach((v) {
        topCategories?.add(new TopCategories.fromJson(v));
      });
    }
    // if (json['Promo21'] != null) {
    //   promo21 = new List<Null>();
    //   json['Promo21'].forEach((v) {
    //     promo21.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['PromoFull'] != null) {
    //   promoFull = new List<Null>();
    //   json['PromoFull'].forEach((v) {
    //     promoFull.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['MobilePromoFull'] != null) {
    //   mobilePromoFull = new List<MobilePromoFull>();
    //   json['MobilePromoFull'].forEach((v) {
    //     mobilePromoFull.add(new MobilePromoFull.fromJson(v));
    //   });
    // }
    // if (json['banner25'] != null) {
    //   banner25 = new List<Null>();
    //   json['banner25'].forEach((v) {
    //     banner25.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['banner75'] != null) {
    //   banner75 = new List<Null>();
    //   json['banner75'].forEach((v) {
    //     banner75.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['promo1in2x4'] != null) {
    //   promo1in2x4 = new List<Null>();
    //   json['promo1in2x4'].forEach((v) {
    //     promo1in2x4.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['bannermiddle'] != null) {
    //   bannermiddle = new List<Null>();
    //   json['bannermiddle'].forEach((v) {
    //     bannermiddle.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['Category4in1x2'] != null) {
    //   category4in1x2 = new List<Category4in1x2>();
    //   json['Category4in1x2'].forEach((v) {
    //     category4in1x2.add(new Category4in1x2.fromJson(v));
    //   });
    // }
    // if (json['Category4in1'] != null) {
    //   category4in1 = new List<Category4in1>();
    //   json['Category4in1'].forEach((v) {
    //     category4in1.add(new Category4in1.fromJson(v));
    //   });
    // }
    // if (json['Category5in1x2'] != null) {
    //   category5in1x2 = new List<Category5in1x2>();
    //   json['Category5in1x2'].forEach((v) {
    //     category5in1x2.add(new Category5in1x2.fromJson(v));
    //   });
    // }
    // loginImg = json['loginImg'];
    // if (json['MobileOfferZoneBanners'] != null) {
    //   mobileOfferZoneBanners = [];
    //   json['MobileOfferZoneBanners'].forEach((v) {
    //     mobileOfferZoneBanners!.add( MobileOfferZoneBanners.fromJson(v));
    //   });
    //}
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // if (this.mainBanners != null) {
    //   data['MainBanners'] = this.mainBanners.map((v) => v.toJson()).toList();
    // }
    if (this.mobileMainBanners != null) {
      data['MobileMainBanners'] =
          this.mobileMainBanners?.map((v) => v.toJson()).toList();
    }
    if (this.topCategories != null) {
      data['TopCategories'] =
          this.topCategories?.map((v) => v.toJson()).toList();
    }
    // if (this.promo21 != null) {
    //   data['Promo21'] = this.promo21.map((v) => v.toJson()).toList();
    // }
    // if (this.promoFull != null) {
    //   data['PromoFull'] = this.promoFull.map((v) => v.toJson()).toList();
    // }
    // if (this.mobilePromoFull != null) {
    //   data['MobilePromoFull'] =
    //       this.mobilePromoFull.map((v) => v.toJson()).toList();
    // }
    // if (this.banner25 != null) {
    //   data['banner25'] = this.banner25.map((v) => v.toJson()).toList();
    // }
    // if (this.banner75 != null) {
    //   data['banner75'] = this.banner75.map((v) => v.toJson()).toList();
    // }
    // if (this.promo1in2x4 != null) {
    //   data['promo1in2x4'] = this.promo1in2x4.map((v) => v.toJson()).toList();
    // }
    // if (this.bannermiddle != null) {
    //   data['bannermiddle'] = this.bannermiddle.map((v) => v.toJson()).toList();
    // }
    // if (this.category4in1x2 != null) {
    //   data['Category4in1x2'] =
    //       this.category4in1x2.map((v) => v.toJson()).toList();
    // }
    // if (this.category4in1 != null) {
    //   data['Category4in1'] = this.category4in1.map((v) => v.toJson()).toList();
    // }
    // if (this.category5in1x2 != null) {
    //   data['Category5in1x2'] =
    //       this.category5in1x2.map((v) => v.toJson()).toList();
    // }
    // data['loginImg'] = this.loginImg;
    // if (this.mobileOfferZoneBanners != null) {
    //   data['MobileOfferZoneBanners'] =
    //       this.mobileOfferZoneBanners.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class MobileMainBanners {
  int? teId;
  String? elementName;
  String? imageUrl;
  int? position;
  bool? status;
  dynamic delDate;
  String? link;
  String? mobUrlKey;
  String? mobType;

  MobileMainBanners(
      {this.teId,
      this.elementName,
      this.imageUrl,
      this.position,
      this.status,
      this.delDate,
      this.link,
      this.mobUrlKey,
      this.mobType});

  MobileMainBanners.fromJson(Map<String, dynamic> json) {
    teId = json['teId'];
    elementName = json['elementName'];
    imageUrl = json['imageUrl'];
    position = json['position'];
    status = json['status'];
    delDate = json['delDate'];
    link = json['Link'];
    mobUrlKey = json['mob_urlKey'];
    mobType = json['mob_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teId'] = this.teId;
    data['elementName'] = this.elementName;
    data['imageUrl'] = this.imageUrl;
    data['position'] = this.position;
    data['status'] = this.status;
    data['delDate'] = this.delDate;
    data['Link'] = this.link;
    data['mob_urlKey'] = this.mobUrlKey;
    data['mob_type'] = this.mobType;
    return data;
  }
}

class TopCategories {
  int? catId;
  String? catName;
  String? image;
  int? parentId;
  String? code;
  dynamic description;
  dynamic urlKey;
  dynamic metaTitle;
  dynamic metaKeywords;
  dynamic metaDescription;
  dynamic delDate;
  dynamic status;
  String? catUrlKey;
  String? imageUrl;
  int? position;
  String? bannerImgUrl;
  bool? showinofferZone;
  dynamic mobBannerImgUrl;
  dynamic tag;
  String? catOfferImg;
  List<dynamic>? categoryCommissionSlabs;
  List<dynamic>? productCategories;

  TopCategories(
      {this.catId,
      this.catName,
      this.image,
      this.parentId,
      this.code,
      this.description,
      this.urlKey,
      this.metaTitle,
      this.metaKeywords,
      this.metaDescription,
      this.delDate,
      this.status,
      this.catUrlKey,
      this.imageUrl,
      this.position,
      this.bannerImgUrl,
      this.showinofferZone,
      this.mobBannerImgUrl,
      this.tag,
      this.catOfferImg,
      this.categoryCommissionSlabs,
      this.productCategories});

  TopCategories.fromJson(Map<String, dynamic> json) {
    catId = json['catId'];
    catName = json['catName'];
    image = json['image'];
    parentId = json['parentId'];
    code = json['code'];
    description = json['description'];
    urlKey = json['urlKey'];
    metaTitle = json['metaTitle'];
    metaKeywords = json['metaKeywords'];
    metaDescription = json['metaDescription'];
    delDate = json['delDate'];
    status = json['status'];
    catUrlKey = json['catUrlKey'];
    imageUrl = json['imageUrl'];
    position = json['position'];
    bannerImgUrl = json['bannerImgUrl'];
    showinofferZone = json['showinofferZone'];
    mobBannerImgUrl = json['MobBannerImgUrl'];
    tag = json['tag'];
    catOfferImg = json['catOfferImg'];
    // if (json['CategoryCommissionSlabs'] != null) {
    //   categoryCommissionSlabs = [];
    //   json['CategoryCommissionSlabs'].forEach((v) {
    //     categoryCommissionSlabs?.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['ProductCategories'] != null) {
    //   productCategories = new List<Null>();
    //   json['ProductCategories'].forEach((v) {
    //     productCategories.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['catId'] = this.catId;
    data['catName'] = this.catName;
    data['image'] = this.image;
    data['parentId'] = this.parentId;
    data['code'] = this.code;
    data['description'] = this.description;
    data['urlKey'] = this.urlKey;
    data['metaTitle'] = this.metaTitle;
    data['metaKeywords'] = this.metaKeywords;
    data['metaDescription'] = this.metaDescription;
    data['delDate'] = this.delDate;
    data['status'] = this.status;
    data['catUrlKey'] = this.catUrlKey;
    data['imageUrl'] = this.imageUrl;
    data['position'] = this.position;
    data['bannerImgUrl'] = this.bannerImgUrl;
    data['showinofferZone'] = this.showinofferZone;
    data['MobBannerImgUrl'] = this.mobBannerImgUrl;
    data['tag'] = this.tag;
    data['catOfferImg'] = this.catOfferImg;
    if (this.categoryCommissionSlabs != null) {
      data['CategoryCommissionSlabs'] =
          this.categoryCommissionSlabs?.map((v) => v.toJson()).toList();
    }
    if (this.productCategories != null) {
      data['ProductCategories'] =
          this.productCategories?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category4in1x2 {
  int? elementId;
  String? elementName;
  String? catname;
  String? catUrlKey;
  String? imageUrl;
  int? catid;
  int? main;
  int? position;
  dynamic status;
  String? catOfferImg;

  Category4in1x2(
      {this.elementId,
      this.elementName,
      this.catname,
      this.catUrlKey,
      this.imageUrl,
      this.catid,
      this.main,
      this.position,
      this.status,
      this.catOfferImg});

  Category4in1x2.fromJson(Map<String, dynamic> json) {
    elementId = json['elementId'];
    elementName = json['elementName'];
    catname = json['catname'];
    catUrlKey = json['catUrlKey'];
    imageUrl = json['imageUrl'];
    catid = json['catid'];
    main = json['main'];
    position = json['position'];
    status = json['status'];
    catOfferImg = json['catOfferImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['elementId'] = this.elementId;
    data['elementName'] = this.elementName;
    data['catname'] = this.catname;
    data['catUrlKey'] = this.catUrlKey;
    data['imageUrl'] = this.imageUrl;
    data['catid'] = this.catid;
    data['main'] = this.main;
    data['position'] = this.position;
    data['status'] = this.status;
    data['catOfferImg'] = this.catOfferImg;
    return data;
  }
}

// class Category4in1 {
//   int elementId;
//   String elementName;
//   String catname;
//   String catUrlKey;
//   String imageUrl;
//   int catid;
//   Null main;
//   int position;
//   bool status;
//   String catOfferImg;

//   Category4in1(
//       {this.elementId,
//       this.elementName,
//       this.catname,
//       this.catUrlKey,
//       this.imageUrl,
//       this.catid,
//       this.main,
//       this.position,
//       this.status,
//       this.catOfferImg});

//   Category4in1.fromJson(Map<String, dynamic> json) {
//     elementId = json['elementId'];
//     elementName = json['elementName'];
//     catname = json['catname'];
//     catUrlKey = json['catUrlKey'];
//     imageUrl = json['imageUrl'];
//     catid = json['catid'];
//     main = json['main'];
//     position = json['position'];
//     status = json['status'];
//     catOfferImg = json['catOfferImg'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['elementId'] = this.elementId;
//     data['elementName'] = this.elementName;
//     data['catname'] = this.catname;
//     data['catUrlKey'] = this.catUrlKey;
//     data['imageUrl'] = this.imageUrl;
//     data['catid'] = this.catid;
//     data['main'] = this.main;
//     data['position'] = this.position;
//     data['status'] = this.status;
//     data['catOfferImg'] = this.catOfferImg;
//     return data;
//   }
//}



