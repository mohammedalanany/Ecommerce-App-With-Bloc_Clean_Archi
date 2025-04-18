class SlideModel {
  int? id;
  String? title;
  String? description;
  String? updatedAt;
  int? hasLink;
  int? itemType;
  String? name;
  int? itemId;
  String? image;

  SlideModel(
      {this.id,
      this.title,
      this.description,
      this.updatedAt,
      this.hasLink,
      this.itemType,
      this.name,
      this.itemId,
      this.image});

  SlideModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    updatedAt = json['updated_at'];
    hasLink = json['has_link'];
    itemType = json['item_type'];
    name = json['name'];
    itemId = json['item_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['updated_at'] = this.updatedAt;
    data['has_link'] = this.hasLink;
    data['item_type'] = this.itemType;
    data['name'] = this.name;
    data['item_id'] = this.itemId;
    data['image'] = this.image;
    return data;
  }
}
