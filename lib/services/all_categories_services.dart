
import 'package:store/helper/api.dart';

class AllCategoriesServices
{
  Future<List<dynamic>> getAllCategories() async
  {
    List<dynamic> data =
         await Api().getRequest(url: 'https://fakestoreapi.com/products/categories');
      return data;
  }
}