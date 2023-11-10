import 'package:ecommerceapp/controller/favorite_controller.dart';
import 'package:ecommerceapp/data/model/itemviewmodel.dart';
import 'package:ecommerceapp/view/widget/customrowappbar.dart';
import 'package:ecommerceapp/view/widget/customsearchtextformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/items_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../widget/items/customcategoriesitems.dart';
import '../widget/items/customlistitems.dart';
import 'home/homepage.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller =Get.put(ItemsControllerImp());
    FavoriteController controllerFav =Get.put((FavoriteController()));
    return Scaffold(
      body:Container(
        padding: EdgeInsets.all(20),
        child:ListView(
              children:[
                CustomRowAppBar(onPressedIcon: (){}),
                SizedBox(height: 10,),
                CustomSearchTextFormField(
                    mycontroller: controller.search,
                    titleappbar: "Search Product".tr,
                    onPressedSearch: (){
                      controller.onSearch();
                    },
                    onChanged:(val){
                      controller.checksearch(val);
                    }
                ),
                SizedBox(height: 10,),
                CustomCategoriesItems(),
                GetBuilder<ItemsControllerImp>(
                    builder: (controller) => HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: !controller.isSearch ? GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.data.length,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.7
                            ),
                            itemBuilder: (BuildContext context, index) {
                              controllerFav.isFavorite[controller.data[index]
                              ['item_id']] = controller.data[index]['favorite'];
                              print(controllerFav.isFavorite);
                              return CustomListItems(
                                  itemsViewModel:ItemsViewModel.fromJson(controller.data[index]));
                            }
                            ): Container(
                          child: ListItemsSearch(listdatamodel: controller.listdata),
                        )
                    )
                )
              ]
            )
        ),
    );
  }
}