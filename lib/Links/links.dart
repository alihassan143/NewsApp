import 'package:apibasedApp/APIKEY/apikey.dart';

class Links {
  static String topChannels = "https://newsapi.org/v2/sources?language=en&category=general&apiKey="+Appid.appid+ "";
  static String hotNews =
      "http://newsapi.org/v2/everything?q=headlines&apiKey="+Appid.appid+"";
  static String topheadlines =
      "https://newsapi.org/v2/top-headlines?language=en&apiKey=" +
          Appid.appid +
          "";
            static String sports=
      "https://newsapi.org/v2/top-headlines?sources=espn-cric-info&apiKey=" +
          Appid.appid +
          "";

}
