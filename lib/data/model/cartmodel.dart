class CartModel {
  int? itemsprice;
  int? countitems;
  int? cartId;
  int? cartUsersId;
  int? cartItemsId;
  String? cartCreatedAt;
  String? cartUpdatedAt;
  int? id;
  String? name;
  String? nameAr;
  String? description;
  String? descriptionAr;
  String? image;
  int? count;
  int? active;
  int? price;
  int? discount;
  int? categoryId;
  String? createdAt;
  String? updatedAt;

  CartModel(
      {this.itemsprice,
        this.countitems,
        this.cartId,
        this.cartUsersId,
        this.cartItemsId,
        this.cartCreatedAt,
        this.cartUpdatedAt,
        this.id,
        this.name,
        this.nameAr,
        this.description,
        this.descriptionAr,
        this.image,
        this.count,
        this.active,
        this.price,
        this.discount,
        this.categoryId,
        this.createdAt,
        this.updatedAt});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemsprice = json['itemsprice'];
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartUsersId = json['cart_users_id'];
    cartItemsId = json['cart_items_id'];
    cartCreatedAt = json['cart_created_at'];
    cartUpdatedAt = json['cart_updated_at'];
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    image = json['image'];
    count = json['count'];
    active = json['active'];
    price = json['price'];
    discount = json['discount'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsprice'] = this.itemsprice;
    data['countitems'] = this.countitems;
    data['cart_id'] = this.cartId;
    data['cart_users_id'] = this.cartUsersId;
    data['cart_items_id'] = this.cartItemsId;
    data['cart_created_at'] = this.cartCreatedAt;
    data['cart_updated_at'] = this.cartUpdatedAt;
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['description'] = this.description;
    data['description_ar'] = this.descriptionAr;
    data['image'] = this.image;
    data['count'] = this.count;
    data['active'] = this.active;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}