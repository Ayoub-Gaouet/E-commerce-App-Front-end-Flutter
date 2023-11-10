class ItemsViewModel {
  int? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemDescription;
  String? itemDescriptionAr;
  String? itemImage;
  int? itemCount;
  int? itemActive;
  int? itemPrice;
  int? itemDiscount;
  int? itemCategoryId;
  String? itemCreatedAt;
  String? itemUpdatedAt;
  int? categoryId;
  String? categoryName;
  String? categoryNameAr;
  String? categoryImage;
  String? categoryCreatedAt;
  String? categoryUpdatedAt;
  int? favorite;
  int? itemPriceDiscount;

  ItemsViewModel(
      {this.itemId,
        this.itemName,
        this.itemNameAr,
        this.itemDescription,
        this.itemDescriptionAr,
        this.itemImage,
        this.itemCount,
        this.itemActive,
        this.itemPrice,
        this.itemDiscount,
        this.itemCategoryId,
        this.itemCreatedAt,
        this.itemUpdatedAt,
        this.categoryId,
        this.categoryName,
        this.categoryNameAr,
        this.categoryImage,
        this.categoryCreatedAt,
        this.categoryUpdatedAt,
        this.favorite,
        this.itemPriceDiscount
      });

  ItemsViewModel.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemNameAr = json['item_name_ar'];
    itemDescription = json['item_description'];
    itemDescriptionAr = json['item_description_ar'];
    itemImage = json['item_image'];
    itemCount = json['item_count'];
    itemActive = json['item_active'];
    itemPrice = json['item_price'];
    itemDiscount = json['item_discount'];
    itemCategoryId = json['item_category_id'];
    itemCreatedAt = json['item_created_at'];
    itemUpdatedAt = json['item_updated_at'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryNameAr = json['category_name_ar'];
    categoryImage = json['category_image'];
    categoryCreatedAt = json['category_created_at'];
    categoryUpdatedAt = json['category_updated_at'];
    favorite = json['favorite'];
    itemPriceDiscount =json['itemspricediscount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = this.itemId;
    data['item_name'] = this.itemName;
    data['item_name_ar'] = this.itemNameAr;
    data['item_description'] = this.itemDescription;
    data['item_description_ar'] = this.itemDescriptionAr;
    data['item_image'] = this.itemImage;
    data['item_count'] = this.itemCount;
    data['item_active'] = this.itemActive;
    data['item_price'] = this.itemPrice;
    data['item_discount'] = this.itemDiscount;
    data['item_category_id'] = this.itemCategoryId;
    data['item_created_at'] = this.itemCreatedAt;
    data['item_updated_at'] = this.itemUpdatedAt;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['category_name_ar'] = this.categoryNameAr;
    data['category_image'] = this.categoryImage;
    data['category_created_at'] = this.categoryCreatedAt;
    data['category_updated_at'] = this.categoryUpdatedAt;
    data['favorite'] = this.favorite;
    data['itemspricediscount'] = this.itemPriceDiscount;
    return data;
  }
}