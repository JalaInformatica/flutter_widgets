import 'package:flutter/material.dart';

enum DeviceType {mobile, tab, desktop}

DeviceType responsiveSetting(context) {
  double width = MediaQuery.of(context).size.width;
  if(width>=1024){
    return DeviceType.desktop;
  }
  else if(width>=600){
    return DeviceType.tab;
  }
  else{
    return DeviceType.mobile;
  }
}