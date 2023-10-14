import 'dart:io';
import 'package:dio/dio.dart';
import 'package:translator/translator.dart';

void main()  async{
 factfunc();
}

Future <void> factfunc() async{
  final translator = GoogleTranslator();
  List<String> likefacts = [];
  String continueFunc;


  do {
    final response = await Dio().get('https://catfact.ninja/fact');
    //print(response.data);

    
      String translatedText = await translator
      .translate(response.data['fact'], to: 'ru')
      .then((value) => value.text);
      print(translatedText);
      
      print('Выберите действие');
      print("1)Понравился 2)Далее 3)Показать список понравившихся фактов 4)Закончить");
      
      String str = stdin.readLineSync()?? '';
      if(str == '1'){
        likefacts.add(translatedText);
      }else if(str == '2'){
        print(translatedText);
      }else if(str == '3'){
        print('Понравившиеся факты');
        for(var fact in likefacts){
          print(fact);
        }
      }else if(str == '4'){
        break;
      }
      

  } while (true);  

}