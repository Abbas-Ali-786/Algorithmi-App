import 'package:flutter/material.dart';
import 'package:algorthimi/utils/app_color.dart';
import 'package:cnic_scanner/cnic_scanner.dart';

class CustomDialogBox extends StatefulWidget {
  Function onCameraBTNPressed, onGalleryBTNPressed;

  CustomDialogBox(
      {required this.onCameraBTNPressed, required this.onGalleryBTNPressed});

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
          margin: const EdgeInsets.only(top: 45),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                const BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Cnic Scan',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Please open your camera',
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Focus(
                    onFocusChange: (hasFocus) {
                    },
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        textStyle: const TextStyle(color: Colors.white),
                        padding: const EdgeInsets.all(0.0),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        widget.onCameraBTNPressed();
                      },
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 150,
                            decoration: const BoxDecoration(
                              color: Color(pink),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            padding: const EdgeInsets.all(12.0),
                            child: const Text('Open Camera',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  )

                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     elevation: 5,
                  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  //     textStyle: TextStyle(color: Colors.white),
                  //     padding: EdgeInsets.all(0.0),
                  //   ),
                  //   onPressed: () {{Navigator.pop(context);widget.onCameraBTNPressed();}
                  //   },
                  //   child: Column(
                  //     children: [
                  //       Container(
                  //         alignment: Alignment.center,
                  //         width: 150,
                  //         decoration: BoxDecoration(
                  //           color: Color(pink),
                  //           borderRadius: BorderRadius.all(Radius.circular(10.0)),),
                  //         padding: const EdgeInsets.all(12.0),
                  //         child: Text('Open Camera', style: TextStyle(fontSize: 18, color: Colors.white)),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  // ElevatedButton(onPressed: () {Navigator.pop(context);widget.onCameraBTNPressed();},
                  //
                  //     child: Text('Open Camera', style: TextStyle(fontSize: 18, color: Color(purple)),)
                  // ),

                  // TextButton(onPressed: () {Navigator.pop(context);widget.onGalleryBTNPressed();},
                  //
                  //     child: Text('GALLERY', style: TextStyle(fontSize: 18, color: Color(purple)),)),
                ],
              ),
            ],
          ),
        ),

        // Positioned(
        //   left: 20,
        //   right: 20,
        //   child: CircleAvatar(
        //     backgroundColor: Colors.transparent,
        //     radius: 45,
        //     child: ClipRRect(
        //         borderRadius: BorderRadius.all(Radius.circular(45)),
        //         child: Image.asset("assets/images/person_icon.png")),
        //   ),
        // ),
      ],
    );
  }
}
