import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:hoel_booking_app/Model/room_response.dart';
import 'package:hoel_booking_app/Model/totalRoomResponse.dart';
import 'package:http/http.dart' as http;
import 'package:sn_progress_dialog/progress_dialog.dart';
import '../../../utils/shared_pref_utils.dart';
import '../../../utils/toast_utils.dart';

class TotalRoomList{
  Future<List<RoomsResponse>?> get_ApiTotalRoom(var context)async{
    List<RoomsResponse> roomList = [];
    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(max: 100, msg: "Searching Rooms");
    try{
      var access_token = await SharedPrefUtil.getString("access_token");
      var htl_id = await SharedPrefUtil.getInt("htl_id");

      final String urlData = "https://dev.htlbd.com/api/vendor/rooms/$htl_id?token="+"$access_token";
      var url = Uri.parse(urlData);
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      var htl_name = jsonData["hotel"];
      var rooms = jsonData["rooms"];
      for(int i =0 ;i<rooms.length;i++){
        RoomsResponse data = RoomsResponse(rooms[i]["id"], rooms[i]["title"],rooms[i]["image_url"],rooms[i]["price"],rooms[i]["number"],rooms[i]["status"],htl_name);
        roomList.add(data);
      }
      pd.close();
      return roomList;

    }catch (e) {
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


  Future<RoomResponse?> getApiRoom(var context,int roomId)async{
    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(max: 100, msg: "Finding Room");
    try{
      var access_token = await SharedPrefUtil.getString("access_token");
      final String urlData = "https://dev.htlbd.com/api/vendor/room/$roomId?token="+"$access_token";
      var url = Uri.parse(urlData);
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      RoomResponse data = RoomResponse(jsonData["room"]['title'], jsonData["room"]['content'], jsonData["room"]['image_id'], jsonData["room"]['price'], jsonData["room"]['beds'], jsonData["room"]['size'],  jsonData["room"]['adults'], jsonData["room"]['children']);
      pd.close();
      return data;

    }catch (e) {
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

  Future<int?> apiDeleteRoom(int room_id) async{
    try{
      var access_token = await SharedPrefUtil.getString("access_token");
      final String urlData = "https://dev.htlbd.com/api/vendor/room/delete/$room_id?token="+"$access_token";
      var url = Uri.parse(urlData);
      var response = await http.get(url);

      if(response.statusCode == 200) {
        ToastUtil.showShortToast("Room Deleted");
        return 1;
      }else{
        ToastUtil.showShortToast("Room Not Found");
      }
    }catch (e) {
      if (e is SocketException) {
        ToastUtil.showShortToast("Cheack Network Connection");
      } else if (e is TimeoutException) {
        ToastUtil.showShortToast("Request Time Out");
      } else {
        ToastUtil.showShortToast("Fill Up Form");
      }
    }
  }
  
}
