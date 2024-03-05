class BannerModel {
  String? id;
  String? image;

  BannerModel({
    this.id,
    this.image,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'image': image,
    };
  }

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      image: json['image'],
    );
  }
}
