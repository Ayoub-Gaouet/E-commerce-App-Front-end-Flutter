import 'package:get/get.dart';

validInput(val , min , max , type){
  if (type =="username"){
    if(!GetUtils.isUsername(val)){
      return "Username is not valid";
    }
  }
  if (type =="email"){
    if(!GetUtils.isEmail(val)){
      return "Email is not valid";
    }
  }
  if (type =="password"){
    if(!GetUtils.isLengthGreaterOrEqual(val, min)){
      return "Password must be at least $min characters";
    }
    if(!GetUtils.isLengthLessOrEqual(val, max)){
      return "Password must be less than $max characters";
    }
  }
  if (type =="telephone"){
    if(!GetUtils.isPhoneNumber(val)){
      return "Telephone is not valid";
    }
  }

}