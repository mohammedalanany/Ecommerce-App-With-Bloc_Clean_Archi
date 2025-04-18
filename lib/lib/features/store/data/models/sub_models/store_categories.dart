class StoreCategoriesModel {
  int? id;
  String? name;
  String? photo;
  List<StoreSubCategories>? subCategories;

  StoreCategoriesModel({this.id, this.name, this.photo, this.subCategories});

  StoreCategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    if (json['sub_categories'] != null) {
      subCategories = <StoreSubCategories>[];
      json['sub_categories'].forEach((v) {
        subCategories!.add(new StoreSubCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['photo'] = this.photo;
    if (this.subCategories != null) {
      data['sub_categories'] =
          this.subCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StoreSubCategories {
  int? id;
  String? name;
  int? categoryId;
  String? photo;

  StoreSubCategories({this.id, this.name, this.categoryId, this.photo});

  StoreSubCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category_id'] = this.categoryId;
    data['photo'] = this.photo;
    return data;
  }
}
