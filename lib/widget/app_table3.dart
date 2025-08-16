import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/src/app_icon_button.dart';
import 'package:flutter_widgets/src/app_text_field.dart';
import 'package:flutter_widgets/theme/app_color.dart';
import 'package:flutter_widgets/theme/app_text_style.dart';
import 'package:shimmer/shimmer.dart';

class AppTable3 extends StatefulWidget {
  final List<AppTableTitle3> titles;
  final List<List<AppTableCell3>> data;
  final List<AppTableFooter>?footer;
  final bool isRefreshing;
  Function(String)? onSearch;
  Function(int)? onChangePageRow;
  Function(int)? onChangePageNo;
  int pageNo;
  int pageRow;
  final Color headerColor; 
  final Color oddRowColor; 
  final Color evenRowColor; 

  AppTable3({
    super.key,
    required this.titles,
    required this.data,
    required this.isRefreshing,
    this.onSearch,
    this.onChangePageRow,
    this.onChangePageNo,
    this.pageNo = 1,
    this.pageRow = 10,
    this.footer,
    Color? headerColor,
    Color? oddRowColor,
    Color? evenRowColor
  }): headerColor = headerColor ?? AppColor.primaryColor,
    oddRowColor = oddRowColor ?? AppColor.whiteColor,
    evenRowColor = evenRowColor ?? AppColor.tertiaryColor;

  @override
  State<AppTable3> createState() => _AppTableState();
}

class _AppTableState extends State<AppTable3> {
  final TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  final List<String> dropdownItems = [
    '10/page',
    '20/page',
    '50/page',
  ];

  void _onChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(seconds: 1), () {
      widget.onSearch??(query);
    });
  }

  ScrollController headerScrollController = ScrollController();
  ScrollController bodyScrollController = ScrollController();
  ScrollController bodyVerticalScrollController = ScrollController();
  ScrollController footerScrollController = ScrollController();

  @override
  initState(){
    super.initState();
    headerScrollController.addListener(() {
      if (bodyScrollController.hasClients && 
          bodyScrollController.offset != headerScrollController.offset) {
        bodyScrollController.jumpTo(headerScrollController.offset);
      }
    });

    bodyScrollController.addListener(() {
      if (headerScrollController.hasClients &&
          headerScrollController.offset != bodyScrollController.offset) {
        headerScrollController.jumpTo(bodyScrollController.offset);
      }
      if(footerScrollController.hasClients && 
        footerScrollController.offset != bodyScrollController.offset){
        footerScrollController.jumpTo(bodyScrollController.offset);
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }
  


  Widget customTable({
  required List<AppTableTitle3> titles,
  required List<List<AppTableCell3>> data,
  required int itemCount,
}) {

  return Flexible(
    child: Column(
      children: [
        // Sticky Header
        Container(
          color: widget.headerColor,
          alignment: Alignment.center,
          height: 40,
          child: 
            Row(
              children: [
                titles.first,
                Flexible(
                  child: SingleChildScrollView(
                    physics: ScrollPhysics(),
                    controller: headerScrollController,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: titles.skip(1).toList(),
                    ),
                  ),
                ),
              ],
            ),
        ),
        // Scrollable Body
        Flexible(
          child: Scrollbar(
            thumbVisibility: true,
            controller: bodyVerticalScrollController,
            child: SingleChildScrollView(
            controller: bodyVerticalScrollController,
            child: Row(
              children: [
                Column(children: 
                  List.generate(itemCount, (index) {
                    return Container(
                      color: index % 2 == 0
                        ? widget.oddRowColor
                        : widget.evenRowColor,
                      height: 40,
                      child: data[index].first);}
                  )
                ),
                Flexible(
                  child: Scrollbar(
                    thumbVisibility: true,
                    controller: bodyScrollController,
                    child: SingleChildScrollView(
                      physics: ScrollPhysics(),
                      controller: bodyScrollController,
                      scrollDirection: Axis.horizontal,
                      child: Column(children: 
                        List.generate(itemCount, (index) {
                          return Container(
                            height: 40,
                            alignment: Alignment.center,
                            color: index % 2 == 0
                                  ? widget.oddRowColor
                                  : widget.evenRowColor,
                            child: Row(
                              children: data[index]
                                .skip(1)
                                .toList()
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
        if(widget.footer!=null)
        Row(
          children: [
            widget.footer!.first,
            Flexible(
              child: SingleChildScrollView(
                controller: footerScrollController,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: widget.footer!.skip(1).toList(),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(widget.onSearch!=null)
        Row(
          children: [
            Expanded(
              child: SizedBox(
                  height: 40,
                  child: AppTextField(
                    context: context,
                    textEditingController: searchController,
                    hintText: "Cari",
                    onChanged: _onChanged,
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.all(0),
                  )),
            ),
          ],
        ),
        SizedBox(height: 5),
        !widget.isRefreshing
            ? customTable(
              itemCount: widget.data.length,
                titles: widget.titles,
                data: widget.data
              )
            : Flexible(child: _buildShimmerTable(100)),
        SizedBox(height: 5),
        if(widget.onChangePageNo!=null && widget.onChangePageRow!=null)
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppIconButton(
              onPressed: () {
                if(widget.onChangePageNo!=null){
                  widget.onChangePageNo!(widget.pageNo - 1);
                }
              },
              icon: Icon(Icons.arrow_back_ios_rounded),
            ),
            Container(
              width: 25,
              decoration: BoxDecoration(
                  border: Border.all(), borderRadius: BorderRadius.circular(5)),
              child: Text(
                "${widget.pageNo}",
                style: AppTextStyle.textNStyle(),
                textAlign: TextAlign.center,
              ),
            ),
            AppIconButton(
              onPressed: () {
                if(widget.onChangePageNo!=null){
                  widget.onChangePageNo??(widget.pageNo + 1);
                }
              },
              icon: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.grey500),
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButton<String>(
                  underline: SizedBox.shrink(),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  value: "${widget.pageRow}/page",
                  onChanged: (String? newValue) {
                    if(widget.onChangePageRow!=null){
                      widget.onChangePageRow??(int.parse((newValue ?? "10/page").split("/")[0]));
                    }
                  },
                  icon: Icon(Icons.arrow_drop_down),
                  isDense: true,
                  dropdownColor: AppColor.whiteColor,
                  items: dropdownItems
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: AppTextStyle.textNStyle(),
                      ),
                    );
                  }).toList(),
                  elevation: 8,
                )),
          ],
        )
      ],
    );
  }

  Widget _buildShimmerTable(double columnWidth) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          color: AppColor.primaryColor,
          child: Row(children: widget.titles.map((title) => title).toList())),
        SizedBox(height: 5),
        ...List.generate(
          2,
          (index) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                  height: 40,
                  margin: EdgeInsets.only(bottom: 5),
                  color: AppColor.whiteColor, 
                  child: Row(
                    children: widget.titles.map((title) {
                    return Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: title);
                  }).toList()),
            ));
          },
        ),
      ]),
    );
  }
}

class AppColumn {
  final AppTableTitle3 title;
  final List<AppTableCell3> data;

  AppColumn({
    required this.title,
    required this.data,
  });
}

class AppTableCell3 extends StatelessWidget {
  final String? value;
  final double? width;
  final Widget? customWidget;
  final Color? foregroundColor;
  final TextAlign? textAlign;
  final VoidCallback? action;
  
  const AppTableCell3({
    super.key,
    this.value,
    this.width,
    this.customWidget,
    this.foregroundColor,
    this.textAlign = TextAlign.center,
    this.action
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: action,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero, 
        shape: RoundedRectangleBorder(),
        foregroundColor: foregroundColor,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap, 
        visualDensity: VisualDensity.compact
      ),
      child: SizedBox(
        width: width,
        child: customWidget==null && value!=null? Text(
            value ?? '',
            textAlign: textAlign,
            style: AppTextStyle.textNStyle(
              color: foregroundColor
            ),
          ) : Center(child: customWidget,),
      )
    );
  }
}

// class AppTableTitle3 extends ConstrainedBox {
//   final TextAlign textAlign;
//   final String value;
//   final Widget? customWidget;
//   final Color textColor;
//   double? width;

//   AppTableTitle3({
//     super.key, 
//     this.value = '', 
//     this.customWidget,
//     this.width, 
//     this.textColor = AppColor.whiteColor,
//     this.textAlign = TextAlign.center
//   }) : super(
//       constraints: width != null
//         ? BoxConstraints(maxWidth: width)
//         : const BoxConstraints(),
//       child: customWidget ?? Text(
//         value,
//         style: AppTextStyle.textSubtitleStyle(
//           color: textColor,
//         ),
//         textAlign: textAlign,
//     ),
//   );
// }


class AppTableTitle3 extends SizedBox {
  final TextAlign textAlign;
  final String value;
  final Widget? customWidget;
  final Color? textColor;

  AppTableTitle3({
    super.key, 
    this.value = '', 
    this.customWidget,
    this.textColor,
    super.width, 
    this.textAlign = TextAlign.center
  }) : super(
      child: customWidget ?? Text(
        value,
        style: AppTextStyle.textMdStyle(
          color: textColor ?? AppColor.whiteColor,
        ),
        textAlign: textAlign,
    ),

  );
}

class AppTableFooter extends Container {
  final String? value;
  final Widget? customWidget;
  final Color? color;

  AppTableFooter({
    super.key, 
    this.value, 
    super.width = 100, 
    super.height = 40,
    super.alignment = Alignment.center,
    this.color,
    this.customWidget
  }) : super(
      color: color ?? AppColor.purpleColor,
      child: value!=null? 
      Text(
        value,
        style: AppTextStyle.textNStyle(
          color: Colors.white,
        ),
      ):customWidget,
  );
}