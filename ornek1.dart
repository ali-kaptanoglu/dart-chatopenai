
Tabii, aşağıda Dart programlama dilinde Shared Preferences kullanarak istediğiniz özellikleri taşıyan bir kod örneği bulunmaktadır. Bu kod, her butona tıklandığında Shared Preferences kullanarak saat bilgisini kaydedecek ve ardından diğer tıklamalarda 5 dakika geçip geçmediğini kontrol edecektir. Geçmişse belirtilen fonksiyonu çalıştıracak, geçmemişse ekrana bir toast mesajı yazdıracaktır. İyi kullanımlar!

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  void handleClick() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int currentTime = DateTime.now().millisecondsSinceEpoch;
    int savedTime = prefs.getInt('saved_time') ?? 0;

    if (currentTime - savedTime >= 5 * 60 * 1000) {
      // 5 dakika geçmişse
      prefs.setInt('saved_time', currentTime);
      myFunction();
    } else {
      // 5 dakika geçmemişse
      showToastMessage("5 dakika dolmadı.");
    }
  }

  void myFunction() {
    showToastMessage("Fonksiyon çalıştı!");
  }

  void showToastMessage(String message) {
    print(message); // Burada mesajı konsola yazdırıyoruz. Gerçek bir Toast mesajı için kullanılan kütüphaneye bağlıdır.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences Example'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Button'),
          onPressed: handleClick,
        ),
      ),
    );
  }
}
