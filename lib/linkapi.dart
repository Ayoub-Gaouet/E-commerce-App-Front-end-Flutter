class AppLink{
  static const String server = "https://www.elarby-tunisia.com";
  //image
  static const String imageCategory = "$server/category_images";
  static const String imageItem = "$server/item_images";
  //sign up
  static const String signup = "$server/api/auth/signup";
  static const String verifyCodeSignUp = "$server/api/auth/verifyCodeSignUp";
  //resendverfiycode
  static const String resend = "$server/api/auth/resend";
  //login
  static const String login = "$server/api/auth/login";
  //forget password
  static const String forgetPassword = "$server/api/auth/forgetpassword/checkEmail";
  static const String verifyCode = "$server/api/auth/forgetpassword/verifyCode";
  static const String resetPassword = "$server/api/auth/forgetpassword/resetPassword";
  //home
  static const String home ="$server/api/home";
  //items
  static const String items = "$server/api/items/getDataByCategory/";
  static const String itemsSearch = "$server/api/items/search/";
  //favorite
  static const String favoriteAdd = "$server/api/favorite/addFavorite/";
  static const String favoriteRemove = "$server/api/favorite/deleteFavorite/";
  static const String favoriteGet = "$server/api/favorite/getFavorite/";
  static const String deletefromfavroite = "$server/api/favorite/deletefromfavroite/";

  //cart
  static const String cartAdd = "$server/api/cart/addCart/";
  static const String cartRemove = "$server/api/cart/removeCart/";
  static const String cartGetCountitems = "$server/api/cart/getCount/";
  static const String cartView = "$server/api/cart/getAllData/";
}