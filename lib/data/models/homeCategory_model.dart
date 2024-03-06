class HomeCategoryModel {
  String? id;
  String? name;
  List<Product>? products;

  HomeCategoryModel({
    this.id,
    this.name,
    this.products,
  });

  factory HomeCategoryModel.fromJson(Map<String, dynamic> json) =>
      HomeCategoryModel(
        id: json['id'],
        name: json['name'],
        products: json['products'] == null
            ? []
            : List<Product>.from(
                json['products']!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'products': products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {
  String? id;
  double? price;
  String? mainImage;
  Brend? brend;
  int? limitAmount;
  int? amount;
  List<Translation>? translations;

  Product({
    this.id,
    this.price,
    this.mainImage,
    this.brend,
    this.limitAmount,
    this.amount,
    this.translations,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        price: json['price']?.toDouble(),
        mainImage: json['main_image'],
        brend: json['brend'] == null ? null : Brend.fromJson(json['brend']),
        limitAmount: json['limit_amount'],
        amount: json['amount'],
        translations: json['translations'] == null
            ? []
            : List<Translation>.from(
                json['translations']!.map((x) => Translation.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'main_image': mainImage,
        'brend': brend?.toJson(),
        'limit_amount': limitAmount,
        'amount': amount,
        'translations': translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x.toJson())),
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
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
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
        ru: json['ru'] == null ? null : Ru.fromJson(json['ru']),
        tm: json['tm'] == null ? null : Ru.fromJson(json['tm']),
      );

  Map<String, dynamic> toJson() => {
        'ru': ru?.toJson(),
        'tm': tm?.toJson(),
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
        name: json['name'] ?? 'null',
        description: json['description'] ?? 'null',
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
      };
}
