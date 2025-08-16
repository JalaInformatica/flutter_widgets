// import 'package:flutter/material.dart';
// import 'package:flutter_rating/flutter_rating.dart';
// import 'package:logistik/core/theme/theme.dart';
// import 'package:logistik/models/product/product_model.dart';
// import 'package:logistik/views/produk/product_detail/product_detail_page.dart';
// import 'package:logistik/widgets/app_image.dart';
// import 'package:logistik/widgets/formatidr.dart';

// // ignore: must_be_immutable
// class AppProductCard extends StatelessWidget {
//   final ProductModel product;
//   final String baseUrl;
//   Widget? button;
//   Widget? storeInfo;
//   bool hasSalonDetail;

//   AppProductCard(
//     {
//       super.key,
//       required this.product,
//       required this.baseUrl,
//       this.button,
//       this.hasSalonDetail = false,
//       this.storeInfo
//     });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => ProductDetail(product: product)));
//       },
//       child: Container(
//         width: 170.w,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: const [
//             BoxShadow(
//               color: Color.fromARGB(60, 0, 0, 0),
//               offset: Offset(1.0, 1.0),
//               blurRadius: 1.0,
//               spreadRadius: 0,
//             ),
//           ],
//         ),
//         child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
//           Stack(
//             children: [
//               AppImage(
//                   width: 170,
//                   height: 170,
//                   imageUrl: '$baseUrl/${product.mainImage}',
//                   radius: 10),
//               SizedBox(
//                   width: 170.w,
//                   height: 170.h,
//                   child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           mainAxisSize: MainAxisSize.max,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             if (product.isPromo)
//                               Container(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 8.w, vertical: 4.h),
//                                 margin: EdgeInsets.only(bottom: 5.h),
//                                 decoration: BoxDecoration(
//                                   color: AppColor.dangerColor.withOpacity(
//                                       0.8), // Background color with transparency
//                                   borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(10),
//                                       bottomRight: Radius.circular(10)),
//                                 ),
//                                 child: Text(
//                                   'Promo',
//                                   style: TextStyle(
//                                     color: Colors.white, // Text color
//                                     fontSize:
//                                         12.sp, // Adjust font size as needed
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             if (product.discountPct > 0)
//                               Container(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 8.w, vertical: 4.h),
//                                 decoration: BoxDecoration(
//                                   color: AppColor.secondaryColor.withOpacity(
//                                       0.8), // Background color with transparency
//                                   borderRadius: BorderRadius.only(
//                                       bottomLeft: Radius.circular(10),
//                                       topRight: Radius.circular(10)),
//                                 ),
//                                 child: Text(
//                                   'Off ${product.discountPct}%',
//                                   style: TextStyle(
//                                     color: Colors.white, // Text color
//                                     fontSize:
//                                         12.sp, // Adjust font size as needed
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               )
//                           ],
//                         ),
//                         if (product.isPacket)
//                           Container(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 8.w, vertical: 4.h),
//                             decoration: BoxDecoration(
//                               color: AppColor.primaryColor.withOpacity(
//                                   0.8), // Background color with transparency
//                               borderRadius: BorderRadius.only(
//                                   bottomLeft: Radius.circular(10),
//                                   topRight: Radius.circular(10)),
//                             ),
//                             child: Text(
//                               'Paket',
//                               style: TextStyle(
//                                 color: Colors.white, // Text color
//                                 fontSize: 12.sp, // Adjust font size as needed
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                       ])),
//             ],
//           ),
//           Padding(
//               padding: EdgeInsets.all(10.w),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "${product.partName}",
//                     style: AppTextStyle.textBodyStyle(),
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         '${CurrencyFormat.convertToIdr(product.unitPriceNet, 0)}',
//                         style: AppTextStyle.textBodyStyle(
//                             color: AppColor.primaryColor),
//                       ),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       product.unitPrice == product.unitPriceNet
//                           ? const SizedBox()
//                           : Text(
//                               '${CurrencyFormat.convertToIdr(product.unitPrice, 0)}',
//                               style: AppTextStyle.textCaptionStyle(
//                                   decorationColor: AppColor.grey500,
//                                   decoration: TextDecoration.lineThrough,
//                                   color: AppColor.grey500),
//                             )
//                     ],
//                   ),
//                   Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             StarRating(
//                               starCount: 1,
//                               size: bodySize,
//                               rating:
//                                   double.parse(product.totalRate.toString()),
//                             ),
//                             Text(
//                               "${product.totalRate}",
//                               style: AppTextStyle.textCaptionStyle(),
//                             ),
//                             SizedBox(
//                               width: 5.w,
//                             ),
//                             Text(
//                               "Terjual ${product.totalSold}",
//                               style: AppTextStyle.textCaptionStyle(),
//                             ),
//                           ],
//                         ),
//                       ]),
//                     // SizedBox(height: 5,),
//                   if (button != null)
//                     SizedBox(width: double.infinity, child: button),
//                 ],
//               )),
//         ]),
//       ),
//     );
//   }
// }
