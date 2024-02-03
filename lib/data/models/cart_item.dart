// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartItem {
  final int id;
  final String name;
  final String price;
  final String previous_price;
  final bool isNew;
  int quantity;
  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.previous_price,
    required this.isNew,
    this.quantity = 1,
  });

  CartItem copyWith({
    int? id,
    String? name,
    String? price,
    String? previous_price,
    bool? isNew,
    int? quantity,
  }) {
    return CartItem(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      previous_price: previous_price ?? this.previous_price,
      isNew: isNew ?? this.isNew,
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
        other.isNew == isNew &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        price.hashCode ^
        previous_price.hashCode ^
        isNew.hashCode ^
        quantity.hashCode;
  }
}
