import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:http/http.dart' as http;
import '../../../utils/api_config.dart';
import '../../../utils/toast_utils.dart';

class ApiRegistration {
   Future<void> registerUser(var context,String email, String password, String first_name,String last_name,String term,String phone_number) async {
     ProgressDialog pd = ProgressDialog(context: context);
     try {
       pd.show(max: 100, msg: 'Login......');
       final String urlData = NetworkConstants.baseUrl + "auth/register";
       var url = Uri.parse(urlData);
       var response = await http.post(url, body: {'email': email, 'password': password ,'first_name':first_name,'last_name':last_name,'term':term,'vendor':"1",'phone':phone_number});
       if (response.statusCode == 200) {
         var jsonData = jsonDecode(response.body);
         if (jsonData["status"]==1) {
           pd.close();
           ToastUtil.showShortToast("Registration Successful");
         }else if(jsonData["status"]== 0){
           pd.close();
           ToastUtil.showLongToast(jsonData["message"]["email"][0]);
         }
       }
     } catch (e) {
       if (e is SocketException) {
         pd.close();
         ToastUtil.showShortToast("Cheack Network Connection");
       } else if (e is TimeoutException) {
         pd.close();
         ToastUtil.showShortToast("Request Time Out");
       } else {
         pd.close();
         ToastUtil.showShortToast(e.toString());
       }
     }
   }
}