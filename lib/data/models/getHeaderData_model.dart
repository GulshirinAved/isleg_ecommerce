class HeaderData {
  LogoFavicon? logoFavicon;
  TranslationHeader? translationHeader;
  List<Language>? languages;
  List<Category>? categories;

  HeaderData({
    this.logoFavicon,
    this.translationHeader,
    this.languages,
    this.categories,
  });

  factory HeaderData.fromJson(Map<String, dynamic> json) => HeaderData(
        logoFavicon: json["logo_favicon"] == null
            ? null
            : LogoFavicon.fromJson(json["logo_favicon"]),
        translationHeader: json["translation_header"] == null
            ? null
            : TranslationHeader.fromJson(json["translation_header"]),
        languages: json["languages"] == null
            ? []
            : List<Language>.from(
                json["languages"]!.map((x) => Language.fromJson(x))),
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "logo_favicon": logoFavicon?.toJson(),
        "translation_header": translationHeader?.toJson(),
        "languages": languages == null
            ? []
            : List<dynamic>.from(languages!.map((x) => x.toJson())),
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
      };
}

class Category {
  String? id;
  String? image;
  String? name;
  int? orderNumber;
  int? orderNumberInHomePage;
  bool? isVisible;
  List<CategoryChildCategory>? childCategory;

  Category({
    this.id,
    this.image,
    this.name,
    this.orderNumber,
    this.orderNumberInHomePage,
    this.isVisible,
    this.childCategory,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        orderNumber: json["order_number"],
        orderNumberInHomePage: json["order_number_in_home_page"],
        isVisible: json["is_visible"],
        childCategory: json["child_category"] == null
            ? []
            : List<CategoryChildCategory>.from(json["child_category"]!
                .map((x) => CategoryChildCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "order_number": orderNumber,
        "order_number_in_home_page": orderNumberInHomePage,
        "is_visible": isVisible,
        "child_category": childCategory == null
            ? []
            : List<dynamic>.from(childCategory!.map((x) => x.toJson())),
      };
}

class CategoryChildCategory {
  String? id;
  String? name;
  int? orderNumberInHomePage;
  bool? isVisible;
  List<ChildCategoryChildCategory>? childCategory;

  CategoryChildCategory({
    this.id,
    this.name,
    this.orderNumberInHomePage,
    this.isVisible,
    this.childCategory,
  });

  factory CategoryChildCategory.fromJson(Map<String, dynamic> json) =>
      CategoryChildCategory(
        id: json["id"],
        name: json["name"],
        orderNumberInHomePage: json["order_number_in_home_page"],
        isVisible: json["is_visible"],
        childCategory: json["child_category"] == null
            ? []
            : List<ChildCategoryChildCategory>.from(json["child_category"]!
                .map((x) => ChildCategoryChildCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "order_number_in_home_page": orderNumberInHomePage,
        "is_visible": isVisible,
        "child_category": childCategory == null
            ? []
            : List<dynamic>.from(childCategory!.map((x) => x.toJson())),
      };
}

class ChildCategoryChildCategory {
  String? id;
  String? name;
  bool? isVisible;

  ChildCategoryChildCategory({
    this.id,
    this.name,
    this.isVisible,
  });

  factory ChildCategoryChildCategory.fromJson(Map<String, dynamic> json) =>
      ChildCategoryChildCategory(
        id: json["id"],
        name: json["name"],
        isVisible: json["is_visible"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "is_visible": isVisible,
      };
}

class Language {
  String? nameShort;
  String? flag;

  Language({
    this.nameShort,
    this.flag,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        nameShort: json["name_short"],
        flag: json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "name_short": nameShort,
        "flag": flag,
      };
}

class LogoFavicon {
  String? logo;
  String? favicon;

  LogoFavicon({
    this.logo,
    this.favicon,
  });

  factory LogoFavicon.fromJson(Map<String, dynamic> json) => LogoFavicon(
        logo: json["logo"],
        favicon: json["favicon"],
      );

  Map<String, dynamic> toJson() => {
        "logo": logo,
        "favicon": favicon,
      };
}

class TranslationHeader {
  dynamic langId;
  String? research;
  String? phone;
  String? password;
  String? forgotPassword;
  String? signIn;
  String? signUp;
  String? name;
  String? passwordVerification;
  String? verifySecure;
  String? myInformation;
  String? myFavorites;
  String? myOrders;
  String? logOut;
  String? basket;
  String? email;
  String? addToBasket;
  String? addButton;

  TranslationHeader({
    this.langId,
    this.research,
    this.phone,
    this.password,
    this.forgotPassword,
    this.signIn,
    this.signUp,
    this.name,
    this.passwordVerification,
    this.verifySecure,
    this.myInformation,
    this.myFavorites,
    this.myOrders,
    this.logOut,
    this.basket,
    this.email,
    this.addToBasket,
    this.addButton,
  });

  factory TranslationHeader.fromJson(Map<String, dynamic> json) =>
      TranslationHeader(
        langId: json["lang_id"],
        research: json["research"],
        phone: json["phone"],
        password: json["password"],
        forgotPassword: json["forgot_password"],
        signIn: json["sign_in"],
        signUp: json["sign_up"],
        name: json["name"],
        passwordVerification: json["password_verification"],
        verifySecure: json["verify_secure"],
        myInformation: json["my_information"],
        myFavorites: json["my_favorites"],
        myOrders: json["my_orders"],
        logOut: json["log_out"],
        basket: json["basket"],
        email: json["email"],
        addToBasket: json["add_to_basket"],
        addButton: json["add_button"],
      );

  Map<String, dynamic> toJson() => {
        "lang_id": langId,
        "research": research,
        "phone": phone,
        "password": password,
        "forgot_password": forgotPassword,
        "sign_in": signIn,
        "sign_up": signUp,
        "name": name,
        "password_verification": passwordVerification,
        "verify_secure": verifySecure,
        "my_information": myInformation,
        "my_favorites": myFavorites,
        "my_orders": myOrders,
        "log_out": logOut,
        "basket": basket,
        "email": email,
        "add_to_basket": addToBasket,
        "add_button": addButton,
      };
}
