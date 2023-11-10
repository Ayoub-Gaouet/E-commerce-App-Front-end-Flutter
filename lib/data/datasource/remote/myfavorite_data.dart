import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);
  getData(String id) async {
    var response = await crud.getData(AppLink.favoriteGet+id.toString());
    return response.fold((l) => l, (r) => r);
  }
  deleteData(String id) async {
    var response = await crud.deleteData(AppLink.deletefromfavroite+id.toString());
    return response.fold((l) => l, (r) => r);
  }
}