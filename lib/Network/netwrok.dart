import 'dart:convert';
import 'package:apibasedApp/APIKEY/apikey.dart';
import 'package:apibasedApp/Links/links.dart';
import 'package:apibasedApp/Model/article.dart';
import 'package:apibasedApp/Model/top.dart';
import 'package:http/http.dart';

class Network {
  Future<News> getnews() async {
    var finalurl =Links.topheadlines;
    final Response response = await get(Uri.encodeFull(finalurl));
    if (response.statusCode == 200) {
      print('${response.body}');
      return News.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error');
    }
  }
    Future<SourceHeadlines> getTopnchannelsnames() async {
    var finalurl =Links.topChannels;
    final Response response = await get(Uri.encodeFull(finalurl));
    if (response.statusCode == 200) {
      print('${response.body}');
      return SourceHeadlines.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error');
    }
  }
    Future<News> gehottheadlines() async {
    var finalurl =Links.hotNews;
    final Response response = await get(Uri.encodeFull(finalurl));
    if (response.statusCode == 200) {
      print('${response.body}');
      return News.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error');
    }
  }
  
    Future<News> getSports() async {
    var finalurl =Links.sports;
    final Response response = await get(Uri.encodeFull(finalurl));
    if (response.statusCode == 200) {
      print('${response.body}');
      return News.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error');
    }
  }
  Future<News> getSearch({String search}) async {
    var finalurl = "https://newsapi.org/v2/everything?q=" +
        search +
        "&apiKey=" +
        Appid.appid +
        "";
    final Response response = await get(Uri.encodeFull(finalurl));
    if (response.statusCode == 200) {
      print('${response.body}');
      return News.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error');
    }
  }
    Future<News> getChanneldata({String search}) async {
    var finalurl = "https://newsapi.org/v2/top-headlines?sources="+search+"&apiKey="+Appid.appid+"";
    final Response response = await get(Uri.encodeFull(finalurl));
    if (response.statusCode == 200) {
      print('${response.body}');
      return News.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error');
    }
  }


}




//entertainment
// tehnology
