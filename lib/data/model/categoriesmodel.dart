class CategoriesModel {
  int? id;
  String? name;
  String? nameAr;
  String? image;
  String? createdAt;
  String? updatedAt;

  CategoriesModel(
      {this.id,
        this.name,
        this.nameAr,
        this.image,
        this.createdAt,
        this.updatedAt});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}