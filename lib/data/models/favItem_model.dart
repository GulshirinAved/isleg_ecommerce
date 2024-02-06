// ignore_for_file: public_member_api_docs, sort_constructors_first
class FavItem {
  final int favId;
  final String favName;
  final String favPrice;
  final String favPrevious_price;
  final bool favIsNew;
  FavItem({
    required this.favId,
    required this.favName,
    required this.favPrice,
    required this.favPrevious_price,
    required this.favIsNew,
  });

  FavItem copyWith({
    int? favId,
    String? favName,
    String? favPrice,
    String? favPrevious_price,
    bool? favIsNew,
  }) {
    return FavItem(
      favId: favId ?? this.favId,
      favName: favName ?? this.favName,
      favPrice: favPrice ?? this.favPrice,
      favPrevious_price: favPrevious_price ?? this.favPrevious_price,
      favIsNew: favIsNew ?? this.favIsNew,
    );
  }

  @override
  bool operator ==(covariant FavItem other) {
    if (identical(this, other)) return true;

    return other.favId == favId &&
        other.favName == favName &&
        other.favPrice == favPrice &&
        other.favPrevious_price == favPrevious_price &&
        other.favIsNew == favIsNew;
  }

  @override
  int get hashCode {
    return favId.hashCode ^
        favName.hashCode ^
        favPrice.hashCode ^
        favPrevious_price.hashCode ^
        favIsNew.hashCode;
  }
}
