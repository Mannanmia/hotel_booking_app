import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hoel_booking_app/Model/ApiResponseEvent.dart';
import 'package:hoel_booking_app/Model/event_availability_list.dart';
import 'package:hoel_booking_app/screens/event_List_View.dart';
import 'package:http/http.dart' as http;
import 'package:sn_progress_dialog/progress_dialog.dart';
import '../../../Model/ApiResponseEventList.dart';
import '../../../utils/shared_pref_utils.dart';
import '../../../utils/toast_utils.dart';

class TotalEventList{
  Future<List<EventsResponseList>?> get_ApiEventList(var context)async{
    List<EventsResponseList> eventList = [];
    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(max: 100, msg: 'Searching Events');
    try{
      var access_token = await SharedPrefUtil.getString("access_token");
      final String urlData = "https://dev.htlbd.com/api/vendor/events?token="+"$access_token";
      var url = Uri.parse(urlData);
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      var events = jsonData["rows"];
      for(int i =0 ;i<events.length;i++){
        EventsResponseList data = EventsResponseList(events[i]["id"], events[i]["title"],events[i]["image_id"], events[i]["price"],events[i]["days"]);
        eventList.add(data);
      }
      pd.close();
      return  eventList;

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



  void postApiAddEvent(var context,String title,String content,String video,String duration,String stime,String featuredimage,String bannerImage, String eventPrice,String eventSellPrice,String address,String sdate,String edate,String map_lat,String map_lng) async{

    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(max: 100, msg: 'Event Data Uploading');
    try{
      var access_token = await SharedPrefUtil.getString("access_token");
      final String urlData = "https://dev.htlbd.com/api/vendor/event/0?token="+"$access_token";
      var url = Uri.parse(urlData);
      var response= await http.post(url,body: {'title':title, 'content':content, 'price':eventPrice,'video':video, 'image_id':featuredimage
      ,'banner_image_id':bannerImage,'duration':duration,'start_time':stime,'sale_price':eventSellPrice,'address':address,'sdate':sdate,'edate':edate,'map_lat':map_lat,'map_lng':map_lng,'map_zoom':"8"
      });
      if(response.statusCode == 200){
        var jsonData = jsonDecode(response.body);
        String sms = jsonData["message"];
        ToastUtil.showShortToast(sms);
        pd.close();
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => EventListView()));
      }

    }catch(e){
      if (e is SocketException) {
        ToastUtil.showShortToast("Cheack Network Connection");
        pd.close();
      } else if (e is TimeoutException) {
        ToastUtil.showShortToast("Request Time Out");
        pd.close();
      } else {
        ToastUtil.showShortToast(e.toString());
        pd.close();
      }
    }
  }



  void postApiUpdateEvent(var context,int event_id,String title,String content,String video,String duration,String stime,String featuredimage,String bannerImage, String eventPrice,String eventSellPrice,String ticket_code,String ticket_name,String ticketPrice) async{

    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(max: 100, msg: 'Event Data Uploading');
    try{
      var access_token = await SharedPrefUtil.getString("access_token");
      final String urlData = "https://dev.htlbd.com/api/vendor/event/$event_id?token="+"$access_token";
      var url = Uri.parse(urlData);
      var response= await http.post(url,body: {'title':title, 'content':content, 'price':eventPrice,'video':video, 'image_id':featuredimage
        ,'banner_image_id':bannerImage,'duration':duration,'start_time':stime,'sale_price':eventSellPrice
      });
      if(response.statusCode == 200){
        var jsonData = jsonDecode(response.body);
        String sms = jsonData["message"];
        ToastUtil.showShortToast(sms);
        pd.close();
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => EventListView()));
      }

    }catch(e){
      if (e is SocketException) {
        ToastUtil.showShortToast("Cheack Network Connection");
        pd.close();
      } else if (e is TimeoutException) {
        ToastUtil.showShortToast("Request Time Out");
        pd.close();
      } else {
        ToastUtil.showShortToast(e.toString());
        pd.close();
      }
    }
  }


  Future<EventResponse?> get_ApiEvent(int _id) async{
    try{
      var access_token = await SharedPrefUtil.getString("access_token");
      final String urlData = "https://dev.htlbd.com/api/vendor/event/$_id?token="+"$access_token";
      var url = Uri.parse(urlData);
      var response = await http.get(url);
      var jsonData = await jsonDecode(response.body);
      var event = jsonData["event"];
      EventResponse data = EventResponse(event["id"],event["title"],event["image_id"],event["price"],event["address"],event["map_lat"],event["map_lng"], event["map_zoom"],event["duration"], event["start_time"]);

      return data;

    }catch (e) {
      if (e is SocketException) {
        ToastUtil.showShortToast("Cheack Network Connection");
      } else if (e is TimeoutException) {
        ToastUtil.showShortToast("Request Time Out");
      } else {
        ToastUtil.showShortToast(e.toString());
      }
    }
  }



  Future<int?> ApiDeletEvent(int event_id)async{
    try{
      var access_token = await SharedPrefUtil.getString("access_token");
      final String urlData = "https://dev.htlbd.com/api/vendor/event/delete/$event_id?token="+"$access_token";
      var url = Uri.parse(urlData);
      var response = await http.get(url);

      if(response.statusCode == 200) {
        ToastUtil.showShortToast("Event Deleted");
        return 1;
      }else{
        ToastUtil.showShortToast("Item Not Found");
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

  Future<List<EventAvailabilityList>?> apiGetAvailabiliyList(int event_id,String startDate,String endDate)async{
    try{
      List<EventAvailabilityList> eventLists =[];
      var access_token = await SharedPrefUtil.getString("access_token");
      final String urlData = "https://dev.htlbd.com/api/vendor/dates/event/$event_id?id=$event_id&start=$startDate&end=$endDate&token="+"$access_token";
      var url = Uri.parse(urlData);
      var response = await http.get(url);

      if(response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body);
        for(int i =0 ;i<30;i++){
          eventLists.add(EventAvailabilityList.fromJson(jsonData[i]));
        }
        return eventLists;
      }else{
        ToastUtil.showShortToast("Item Not Found");
      }
    }catch (e) {
      if (e is SocketException) {
        ToastUtil.showShortToast("Cheack Network Connection");
      } else if (e is TimeoutException) {
        ToastUtil.showShortToast("Request Time Out");
      } else {
        ToastUtil.showShortToast(e.toString());
      }
    }
  }
  
}
