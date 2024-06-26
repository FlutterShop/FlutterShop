class ShoesData {
  final int? id;
  final String shoesTitle;
  final String price;
  // final String imageUrl;

  ShoesData({
    this.id,
    required this.shoesTitle,
    required this.price,
    // required this.imageUrl,
  });

  factory ShoesData.fromMap(Map<String, dynamic> json) => ShoesData(
        id: json["id"],
        shoesTitle: json["shoesTitle"],
        price: json["price"],
        //  imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "shoesTitle": shoesTitle,
        "price": price,
        //  "imageUrl": imageUrl,
      };
}
