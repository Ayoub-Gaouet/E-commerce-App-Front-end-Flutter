import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/view/widget/productdetails/bottomnavigationbarproductdetails.dart';
import 'package:ecommerceapp/view/widget/productdetails/customcolorproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/productdetails_controller.dart';
import '../../linkapi.dart';
import '../widget/productdetails/customrowappbarproductdetails.dart';
import '../widget/productdetails/priceandcountitems.dart';
import '../widget/productdetails/similarproductdetails.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller = Get.put(ProductDetailsControllerImp());
    return Scaffold(
      body:GetBuilder<ProductDetailsControllerImp>(
        builder:(controller)=> HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                CustomRowAppBarProductDetails(),
                Container(
                  height: MediaQuery.of(context).size.height*.35,
                  padding: const EdgeInsets.only(bottom: 30),
                  width: double.infinity,
                  child: Image.network(AppLink.imageItem+"/"+"${controller.itemsViewModel.itemImage}",
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${controller.itemsViewModel.categoryName}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                '${controller.itemsViewModel.itemName}',
                                style: TextStyle(
                                  color: AppColor.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 15),
                              PriceAndCountItems(
                                onAdd: () {
                                  controller.add();
                                },
                                onRemove: () {
                                  controller.remove();
                                },
                                price: '${controller.itemsViewModel.itemPriceDiscount}',
                                count: '${controller.countItems}',
                              ),
                              const SizedBox(height: 15),
                              Text(
                                '${controller.itemsViewModel.itemDescription}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:<Widget> [
                                  Text("Color",style: TextStyle(
                                    color: AppColor.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      ...List.generate(
                                        controller.subitems.length,
                                            (index) => Container(
                                          margin: const EdgeInsets.only(right: 6),
                                          child: CustomColorProductDetails(
                                            color: controller.subitems[index]["color"],
                                            isSelected: controller.subitems[index]["active"],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 15),
                              Text(
                                'Similar This',
                                style: TextStyle(
                                  color: AppColor.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 10),
                              SimilarProductDetails(),
                            ],
                          ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: 50,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      ),
      bottomNavigationBar: BottomNavigationBarProductDetails(
        itemsViewModel: controller.itemsViewModel, // Pass the itemsViewModel parameter here
      ),
    );
  }
}