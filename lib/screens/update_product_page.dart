import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/components/components.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/update_product.dart';

class UpdateProductScreen extends StatefulWidget {
  UpdateProductScreen({Key? key}) : super(key: key);
static String id = 'updateProduct';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
String? productName,desc,image;

String? price;
bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product = ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title:const Text('update product',style: TextStyle(color: Colors.black),),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomFormTextField(
                  onChanged: (data)
                  {
                    productName = data;
                  },
                  hintText: 'Product Name',
                ),
                const SizedBox(height: 10,),
                CustomFormTextField(
                  onChanged: (data)
                  {
                    desc = data;
                  },
                  hintText: 'Description',
                ),
                const SizedBox(height: 10,),
                CustomFormTextField(
                  onChanged: (data)
                  {
                    price = data ;
                  },
                  hintText: 'Price',
                  inputType: TextInputType.number,
                ),
                const SizedBox(height: 10,),
                CustomFormTextField(
                  onChanged: (data)
                  {
                    image = data;
                  },
                  hintText: 'Image',
                ),
                const SizedBox(height: 50,),
                CustomButon(
                  text: 'Update',
                  onTap: () async
                  {
                    isLoading = true;
                    setState(() {

                    });
                    try
                    {
                       await updateProduct(product);
                      print('success');
                    }catch(e)
                    {
                      print('error == ====  == =${e.toString()}' );

                    }
                    isLoading = false;

                    setState(() {

                    });


                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
     await UpdateProductService().updateProduct(
        id: product.id,
        title: productName == null? product.title :productName!,
        price:price ==null? product.price.toString(): price!,
        desc: desc == null ? product.description :desc!,
        image: image ==null ? product.image :image!,
        category: product.category,
    );


  }
}
