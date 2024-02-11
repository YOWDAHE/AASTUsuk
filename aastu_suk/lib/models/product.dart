class Product {
  final String name;
  final double price;
  final String description;
  int expireTime;
  // final String image;

  Product(
      {required this.description,
      // required this.image,
      required this.name,
      required this.price,
      this.expireTime = 0
      });
}

