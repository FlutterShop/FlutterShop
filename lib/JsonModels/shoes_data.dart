class ShoesData {
  int? id;
  final String shoesId;
  final String shoesTitle;
  final String price;
  final String size;
  final List<String> imageUrl;
  final String userId;

  ShoesData({
    this.id,
    required this.shoesId,
    required this.shoesTitle,
    required this.price,
    required this.size,
    required this.imageUrl,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'shoesId': shoesId,
      'shoesTitle': shoesTitle,
      'price': price,
      'size': size,
      'imageUrl': imageUrl.join(','), // Store as a comma-separated string
    };
  }

  factory ShoesData.fromMap(Map<String, dynamic> map) {
    return ShoesData(
      userId: map['userId'],
      id: map['id'],
      shoesId: map['shoesId'],
      shoesTitle: map['shoesTitle'],
      price: map['price'],
      size: map['size'].toString(),
      imageUrl: (map['imageUrl'] as String).split(','), // Convert back to a list
    );
  }
}
