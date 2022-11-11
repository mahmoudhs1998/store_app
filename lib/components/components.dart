import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/screens/update_product_page.dart';

class CustomCard extends StatelessWidget {
   CustomCard({Key? key , required this.product}) : super(key: key);

  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.pushNamed(context, UpdateProductScreen.id,arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            // width: 220,height: 120,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 40,
                  spreadRadius: 0,
                  offset: const Offset(10,10),
                  color: Colors.grey.withOpacity(.2),
                ),

              ],
            ),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text(
                      product.title.substring(0,6),
                      style: const TextStyle(
                          color: Colors.grey,fontSize: 16
                      ),
                    ),
                    const SizedBox(height: 3,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$''${product.price.toString()}',
                          style:const TextStyle(
                              color: Colors.black,fontSize: 16
                          ),
                        ),
                        const Icon(
                          Icons.favorite_outline_sharp,color: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              right: 32,top: -60,
              child: Image.network(product.image,height: 100,width: 100,)),
        ],
      ),
    );
  }
}





class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({Key? key, this.hintText, this.onChanged , this.obscureText =false,this.inputType}) : super(key: key);
  Function(String)? onChanged;
  String? hintText;
  TextInputType? inputType;

  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      obscureText:obscureText!,
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:const TextStyle(
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:const BorderSide(
            color: Colors.black,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:const BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}



class CustomButon extends StatelessWidget {
  CustomButon({ this.onTap ,required this.text}) ;
  VoidCallback? onTap;
  String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}