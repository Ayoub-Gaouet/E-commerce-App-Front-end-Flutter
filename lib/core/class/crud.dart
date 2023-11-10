import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/class/statusraquest.dart';
import '../functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, dynamic>> postData(String linkurl, Map data) async {
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(linkurl), body: data);
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        dynamic responsebody = jsonDecode(response.body);
        print(responsebody);

        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverFailure);
      }
    } else {
      return const Left(StatusRequest.offlineFailure);
    }
  }
  Future<Either<StatusRequest, dynamic>> getData(String linkurl) async {
    if (await checkInternet()) {
      var response = await http.get(Uri.parse(linkurl));
      print(response.statusCode);

      if (response.statusCode == 200) {
        dynamic responsebody = jsonDecode(response.body);
        print(responsebody);

        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverFailure);
      }
    } else {
      return const Left(StatusRequest.offlineFailure);
    }
  }
  Future<Either<StatusRequest, dynamic>> deleteData(String linkurl) async {
    if (await checkInternet()) {
      var response = await http.delete(Uri.parse(linkurl));
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 204) {
        // No response body for DELETE, so you can return success
        return Right(null);
      } else {
        return const Left(StatusRequest.serverFailure);
      }
    } else {
      return const Left(StatusRequest.offlineFailure);
    }
  }

}
Future<Either<StatusRequest, dynamic>> deleteData(String linkurl) async {
  if (await checkInternet()) {
    var response = await http.delete(Uri.parse(linkurl));
    print(response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 204) {
      // No response body for DELETE, so you can return success
      return Right(null);
    } else {
      return const Left(StatusRequest.serverFailure);
    }
  } else {
    return const Left(StatusRequest.offlineFailure);
  }
}

