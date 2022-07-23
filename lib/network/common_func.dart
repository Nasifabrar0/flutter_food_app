
import 'package:flutter/material.dart';

class CommonFunc{
  showSnackMsg(msg, context){
    SnackBar snackBar = SnackBar(content: Text(msg), action: SnackBarAction(label: 'Ok', onPressed: ((){
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    })),);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

  }
}