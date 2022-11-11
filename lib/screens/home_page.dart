import 'package:flutter/material.dart';
import 'package:store/components/components.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/get_all_products.dart';

class HomePage extends StatelessWidget {
  const HomePage  ({Key? key}) : super(key: key);
static String id = 'homePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('Store',style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(onPressed: (){},
              icon:const Icon(
                Icons.add_shopping_cart,
                color: Colors.black,
              )
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16,top: 65),
        child:FutureBuilder<List<ProductModel>>
          (
          future: AllProductsServices().getAllProducts(),
          builder: (BuildContext context,AsyncSnapshot<List<ProductModel>> snapshot)
          {
            if(snapshot.hasData)
            {
              List<ProductModel> products = snapshot.data!;
              return  GridView.builder(
                itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 100,
                  ),
                  itemBuilder: (context,index)
                  {
                    return  CustomCard(product: products[index],);
                  }
              );
            }else{return const Center(child: CircularProgressIndicator());}

          },
        ),
      ),
    );
  }
}
