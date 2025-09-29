import '../constants/local_storage.dart';
import 'hive_manager.dart';

class IdentifierManagerPos {
 static bool isAuthenticated(){
  return HiveManager.getStringData(LocalStorageConst.userId).isNotEmpty;
 }

 static Future<void> saveAuthenticationInfo({required String userId, required String sessionLoginId, required String companyId}) async {
  await HiveManager.saveData(LocalStorageConst.companyId, companyId);  
  await HiveManager.saveData(LocalStorageConst.userId, userId);
  await HiveManager.saveData(LocalStorageConst.sessionLoginId, sessionLoginId);      
 }

 static Future<void> removeAuthenticationInfo() async {
  HiveManager.deleteData(LocalStorageConst.userId);
  HiveManager.deleteData(LocalStorageConst.sessionLoginId);
  HiveManager.deleteData(LocalStorageConst.userName);
  HiveManager.deleteData(LocalStorageConst.ip);
  HiveManager.deleteData(LocalStorageConst.companyId);
  HiveManager.deleteData(LocalStorageConst.defCompanyId);
 }

 static Future<void> saveServerInfo({
  required String serverKey, 
  required String serverEndPoint,
  required String clientId,
  required String ip,
  }) async {
  await HiveManager.saveData(LocalStorageConst.serverKey, serverKey);
  await HiveManager.saveData(LocalStorageConst.serverEndPoint, serverEndPoint);
  await HiveManager.saveData(LocalStorageConst.clientId, clientId);
  await setIp(ip: ip);
 }

 static Future<void> setIp({required String ip}) async{
  await HiveManager.saveData(LocalStorageConst.ip, ip);
 }
 
 static String getUserId(){
  // return "93113b564f41af87edfc5656f9f915a3527893943462d1431efb02deaf920240";
  return HiveManager.getStringData(LocalStorageConst.userId);
 }

 static String getCompanyId(){
  return HiveManager.getStringData(LocalStorageConst.companyId);
 }
 
 static String getIp(){
  // return "";
  return HiveManager.getStringData(LocalStorageConst.ip);
 }
 
 static String getSessionLoginId(){
  // return "469CCE48BAF61E1BE855682D50AD7F8F5E7B502F3B9F9C7CD11F0C4FDBD48D8F";
  return HiveManager.getStringData(LocalStorageConst.sessionLoginId);
 }

 static Future<void> saveClientInfo({
  required String clientKey,
  required String dataDs,
 }) async {
  await HiveManager.saveData(LocalStorageConst.clientKey, clientKey);
  await HiveManager.saveData(LocalStorageConst.dataDs, dataDs);
 }

  static String getServerKey() {
    // return "13040d22e0e8257e46839836de4dfbf91";
    return HiveManager.getStringData(LocalStorageConst.serverKey);
  }

  static String getServerEndPoint() {
    // return "https://dreadnought.core-erp.com/MIGOR";
    return HiveManager.getStringData(LocalStorageConst.serverEndPoint);
  } 
  
  static String getClienId() {
    // return "E-COMMERCE";
    return HiveManager.getStringData(LocalStorageConst.clientId);
  } 
  
  static String getClientKey() {
    // return "544BB7D19CAD0A958D66CDF2BF8A243DAAA6512F8A90E26B6A1842530BD1EC28";
    return HiveManager.getStringData(LocalStorageConst.clientKey);
  } 
  
  static String getDataDs() {
    // return "ASDJ34501349500FKJDFSLDF03041B";
    return HiveManager.getStringData(LocalStorageConst.dataDs);
  } 
}