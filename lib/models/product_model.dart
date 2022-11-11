class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingModel ratingModel;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.ratingModel,
  });

  factory ProductModel.fromJson(Map<String, dynamic>jsonData)
  {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'],
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      ratingModel: RatingModel.fromJson(jsonData['rating']),
    );
  }
}
class RatingModel
{
  final double rate;
  final int count;
  RatingModel({
   required this.rate,
   required this.count,
});
  factory RatingModel.fromJson(Map<String,dynamic> jsonData)
  {
    return RatingModel(
        rate:jsonData['rate'],
        count: jsonData['count'],
    );
  }
}

