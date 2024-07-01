class ShoesData {
  final int? id;
  final String shoesTitle;
  final String price;
  final String info;
  // final String imageUrl;

  ShoesData({
    this.id,
    required this.shoesTitle,
    required this.price,
    required this.info,
    // required this.imageUrl,
  });

  factory ShoesData.fromMap(Map<String, dynamic> json) => ShoesData(
        id: json["id"],
        shoesTitle: json["shoesTitle"],
        price: json["price"],
        info: json["info"],
        //  imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "shoesTitle": shoesTitle,
        "price": price,
        "info" : info,
        //  "imageUrl": imageUrl,
      };
}
