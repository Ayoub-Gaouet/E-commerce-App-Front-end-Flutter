class MyFavoriteModel {
  int? favoriteId;
  int? favoriteUsersId;
  int? favoriteItemsId;
  String? favoriteCreatedAt;
  String? favoriteUpdatedAt;
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
  int? usersId;

  MyFavoriteModel(
      {this.favoriteId,
        this.favoriteUsersId,
        this.favoriteItemsId,
        this.favoriteCreatedAt,
        this.favoriteUpdatedAt,
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
        this.updatedAt,
        this.usersId});

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUsersId = json['favorite_users_id'];
    favoriteItemsId = json['favorite_items_id'];
    favoriteCreatedAt = json['favorite_created_at'];
    favoriteUpdatedAt = json['favorite_updated_at'];
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
    usersId = json['users_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['favorite_users_id'] = this.favoriteUsersId;
    data['favorite_items_id'] = this.favoriteItemsId;
    data['favorite_created_at'] = this.favoriteCreatedAt;
    data['favorite_updated_at'] = this.favoriteUpdatedAt;
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
    data['users_id'] = this.usersId;
    return data;
  }
}