
import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addFavorite(String users_id, String items_id) async {
    var response = await crud.postData(
        AppLink.favoriteAdd+users_id.toString()+"/"+items_id.toString(), {});
    return response.fold((l) => l, (r) => r);
  }
  removeFavorite(String users_id, String items_id) async {
    var response = await crud.deleteData(
        AppLink.favoriteRemove+users_id.toString()+"/"+items_id.toString(), );
    return response.fold((l) => l, (r) => r);
  }
}