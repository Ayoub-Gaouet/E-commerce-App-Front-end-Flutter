import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/view/widget/cart/appbarcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/cart_controller.dart';
import '../../linkapi.dart';
import '../widget/cart/custom_bottom_navgationbar_cart.dart';
import '../widget/cart/customcartitem.dart';
import '../widget/cart/topcardcart.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
      body: GetBuilder<CartController>(
        builder: ((controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                TopAppbarCart(title: "My Cart",
                  onPressed: (){
                    Get.back();
                  },
                ),
                SizedBox(height: 16),
                TopCardCart(message: "You have ${cartController.totalcountitems} items in your cart",),
                Expanded(
                  child: Column(
                    children: [
                      ... List.generate(
                        cartController.data.length,
                            (index) => CustomCartItem(
                              onAdd:() async {
                                await cartController.add(cartController.data[index].id.toString());
                                cartController.refreshPage();
                              },
                              onRemove:() {
                                 cartController.delete(cartController.data[index].id.toString());
                                cartController.refreshPage();
                              },
                              itemImage: "${AppLink.imageItem}/"+"${cartController.data[index].image}",
                              itemName: "${cartController.data[index].name}",
                              itemPrice: cartController.data[index].itemsprice!.toDouble(),
                              itemQuantity: cartController.data[index].countitems!.toInt(),
                            ),
                      ),
                    ],
                )
              ),
              BottomNavgationBarCart(
                price: '${cartController.priceorders}',
                shipping: '300',
                totalprice: '143',
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
        )
      ),
      )
    );
  }
}

