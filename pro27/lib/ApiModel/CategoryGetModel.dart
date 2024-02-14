class CategoryGet {
  String? sId;
  String? categoryName;
  String? categoryImage;

  CategoryGet({this.sId, this.categoryName, this.categoryImage});

  CategoryGet.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['category_name'] = this.categoryName;
    data['category_image'] = this.categoryImage;
    return data;
  }
}