import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../../utils/data.dart';
import '../Widgets/widget_utils.dart';
import 'add_bank.dart';

//ignore: must_be_immutable
class SelectBankScreen extends StatefulWidget {
  SelectBankScreen({Key? key, this.selectedMethod}) : super(key: key);
  dynamic selectedMethod;

  @override
  State<SelectBankScreen> createState() => _SelectBankScreenState();
}

class _SelectBankScreenState extends State<SelectBankScreen> {
  TextEditingController searchController = TextEditingController();
  var isClosed = true.obs;
  var searchedList = [].obs;

  back() {
    Get.back();
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return back();
      },
      child: Obx(
        () => Scaffold(
          body: SizedBox(
            width: 100.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 20.h,
                  padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 2.h),
                  decoration: BoxDecoration(color: accentColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      getVerSpace(2.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                              Get.back();
                            },
                            child: Icon(Icons.arrow_back_ios_new_outlined,
                                color: backgroundColor, size: 2.5.h),
                          ),
                          const Spacer(),
                          getCustomTextW6S22(
                            text: 'Search ${widget.selectedMethod}',
                            color: textWhiteColor,
                          ),
                          const Spacer()
                        ],
                      ),
                      getCustomTextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        hintText: 'Search (e.g. bank name)...'.tr,
                        controller: searchController,
                        onChanged: (value) {
                          searchedList.clear();
                          if (DataFile.bankMethodModel.isNotEmpty) {
                            for (var element in DataFile.bankMethodModel) {
                              if (element.nameBank!
                                  .toLowerCase()
                                  .contains(searchController.text)) {
                                searchedList.add(element);
                              }
                            }
                          }

                          if (searchController.text.isNotEmpty) {
                            isClosed.value = false;
                          } else {
                            isClosed.value = true;
                          }
                        },
                        prefixIcon: Icon(
                          Icons.search,
                          color: accentColor,
                          size: 30.px,
                        ),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              searchController.clear();
                              searchedList.clear();
                              isClosed.value = true;
                            },
                            child: isClosed.value == true
                                ? Container()
                                : Icon(
                                    Icons.cancel,
                                    color: feePayCardColor,
                                    size: 20.px,
                                  )),
                      ),
                    ],
                  ),
                ),
                getVerSpace(3.h),
                Expanded(
                  child: searchController.text.isNotEmpty
                      ? ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 3.h),
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: searchedList.length,
                          itemBuilder: (context, index) {
                            return Obx(
                              () => GestureDetector(
                                onTap: () {
                                  Get.to(() => AddBankScreen(
                                        selectedBank: searchedList[index]
                                            .nameBank
                                            .toString(),
                                        selectedMethod: widget.selectedMethod,
                                      ));
                                  Timer(const Duration(milliseconds: 150), () {
                                    searchController.clear();
                                    searchedList.clear();
                                    isClosed.value = true;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 1.5.h),
                                  decoration: BoxDecoration(
                                      color: backgroundColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.px)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: borderColor,
                                        blurRadius: 5,
                                        offset: const Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ],),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 2.h),
                                        leading: CircleAvatar(
                                            radius: 2.5.h,
                                            backgroundColor: borderColor),
                                        title: getCustomTextW6S15(
                                            text: searchedList[index]
                                                .nameBank
                                                .toString()
                                                .tr,
                                            color: textBlackColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(horizontal: 3.h),
                          physics: const BouncingScrollPhysics(),
                          itemCount: DataFile.bankMethodModel.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => AddBankScreen(
                                      selectedBank: DataFile
                                          .bankMethodModel[index].nameBank
                                          .toString(),
                                      selectedMethod: widget.selectedMethod,
                                    ));
                                Timer(const Duration(milliseconds: 150), () {
                                  searchController.clear();
                                  searchedList.clear();
                                  isClosed.value = true;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 1.5.h),
                                decoration: BoxDecoration(
                                    color: backgroundColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.px)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: borderColor,
                                      blurRadius: 5,
                                      offset: const Offset(
                                          0, 0), // changes position of shadow
                                    ),
                                  ],),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ListTile(
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 2.h),
                                      leading: CircleAvatar(
                                          radius: 2.5.h,
                                          backgroundColor: borderColor),
                                      title: getCustomTextW6S15(
                                          text: DataFile
                                              .bankMethodModel[index].nameBank
                                              .toString()
                                              .tr,
                                          color: textBlackColor),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
