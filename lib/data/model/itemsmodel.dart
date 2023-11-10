class ItemsModel {
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
  String? imagePath;
  Category? category;

  ItemsModel(
      {this.id,
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
        this.imagePath,
        this.category});

  ItemsModel.fromJson(Map<String, dynamic> json) {
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
    imagePath = json['image_path'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['image_path'] = this.imagePath;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? nameAr;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? imagePath;

  Category(
      {this.id,
        this.name,
        this.nameAr,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.imagePath});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_path'] = this.imagePath;
    return data;
  }
}