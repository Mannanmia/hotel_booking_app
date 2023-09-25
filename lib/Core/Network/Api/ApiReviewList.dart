
import 'dart:convert';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:http/http.dart' as http;
import '../../../Model/ReviewModelData.dart';
import '../../../utils/shared_pref_utils.dart';

class ReviewList {

  Future<ReviewResponse?> getReviewList () async{
    try{
      var access_token = await SharedPrefUtil.getString("access_token");
      final String urlData = "https://dev.htlbd.com/api/vendor/review/list/hotel/27?token="+"$access_token";
      var url = Uri.parse(urlData);
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      print(".................................");
      print(jsonData);
    }catch(e){

    }
  }

}