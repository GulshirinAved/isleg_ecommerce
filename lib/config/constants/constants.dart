//host
const String host = '192.168.21.71:8000';

///url
const String url = 'http://$host/api/';

///images
String logoImages = 'assets/logo/logo.svg';
String logoBlackImage = 'assets/logo/logoName.svg';

//icons
String search = 'assets/icons/search.svg';
String heart = 'assets/icons/heart.svg';
String emptyCart = 'assets/icons/empty_cart.svg';
String cart = 'assets/icons/cart.svg';
String profile = 'assets/icons/profile.svg';
String setting = 'assets/icons/setting.svg';
String language = 'assets/icons/language.svg';
String document = 'assets/icons/document.svg';
String message = 'assets/icons/message.svg';
String info = 'assets/icons/info.svg';
String logout = 'assets/icons/logout.svg';
String arrowRight = 'assets/icons/arrowRight.svg';
String sort = 'assets/icons/sort.svg';

String productImage = 'assets/images/image.png';
String personImage = 'assets/images/person.png';
//list icons
List<dynamic> categoryNames = [
  {
    'icon': 'assets/icons/idea.svg',
    'name': 'Elektrik',
  },
  {
    'icon': 'assets/icons/stationery.svg',
    'name': 'Kanselýar',
  },
  {
    'icon': 'assets/icons/balloons.svg',
    'name': 'Sowgatlyk',
  },
  {
    'icon': 'assets/icons/hoodie.svg',
    'name': 'Egin eşik',
  },
  {
    'icon': 'assets/icons/construction.svg',
    'name': 'Gurluşyk',
  },
  {
    'icon': 'assets/icons/armchair.svg',
    'name': 'Mebel',
  },
  {
    'icon': 'assets/icons/car.svg',
    'name': 'Awtoulag',
  },
];
//product list
List productList = [
  {
    'id': 1,
    'name': 'Набор каранд чёрнографитны в коробке 12 шт',
    'price': '201',
    'previous_price': '213',
    'isSale': true,
    'isNew': false,
  },
  {
    'id': 2,
    'name': 'Набор каранд чёрнографитны в коробке 12 шт',
    'price': '202',
    'previous_price': '213',
    'isSale': true,
    'isNew': false,
  },
  {
    'id': 3,
    'name': 'Набор каранд чёрнографитны в коробке 12 шт',
    'price': '203',
    'previous_price': '213',
    'isSale': true,
    'isNew': false,
  },
  {
    'id': 4,
    'name': 'Набор каранд чёрнографитны в коробке 12 шт',
    'price': '204',
    'previous_price': '213',
    'isNew': true,
  },
  {
    'id': 5,
    'name': 'Набор каранд чёрнографитны в коробке 12 шт',
    'price': '205',
    'previous_price': '213',
    'isNew': true,
  },
  {
    'id': 6,
    'name': 'Набор каранд чёрнографитны в коробке 12 шт',
    'price': '206',
    'previous_price': '213',
    'isNew': true,
  },
  {
    'id': 7,
    'name': 'Набор каранд чёрнографитны в коробке 12 шт',
    'price': '207',
    'previous_price': '213',
    'isNew': true,
  },
  {
    'id': 8,
    'name': 'Набор каранд чёрнографитны в коробке 12 шт',
    'price': '208',
    'previous_price': '213',
    'isNew': true,
  },
  {
    'id': 9,
    'name': 'Набор каранд чёрнографитны в коробке 12 шт',
    'price': '209',
    'previous_price': '213',
    'isNew': true,
  },
  {
    'id': 10,
    'name': 'Набор каранд чёрнографитны в коробке 12 шт',
    'price': '209',
    'previous_price': '213',
    'isNew': true,
  },
  {
    'id': 11,
    'name': 'Набор каранд чёрнографитны в коробке 12 шт',
    'price': '210',
    'previous_price': '213',
    'isNew': true,
  },
  {
    'id': 12,
    'name': 'Набор каранд чёрнографитны в коробке 12 шт',
    'price': '211',
    'previous_price': '213',
    'isNew': true,
  },
  {
    'id': 13,
    'name': 'Набор каранд чёрнографитны в коробке 12 шт',
    'price': '212',
    'previous_price': '213',
    'isNew': true,
  },
];
//list router
List<String> indexRouteNames = ['home', 'favorite', 'cart', 'profile'];
//payment list
List payment = ['Nagt', 'Töleg terminaly', 'QR Kod (Rysgal Pay)'];
//delivery time
List deliveryTime = [
  '12:00-15:00',
  '15:00-18:00',
  '18:00-21:00',
];
//profile tile
List<Map<String, dynamic>> profileTiles = [
  {'icon': profile, 'title': 'user'},
  {'icon': setting, 'title': 'settings'},
  {'icon': cart, 'title': 'myorders'},
  {'icon': language, 'title': 'changeLanguage'},
  {'icon': document, 'title': 'deliveryAndpayment'},
  {'icon': message, 'title': 'contact'},
  {'icon': info, 'title': 'aboutUs'},
  {'icon': logout, 'title': 'logOut'},
];
