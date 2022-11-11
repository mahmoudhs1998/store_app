
import 'package:store/helper/api.dart';

import 'package:store/models/product_model.dart';

class CategoriesServices
{
  Future<List<ProductModel>> getCategoriesProducts({required String categoryName})async
  {
    List<dynamic> data =
      await Api().getRequest(url: 'https://fakestoreapi.com/products/category/$categoryName');
      List<ProductModel> productsList = [];
      for(int i =0; i<data.length;i++)
      {
        productsList.add(
          ProductModel.fromJson(data[i]),
        );
      }
      return productsList;
  }
}