import 'package:scoped_model/scoped_model.dart';
class Product extends Model {
  final String name;
  final String description;
  final int price;
  final String image;
  int rating;

  Product(this.name, this.description, this.price, this.image, this.rating);

  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      json['name'],
      json['description'],
      json['price'],
      json['image'],
      json['rating'],
    );
  }

  void updateRating(int myRating) {
    rating = myRating;
    notifyListeners();
  }
  static List<Product> getProducts() {
    List<Product> items = <Product>[];
    items.add(
        Product(
            "iphone",
            "iphone description", 1000,
            "iphone.jpg", 0
        )
    );
    items.add(
        Product(
            "samsung",
            "samsung description", 800,
            "samsung.jpg", 0
        )
    );
    return items;
  }
}
