import "package:shared_preferences/shared_preferences.dart";



class HelperFunctions{

  static String sharedPreferenceUserLoggedInKey = "ISLOGGEDIN";
  static String sharedPreferenceUserNameKey = "USERNAMEKEY";
  static String sharedPreferenceUserEmailKey = "USEREMAILKEY";
   static String sharedPreferenceUserYearKey = "USERYEARKEY";
  static String sharedPreferenceUserCollegeKey = "USERCOLLEGEKEY";
   static String sharedPreferenceUserBranchKey = "USERBRANCHKEY";
  static String sharedPreferenceUserPhoneKey = "USERPHONEKEY";



  /// saving data to sharedpreference
  static Future<bool> saveUserLoggedInSharedPreference(bool isUserLoggedIn) async{

    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(sharedPreferenceUserLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameSharedPreference(String userName) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUserNameKey, userName);
  }

  static Future<bool> saveUserEmailSharedPreference(String userEmail) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUserEmailKey, userEmail);
  }
   static Future<bool> saveUserYearSharedPreference(String userYear) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUserEmailKey, userYear);
  }
   static Future<bool> saveUserCollegeSharedPreference(String userCollege) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUserEmailKey, userCollege);
  }
   static Future<bool> saveBranchSharedPreference(String userBranch) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUserEmailKey, userBranch);
  }
   static Future<bool> saveUserPhoneSharedPreference(String userPhone) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUserEmailKey, userPhone);
  }
   

  /// fetching data from sharedpreference
  /// 
  static Future<bool> getUserLoggedInSharedPreference() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(sharedPreferenceUserLoggedInKey);
  }

  static Future<String> getUserNameSharedPreference() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(sharedPreferenceUserNameKey);
  }

  static Future<String> getUserEmailSharedPreference() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(sharedPreferenceUserEmailKey);
  }
  static Future<String> getUserYearSharedPreference() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(sharedPreferenceUserYearKey);
  }
  static Future<String> getUserBranchSharedPreference() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(sharedPreferenceUserBranchKey);
  }
  static Future<String> getUserPhoneSharedPreference() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(sharedPreferenceUserPhoneKey);
  }
 static Future<String> getUserCollegeSharedPreference() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(sharedPreferenceUserCollegeKey);
  }

}

