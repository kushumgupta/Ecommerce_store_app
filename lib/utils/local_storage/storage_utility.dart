import 'package:get_storage/get_storage.dart';

class  ELocalStorage{
   static  final ELocalStorage _instance = ELocalStorage._internal();

   factory ELocalStorage(){
     return _instance;
   }

   ELocalStorage._internal();
   final _storage =GetStorage();

   //genetic method to save data
   Future<void> saveData<T>(String key, T value) async{
     await _storage.write(key, value);

   }

   T? readData<T>(String key){
     return _storage.read<T>(key);
   }

   Future<void> removeData(String key )async{
     return _storage.read(key);
   }

   Future<void>clearAll()async{
     await _storage.erase();
   }
}