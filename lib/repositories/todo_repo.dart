import 'package:shared_preferences/shared_preferences.dart';

class TodoRepo{

    
TodoRepo(){
 SharedPreferences.getInstance().then((value) => sharedPreferences = value);

}



late SharedPreferences sharedPreferences;

}