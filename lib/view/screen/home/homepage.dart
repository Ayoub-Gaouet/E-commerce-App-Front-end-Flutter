import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/view/widget/customsearchtextformfield.dart';
import 'package:ecommerceapp/view/widget/home/customcardhome.dart';
import 'package:ecommerceapp/view/widget/home/customcategories.dart';
import 'package:ecommerceapp/view/widget/home/customitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home/home_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../data/model/itemviewmodel.dart';
import '../../../linkapi.dart';
import '../../widget/customrowappbar.dart';
import '../../widget/home/customtitlehome.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller =Get.put(HomeControllerImp());
    return  Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 50),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: constraints.maxHeight),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        CustomRowAppBar(
                          onPressedFav: () {
                            controller.goFavorite();
                          },
                          onPressedIcon: () {},
                        ),
                        SizedBox(height: 20),
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
                        SizedBox(height: 10),
                      GetBuilder<HomeControllerImp>(
                        builder: (controller) => HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: !controller.isSearch ? Column(
                          children: [
                            CustomCardHome(title: "A Summer Surprise".tr, subtitle: "Cashback 20%".tr),
                            CustomTitleHome(title: "Our Categories :".tr, press: (){}),
                            SizedBox( height: 20,),
                            CustomCategories(),
                            CustomTitleHome(title: "Product for you :".tr, press: (){}),
                            SizedBox( height: 20,),
                            CustomItems(),
                          ],
                        ) : Container(
                          child: ListItemsSearch(listdatamodel: controller.listdata),
                        ),
                        ),
                    ),
                      ],
                ),

              ),

                );
              },
            ),
    );
  }
}
class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsViewModel> listdatamodel;
  const ListItemsSearch({Key? key, required this.listdatamodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToPageProductDetails(listdatamodel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                            child: CachedNetworkImage(
                                imageUrl:
                                "${AppLink.imageItem}/${listdatamodel[index].itemImage}")),
                        Expanded(
                            flex: 2,
                            child: ListTile(
                              title: Text(listdatamodel[index].itemName!),
                              subtitle: Text(listdatamodel[index].categoryName!),
                            )
                        ),
                      ],
                    ),
                  )
              ),
            ),
          );
        }
        );
  }
}