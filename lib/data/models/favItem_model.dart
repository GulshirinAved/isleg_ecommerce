// ignore_for_file: public_member_api_docs, sort_constructors_first
class FavItem {
  final String favId;
  final String favName;
  final String favPrice;
  final String favPrevious_price;
  final String image;
  FavItem({
    required this.favId,
    required this.favName,
    required this.favPrice,
    required this.favPrevious_price,
    required this.image,
  });

  @override
  bool operator ==(covariant FavItem other) {
    if (identical(this, other)) return true;

    return other.favId == favId &&
        other.favName == favName &&
        other.favPrice == favPrice &&
        other.favPrevious_price == favPrevious_price &&
        other.image == image;
  }

  @override
  int get hashCode {
    return favId.hashCode ^
        favName.hashCode ^
        favPrice.hashCode ^
        favPrevious_price.hashCode ^
        image.hashCode;
  }

  FavItem copyWith({
    String? favId,
    String? favName,
    String? favPrice,
    String? favPrevious_price,
    String? image,
  }) {
    return FavItem(
      favId: favId ?? this.favId,
      favName: favName ?? this.favName,
      favPrice: favPrice ?? this.favPrice,
      favPrevious_price: favPrevious_price ?? this.favPrevious_price,
      image: image ?? this.image,
    );
  }
}
