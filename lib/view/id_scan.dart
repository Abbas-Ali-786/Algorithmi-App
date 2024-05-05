import 'package:algorthimi/view/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cnic_scanner/cnic_scanner.dart';

import 'Widgets/widget_utils.dart';
import 'custom_dialog.dart';
import 'package:cnic_scanner/model/cnic_model.dart';
import 'package:algorthimi/utils/app_color.dart';

class CnicScan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CNIC Scanner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameTEController = TextEditingController(),
      cnicTEController = TextEditingController(),
      dobTEController = TextEditingController(),
      doiTEController = TextEditingController(),
      doeTEController = TextEditingController();

  CnicModel _cnicModel = CnicModel();
  bool _isCnicScanned = false;

  Future<void> scanCnic(ImageSource imageSource) async {
    CnicModel cnicModel =
    await CnicScanner().scanImage(imageSource: imageSource);
    if (cnicModel == null) return;
    setState(() {
      _cnicModel = cnicModel;
      nameTEController.text = _cnicModel.cnicHolderName;
      cnicTEController.text = _cnicModel.cnicNumber;
      dobTEController.text = _cnicModel.cnicHolderDateOfBirth;
      doiTEController.text = _cnicModel.cnicIssueDate;
      doeTEController.text = _cnicModel.cnicExpiryDate;
      _isCnicScanned = true; // Set flag to true when CNIC is scanned
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();// Navigate back when the icon is tapped
              },
              child: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 110, 0),
              child: Text(
                'Scan Your ID',
                style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ),
          ],
        ),

        backgroundColor: const Color(purple),
      ),

      body: Container(
        margin: const EdgeInsets.only(
            left: 20, right: 20, top: 50, bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 18,
            ),
            const Text(
              'Enter ID Card Details...',
              style: TextStyle(
                  color: Color(kDarkGreyColor),
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 35,
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                children: [
                  _dataField(
                      text: 'Name',
                      textEditingController: nameTEController),
                  _cnicField(
                      textEditingController: cnicTEController),
                  _dataField(
                      text: 'Date of Birth',
                      textEditingController: dobTEController),
                  _dataField(
                      text: 'Date of Card Issue',
                      textEditingController: doiTEController),
                  _dataField(
                      text: 'Date of Card Expire',
                      textEditingController: doeTEController),
                  const SizedBox(
                    height: 20,
                  ),
                  _getScanCNICBtn(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _cnicField(
      {required TextEditingController textEditingController}) {
    return Card(
      elevation: 7,
      margin: const EdgeInsets.only(top: 2.0, bottom: 5.0),
      child: Container(
        margin: const EdgeInsets.only(
            top: 2.0, bottom: 1.0, left: 0.0, right: 0.0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 3,
                height: 45,
                margin: const EdgeInsets.only(left: 3.0, right: 7.0),
              ),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Icon(Icons.credit_card_outlined,
                              color: Color(purple),
                              size: 17,),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text(
                              'CNIC Number',
                              style: TextStyle(
                                  color: Color(purple),
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: textEditingController,
                              decoration: const InputDecoration(
                                hintText: '00000-0000000-0',
                                hintStyle:
                                TextStyle(color: Color(kLightGreyColor)),
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.only(left: 32.0),
                              ),
                              style: const TextStyle(
                                  color: Color(kDarkGreyColor),
                                  fontWeight: FontWeight.bold),
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.left,
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dataField(
      {required String text,
        required TextEditingController textEditingController}) {
    return Card(
        shadowColor: Colors.green,
        elevation: 5,
        margin: const EdgeInsets.only(top: 10, bottom: 5,),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Icon(
                (text == "Name") ? Icons.person : Icons.date_range,
                color: const Color(purple),
                size: 17,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 15.0, top: 5, bottom: 3),
                    child: Text(text.toUpperCase(),
                      style: const TextStyle(color: Color(purple), fontSize: 12, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 5),
                    child: TextField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                        hintText: (text == "Name") ? "User Name" : 'DD/MM/YYYY',
                        border: InputBorder.none,
                        isDense: true,
                        hintStyle: const TextStyle(color: Color(kLightGreyColor), fontSize: 14, fontWeight: FontWeight.bold), contentPadding: const EdgeInsets.all(0),
                      ),
                      style: const TextStyle(color: Color(kDarkGreyColor), fontWeight: FontWeight.bold),
                      textInputAction: TextInputAction.done,
                      keyboardType: (text == "Name") ? TextInputType.text : TextInputType.number,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _getScanCNICBtn() {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            textStyle: const TextStyle(color: Colors.white),
            padding: const EdgeInsets.all(0.0),
          ),
          onPressed: () {
            showDialog(context: context, builder: (BuildContext context) {
              return CustomDialogBox(onCameraBTNPressed: () {scanCnic(ImageSource.camera);},
                  onGalleryBTNPressed: () {scanCnic(ImageSource.gallery);});
            });
          },
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: 500,
                decoration: const BoxDecoration(
                  color: Color(pink),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),),
                padding: const EdgeInsets.all(12.0),
                child: const Text('Scan CNIC', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20,),
        GestureDetector(
          onTap: () {
            if (_isCnicScanned) {
              Get.to(() => const OtpScreen());
              // Get.to(() => const ScanIdFreelancerScreen());
            } else {
              // Show a message that CNIC needs to be scanned first
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(seconds: 5),
                  content: Text('Please scan your CNIC first.'),
                ),
              );
            }
          },
          child: IgnorePointer(
            ignoring: !_isCnicScanned,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _isCnicScanned ? 1.0 : 0.5,
              child: fillColorButton(
                color: const Color(purple),
                text: 'Next'.tr,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
