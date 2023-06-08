
import 'package:flutter/material.dart';
import 'helloScreen.dart';
import 'auth_screen.dart';
import 'reg_screen.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (BuildContext context) => firstScreen(),

    },
    onGenerateRoute: (routeSettings){
      var path=[];
      String rname = routeSettings.name.toString();
      path = rname.split('/');
      //
      if (path[1]=='auth'){
        return new MaterialPageRoute(
          builder: (context)=>new LoginPage(),
          settings: routeSettings,
        );
      };
      if (path[1]=='reg'){
        return new MaterialPageRoute(
          builder: (context)=>new RegistrationPage(),
          settings: routeSettings,
        );
      };
      // if (path[1]=='elementList'){
      //   return new MaterialPageRoute(
      //     builder: (context)=>new elementList(value:path[2]),
      //     settings: routeSettings,
      //   );
      // };
      // if (path[1]=='elementList2'){
      //   return new MaterialPageRoute(
      //     builder: (context)=>new elementList2(value:path[2]),
      //     settings: routeSettings,
      //   );
      // };
      // if (path[1]=='elementView'){
      //   return new MaterialPageRoute(
      //     builder: (context)=>new elementView(value:path[2]),
      //     settings: routeSettings,
      //   );
      // };
      // if (path[1]=='elementForm'){
      //   return new MaterialPageRoute(
      //     builder: (context)=>new elementForm(value:path[2]),
      //     settings: routeSettings,
      //   );
      // };
      // if (path[1]=='elementForm2'){
      //   return new MaterialPageRoute(
      //     builder: (context)=>new elementForm2(value:path[2]),
      //     settings: routeSettings,
      //   );
      // };
    },

  ));
}