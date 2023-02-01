import 'dart:convert';


class ProductModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final String image;
  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });



  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      image: map['image']  as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => 
  ProductModel.fromMap(json.decode(source));
}

    // {
    //     "id": 1,
    //     "name": "X-Salada",
    //     "description": "Lanche acompanha pão, hambúguer, mussarela, alface, tomate e maionese",
    //     "price": 15.0,
    //     "image": "https://assets.unileversolutions.com/recipes-v2/106684.jpg?imwidth=800"
    // },