import 'package:flutter/material.dart';
import '../core/theme/theme.dart';
import '../core/utils/app_navigator.dart';
import '../core/utils/identifier_manager.dart';
import 'app_clickable_text.dart';

class AppUserDataContainer extends SizedBox{
  AppUserDataContainer({super.key, 
    required BuildContext context,
    required bool hasData,
    required IconData noDataIcon,
    required String noDataText,
    required Widget child,
    required Widget signInPage
  }):super(
    child: hasData? 
      child : 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(noDataIcon, color: AppColor.grey500, size: 50,),
          Text(noDataText, style: AppTextStyle.textLgStyle(color: AppColor.grey500),),
          if(!IdentifierManager.isAuthenticated())
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            AppClickableText(
              foregroundColor: AppColor.primaryColor,
              onPressed: (){
                AppNavigator.navigatePush(context, SignInPage());
              }, 
              child:Text("Masuk", style: AppTextStyle.textNStyle(fontWeight: FontWeight.bold),)
            ),
            Text("untuk melanjutkan", style: AppTextStyle.textNStyle(),)
          ],)
        ]
      )
    );
}