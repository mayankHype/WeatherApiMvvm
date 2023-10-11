import 'package:firebase_analytics/firebase_analytics.dart';

class Analytics{

  FirebaseAnalytics? an;



  Analytics(){
an=FirebaseAnalytics.instance;
  }


 Future<void> parseEvent(String name) async{

  await an?.logEvent(name: name);
}


}