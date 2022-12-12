class ProductDetails {
  String? message;
  ProuData? data;

  ProductDetails({this.message, this.data});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    data = json['Data'] != null ? new ProuData.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProuData {
  ProdDetails? prodDetails;
  List<ProdImages>? prodImages;
  List<SpecDetails>? specDetails;
  List<CatList>? catList;

  ProuData({this.prodDetails, this.prodImages, this.specDetails, this.catList});

  ProuData.fromJson(Map<String, dynamic> json) {
    prodDetails = json['ProdDetails'] != null
        ? new ProdDetails.fromJson(json['ProdDetails'])
        : null;
    if (json['ProdImages'] != null) {
      prodImages = [];
      json['ProdImages'].forEach((v) {
        prodImages?.add(new ProdImages.fromJson(v));
      });
    }
    if (json['specDetails'] != null) {
      specDetails = [];
      json['specDetails'].forEach((v) {
        specDetails!.add(new SpecDetails.fromJson(v));
      });
    }
    if (json['catList'] != null) {
      catList = [];
      json['catList'].forEach((v) {
        catList?.add(new CatList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.prodDetails != null) {
      data['ProdDetails'] = this.prodDetails?.toJson();
    }
    if (this.prodImages != null) {
      data['ProdImages'] = this.prodImages?.map((v) => v.toJson()).toList();
    }
    if (this.specDetails != null) {
      data['specDetails'] = this.specDetails?.map((v) => v.toJson()).toList();
    }
    if (this.catList != null) {
      data['catList'] = this.catList?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProdDetails {
  String? venderName;
  dynamic venderDetails;
  String? vendorUrlKey;
  String? catName;
  String? imageUrl;
  String? catUrlKey;
  // int? catId;
  // int? cartItemQty;
  bool? isWishlisted;
  bool? isCarted;
  bool? isAvailPincode;
  // int? isReviewCount;
  // int? reviewstatus;
  // int? isReviewAvgrating;
  // int? productId;
  // int? vendorid;
  String? prDate;
  dynamic actDate;
  String? prName;
  String? sku;
  // int? unitPrice;
  String? description;
  String? shortDescription;
  String? urlKey;
  String? metaTitle;
  String? metaKeywords;
  String? metaDescription;
  bool? status;
  // int? qoh;
  // int? rank;
  dynamic availableFrom;
  dynamic availableTo;
  dynamic suspendedDate;
  dynamic newDate;
  dynamic delDate;
  // int? maxQtyInOrders;
  // int? soldQty;
  String? stockAvailability;
  bool? backOrders;
  // int? rol;
  // int? roq;
  dynamic parentId;
  // int? specialPrice;
  dynamic attributeSetId;
  dynamic pincodeSetId;
  String? prWeight;
  dynamic taxClassId;
  dynamic cessAmount;
  dynamic featuredImage;
  dynamic avgRating;
  dynamic reviewCount;
  String? dealFrom;
  String? dealTo;
  dynamic erpRefNo;
  dynamic productType;
  dynamic variationJson;
  dynamic bsl;
  dynamic prWeightMfactor;
  dynamic markupPercentage;
  String? productLabel;
  String? backgroundColorCode;
  dynamic isNew;
  dynamic costPrice;
  dynamic erpCat;
  dynamic prwmf;
  List<dynamic>? cartItems;
  List<dynamic>? keywords;
  dynamic taxClass;
  List<Null>? productCategories;
  List<Null>? productImages;
  List<Null>? productPincodes;
  dynamic vendor;
  List<Null>? productViews;
  List<Null>? reviews;
  List<Null>? saveForLaters;
  List<Null>? wishLists;

  ProdDetails(
      {this.venderName,
      this.venderDetails,
      this.vendorUrlKey,
      this.catName,
      this.imageUrl,
      this.catUrlKey,
      // this.catId,
      // this.cartItemQty,
      this.isWishlisted,
      this.isCarted,
      this.isAvailPincode,
      // this.isReviewCount,
      // this.reviewstatus,
      // this.isReviewAvgrating,
      // this.productId,
      // this.vendorid,
      this.prDate,
      this.actDate,
      this.prName,
      this.sku,
      // this.unitPrice,
      this.description,
      this.shortDescription,
      this.urlKey,
      this.metaTitle,
      this.metaKeywords,
      this.metaDescription,
      this.status,
      // this.qoh,
      // this.rank,
      this.availableFrom,
      this.availableTo,
      this.suspendedDate,
      this.newDate,
      this.delDate,
      // this.maxQtyInOrders,
      // this.soldQty,
      this.stockAvailability,
      this.backOrders,
      // this.rol,
      // this.roq,
      this.parentId,
      // this.specialPrice,
      this.attributeSetId,
      this.pincodeSetId,
      this.prWeight,
      this.taxClassId,
      this.cessAmount,
      this.featuredImage,
      this.avgRating,
      this.reviewCount,
      this.dealFrom,
      this.dealTo,
      this.erpRefNo,
      this.productType,
      this.variationJson,
      this.bsl,
      this.prWeightMfactor,
      this.markupPercentage,
      this.productLabel,
      this.backgroundColorCode,
      this.isNew,
      this.costPrice,
      this.erpCat,
      this.prwmf,
      this.cartItems,
      this.keywords,
      this.taxClass,
      this.productCategories,
      this.productImages,
      this.productPincodes,
      this.vendor,
      this.productViews,
      this.reviews,
      this.saveForLaters,
      this.wishLists});

  ProdDetails.fromJson(Map<String, dynamic> json) {
    venderName = json['venderName'];
    venderDetails = json['venderDetails'];
    vendorUrlKey = json['vendorUrlKey'];
    catName = json['catName'];
    imageUrl = json['imageUrl'];
    catUrlKey = json['catUrlKey'];
    // catId = json['catId'];
    // cartItemQty = json['CartItemQty'];
    isWishlisted = json['IsWishlisted'];
    isCarted = json['IsCarted'];
    isAvailPincode = json['IsAvailPincode'];
    // isReviewCount = json['IsReviewCount'];
    // reviewstatus = json['Reviewstatus'];
    // isReviewAvgrating = json['IsReviewAvgrating'];
    // productId = json['productId'];
    // vendorid = json['vendorid'];
    prDate = json['prDate'];
    actDate = json['actDate'];
    prName = json['prName'];
    sku = json['sku'];
    // unitPrice = json['unitPrice'];
    description = json['description'];
    shortDescription = json['shortDescription'];
    urlKey = json['urlKey'];
    metaTitle = json['metaTitle'];
    metaKeywords = json['metaKeywords'];
    metaDescription = json['metaDescription'];
    status = json['status'];
    // qoh = json['qoh'];
    // rank = json['rank'];
    availableFrom = json['availableFrom'];
    availableTo = json['availableTo'];
    suspendedDate = json['suspendedDate'];
    newDate = json['newDate'];
    delDate = json['delDate'];
    // maxQtyInOrders = json['maxQtyInOrders'];
    // soldQty = json['soldQty'];
    stockAvailability = json['stockAvailability'];
    backOrders = json['backOrders'];
    // rol = json['rol'];
    // roq = json['roq'];
    parentId = json['parentId'];
    // specialPrice = json['specialPrice'];
    attributeSetId = json['attributeSetId'];
    pincodeSetId = json['pincodeSetId'];
    prWeight = json['prWeight'];
    taxClassId = json['taxClassId'];
    cessAmount = json['cessAmount'];
    featuredImage = json['featuredImage'];
    avgRating = json['avgRating'];
    reviewCount = json['reviewCount'];
    dealFrom = json['dealFrom'];
    dealTo = json['dealTo'];
    erpRefNo = json['erpRefNo'];
    productType = json['productType'];
    variationJson = json['variationJson'];
    bsl = json['bsl'];
    prWeightMfactor = json['prWeightMfactor'];
    markupPercentage = json['markupPercentage'];
    productLabel = json['productLabel'];
    backgroundColorCode = json['backgroundColorCode'];
    isNew = json['isNew'];
    costPrice = json['costPrice'];
    erpCat = json['erpCat'];
    prwmf = json['prwmf'];
    // if (json['CartItems'] != null) {
    //   cartItems = [];
    //   json['CartItems'].forEach((v) {
    //     cartItems?.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['Keywords'] != null) {
    //   keywords = new List<Null>();
    //   json['Keywords'].forEach((v) {
    //     keywords.add(new Null.fromJson(v));
    //   });
    // }
    // taxClass = json['TaxClass'];
    // if (json['ProductCategories'] != null) {
    //   productCategories = new List<Null>();
    //   json['ProductCategories'].forEach((v) {
    //     productCategories.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['ProductImages'] != null) {
    //   productImages = new List<Null>();
    //   json['ProductImages'].forEach((v) {
    //     productImages.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['ProductPincodes'] != null) {
    //   productPincodes = new List<Null>();
    //   json['ProductPincodes'].forEach((v) {
    //     productPincodes.add(new Null.fromJson(v));
    //   });
    // }
    // vendor = json['Vendor'];
    // if (json['ProductViews'] != null) {
    //   productViews = new List<Null>();
    //   json['ProductViews'].forEach((v) {
    //     productViews.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['Reviews'] != null) {
    //   reviews = new List<Null>();
    //   json['Reviews'].forEach((v) {
    //     reviews.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['SaveForLaters'] != null) {
    //   saveForLaters = new List<Null>();
    //   json['SaveForLaters'].forEach((v) {
    //     saveForLaters.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['WishLists'] != null) {
    //   wishLists = new List<Null>();
    //   json['WishLists'].forEach((v) {
    //     wishLists.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['venderName'] = this.venderName;
    data['venderDetails'] = this.venderDetails;
    data['vendorUrlKey'] = this.vendorUrlKey;
    data['catName'] = this.catName;
    data['imageUrl'] = this.imageUrl;
    data['catUrlKey'] = this.catUrlKey;
    // data['catId'] = this.catId;
    // data['CartItemQty'] = this.cartItemQty;
    data['IsWishlisted'] = this.isWishlisted;
    data['IsCarted'] = this.isCarted;
    data['IsAvailPincode'] = this.isAvailPincode;
    // data['IsReviewCount'] = this.isReviewCount;
    // data['Reviewstatus'] = this.reviewstatus;
    // data['IsReviewAvgrating'] = this.isReviewAvgrating;
    // data['productId'] = this.productId;
    // data['vendorid'] = this.vendorid;
    data['prDate'] = this.prDate;
    data['actDate'] = this.actDate;
    data['prName'] = this.prName;
    data['sku'] = this.sku;
    // data['unitPrice'] = this.unitPrice;
    data['description'] = this.description;
    data['shortDescription'] = this.shortDescription;
    data['urlKey'] = this.urlKey;
    data['metaTitle'] = this.metaTitle;
    data['metaKeywords'] = this.metaKeywords;
    data['metaDescription'] = this.metaDescription;
    data['status'] = this.status;
    // data['qoh'] = this.qoh;
    // data['rank'] = this.rank;
    data['availableFrom'] = this.availableFrom;
    data['availableTo'] = this.availableTo;
    data['suspendedDate'] = this.suspendedDate;
    data['newDate'] = this.newDate;
    data['delDate'] = this.delDate;
    // data['maxQtyInOrders'] = this.maxQtyInOrders;
    // data['soldQty'] = this.soldQty;
    data['stockAvailability'] = this.stockAvailability;
    data['backOrders'] = this.backOrders;
    // data['rol'] = this.rol;
    // data['roq'] = this.roq;
    data['parentId'] = this.parentId;
    // data['specialPrice'] = this.specialPrice;
    data['attributeSetId'] = this.attributeSetId;
    data['pincodeSetId'] = this.pincodeSetId;
    data['prWeight'] = this.prWeight;
    data['taxClassId'] = this.taxClassId;
    data['cessAmount'] = this.cessAmount;
    data['featuredImage'] = this.featuredImage;
    data['avgRating'] = this.avgRating;
    data['reviewCount'] = this.reviewCount;
    data['dealFrom'] = this.dealFrom;
    data['dealTo'] = this.dealTo;
    data['erpRefNo'] = this.erpRefNo;
    data['productType'] = this.productType;
    data['variationJson'] = this.variationJson;
    data['bsl'] = this.bsl;
    data['prWeightMfactor'] = this.prWeightMfactor;
    data['markupPercentage'] = this.markupPercentage;
    data['productLabel'] = this.productLabel;
    data['backgroundColorCode'] = this.backgroundColorCode;
    data['isNew'] = this.isNew;
    data['costPrice'] = this.costPrice;
    data['erpCat'] = this.erpCat;
    data['prwmf'] = this.prwmf;
    // if (this.cartItems != null) {
    //   data['CartItems'] = this.cartItems.map((v) => v.toJson()).toList();
    // }
    // if (this.keywords != null) {
    //   data['Keywords'] = this.keywords.map((v) => v.toJson()).toList();
    // }
    // data['TaxClass'] = this.taxClass;
    // if (this.productCategories != null) {
    //   data['ProductCategories'] =
    //       this.productCategories.map((v) => v.toJson()).toList();
    // }
    // if (this.productImages != null) {
    //   data['ProductImages'] =
    //       this.productImages.map((v) => v.toJson()).toList();
    // }
    // if (this.productPincodes != null) {
    //   data['ProductPincodes'] =
    //       this.productPincodes.map((v) => v.toJson()).toList();
    // }
    // data['Vendor'] = this.vendor;
    // if (this.productViews != null) {
    //   data['ProductViews'] = this.productViews.map((v) => v.toJson()).toList();
    // }
    // if (this.reviews != null) {
    //   data['Reviews'] = this.reviews.map((v) => v.toJson()).toList();
    // }
    // if (this.saveForLaters != null) {
    //   data['SaveForLaters'] =
    //       this.saveForLaters.map((v) => v.toJson()).toList();
    // }
    // if (this.wishLists != null) {
    //   data['WishLists'] = this.wishLists.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class ProdImages {
  String? imageUrl;
  String? position;
  String? imgType;

  ProdImages({this.imageUrl, this.position, this.imgType});

  ProdImages.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    position = json['position'];
    imgType = json['imgType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['position'] = this.position;
    data['imgType'] = this.imgType;
    return data;
  }
}

class SpecDetails {
  String? attrName;
  String? attrValue;
  int? displayPosition;

  SpecDetails({this.attrName, this.attrValue, this.displayPosition});

  SpecDetails.fromJson(Map<String, dynamic> json) {
    attrName = json['attrName'];
    attrValue = json['attrValue'];
    displayPosition = json['displayPosition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attrName'] = this.attrName;
    data['attrValue'] = this.attrValue;
    data['displayPosition'] = this.displayPosition;
    return data;
  }
}

class CatList {
  int? catId;
  String? catName;
  String? catUrlKey;

  CatList({this.catId, this.catName, this.catUrlKey});

  CatList.fromJson(Map<String, dynamic> json) {
    catId = json['catId'];
    catName = json['catName'];
    catUrlKey = json['catUrlKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['catId'] = this.catId;
    data['catName'] = this.catName;
    data['catUrlKey'] = this.catUrlKey;
    return data;
  }
}
