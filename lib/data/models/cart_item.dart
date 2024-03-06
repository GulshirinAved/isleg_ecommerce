// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartItem {
  final String id;
  final String name;
  final String price;
  final String previous_price;
  final String image;
  int quantity;
  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.previous_price,
    required this.image,
    this.quantity = 1,
  });

  CartItem copyWith({
    String? id,
    String? name,
    String? price,
    String? previous_price,
    String? image,
    int? quantity,
  }) {
    return CartItem(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      previous_price: previous_price ?? this.previous_price,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  bool operator ==(covariant CartItem other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.price == price &&
        other.previous_price == previous_price &&
        other.image == image &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        price.hashCode ^
        previous_price.hashCode ^
        image.hashCode ^
        quantity.hashCode;
  }
}
