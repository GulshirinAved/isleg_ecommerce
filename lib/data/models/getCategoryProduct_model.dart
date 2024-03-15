class GetCategoryProduct {
  List<Brend>? brends;
  Category? category;
  int? countOfProducts;
  bool? status;

  GetCategoryProduct({
    this.brends,
    this.category,
    this.countOfProducts,
    this.status,
  });

  factory GetCategoryProduct.fromJson(Map<String, dynamic> json) =>
      GetCategoryProduct(
        brends: json["brends"] == null
            ? []
            : List<Brend>.from(json["brends"]!.map((x) => Brend.fromJson(x))),
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        countOfProducts: json["count_of_products"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "brends": brends == null
            ? []
            : List<dynamic>.from(brends!.map((x) => x.toJson())),
        "category": category?.toJson(),
        "count_of_products": countOfProducts,
        "status": status,
      };
}

class Brend {
  String? id;
  String? name;

  Brend({
    this.id,
    this.name,
  });

  factory Brend.fromJson(Map<String, dynamic> json) => Brend(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Category {
  String? id;
  String? name;
  List<Product>? products;

  Category({
    this.id,
    this.name,
    this.products,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        products: json["products"] == null
            ? []
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {
  String? id;
  String? brendId;
  double? price;
  String? mainImage;
  Brend? brend;
  int? limitAmount;
  int? amount;
  bool? isNew;
  List<Translation>? translations;
  String? code;
  bool? isVisible;

  Product({
    this.id,
    this.brendId,
    this.price,
    this.mainImage,
    this.brend,
    this.limitAmount,
    this.amount,
    this.isNew,
    this.translations,
    this.code,
    this.isVisible,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        brendId: json["brend_id"],
        price: json["price"]?.toDouble(),
        mainImage: json["main_image"],
        brend: json["brend"] == null ? null : Brend.fromJson(json["brend"]),
        limitAmount: json["limit_amount"],
        amount: json["amount"],
        isNew: json["is_new"],
        translations: json["translations"] == null
            ? []
            : List<Translation>.from(
                json["translations"]!.map((x) => Translation.fromJson(x))),
        code: json["code"],
        isVisible: json["is_visible"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brend_id": brendId,
        "price": price,
        "main_image": mainImage,
        "brend": brend?.toJson(),
        "limit_amount": limitAmount,
        "amount": amount,
        "is_new": isNew,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x.toJson())),
        "code": code,
        "is_visible": isVisible,
      };
}

class Translation {
  Ru? ru;
  Ru? tm;

  Translation({
    this.ru,
    this.tm,
  });

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        ru: json["ru"] == null ? null : Ru.fromJson(json["ru"]),
        tm: json["tm"] == null ? null : Ru.fromJson(json["tm"]),
      );

  Map<String, dynamic> toJson() => {
        "ru": ru?.toJson(),
        "tm": tm?.toJson(),
      };
}

class Ru {
  String? name;
  String? description;

  Ru({
    this.name,
    this.description,
  });

  factory Ru.fromJson(Map<String, dynamic> json) => Ru(
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
      };
}
