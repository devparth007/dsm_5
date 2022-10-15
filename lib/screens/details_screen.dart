import 'package:dsm_5/provider/home_provider.dart';
import 'package:dsm_5/screens/auth_screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../common/theme.dart';
import 'auth_screens/email_verify.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  // final TextEditingController _weight = TextEditingController();
  // final TextEditingController _height = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int _groupValue = -1;
  int _currentWeight = 0;
  int _currentHeight = 0;
  double _value = 0.0;
  String? dropDown;
  String? dropDownHeight;
//==============================================================================

  Future<bool> _onWillPop() async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SignupScreen(),
        ));
    return Future(() => false);
  }

//==============================================================================
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final data = Provider.of<HomeProvider>(context);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Details',
            style: AppTheme.black16w600,
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 45,
              width: 40,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppTheme.lightMainColor,
                ),
              ),
              child: SvgPicture.asset(
                'assets/details_image/back_arrow.svg',
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ElevatedButton(
              style: AppTheme.commonButtonStyle,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EmailVerify(),
                    ));
              },
              child: Text(
                'Submit',
                style: AppTheme.white14w600,
              ),
            )),
        body: Form(
          key: _formKey,
          child: Container(
            height: height,
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Gender',
                    style: AppTheme.black16w600,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() => _groupValue = 0);
                              },
                              child: Container(
                                height: 150,
                                width: width,
                                margin: const EdgeInsets.all(15),
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: _groupValue == 0
                                          ? AppTheme.greenColor
                                          : AppTheme.lightMainColor),
                                ),
                                child: SvgPicture.asset(
                                    'assets/details_image/men.svg',
                                    color: _groupValue == 0
                                        ? AppTheme.mainColor
                                        : AppTheme.blackColor),
                              ),
                            ),
                            Positioned(
                              top: 12,
                              right: 12,
                              child: Theme(
                                data: ThemeData(
                                  radioTheme: RadioThemeData(
                                    fillColor: MaterialStateProperty.all(
                                        AppTheme.greenColor),
                                  ),
                                ),
                                child: Radio(
                                  groupValue: _groupValue,
                                  onChanged: (int? newValue) =>
                                      setState(() => _groupValue = 0),
                                  value: 0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() => _groupValue = 1);
                              },
                              child: Container(
                                height: 150,
                                width: width,
                                margin: const EdgeInsets.all(15),
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: _groupValue == 1
                                          ? AppTheme.greenColor
                                          : AppTheme.lightMainColor),
                                ),
                                child: SvgPicture.asset(
                                    'assets/details_image/women.svg',
                                    color: _groupValue == 1
                                        ? AppTheme.mainColor
                                        : AppTheme.blackColor),
                              ),
                            ),
                            Positioned(
                              top: 12,
                              right: 12,
                              child: Theme(
                                data: ThemeData(
                                  radioTheme: RadioThemeData(
                                    fillColor: MaterialStateProperty.all(
                                        AppTheme.greenColor),
                                  ),
                                ),
                                child: Radio(
                                  groupValue: _groupValue,
                                  onChanged: (int? newValue) =>
                                      setState(() => _groupValue = 1),
                                  value: 1,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Weight',
                    style: AppTheme.black16w600,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      // Expanded(
                      //   flex: 3,
                      //   child: Container(
                      //     height: 60,
                      //     width: width,
                      //     padding: const EdgeInsets.symmetric(horizontal: 15),
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(15),
                      //       border: Border.all(
                      //         color: AppTheme.lightMainColor,
                      //       ),
                      //     ),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         GestureDetector(
                      //           onTap: () {
                      //             if (data.countWeight > 0) {
                      //               Provider.of<HomeProvider>(context,
                      //                       listen: false)
                      //                   .decrementWeight();
                      //             }
                      //           },
                      //           child: Container(
                      //             height: 25,
                      //             width: 25,
                      //             decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(15),
                      //               border: Border.all(
                      //                 color: AppTheme.mainColor,
                      //                 width: 2,
                      //               ),
                      //             ),
                      //             child: const Icon(
                      //               Icons.remove,
                      //               size: 15,
                      //             ),
                      //           ),
                      //         ),
                      //
                      //         SizedBox(
                      //           width: 100,
                      //           child: TextFormField(
                      //             controller: _weight,
                      //             onChanged: (value) {
                      //               // count = _weight.value as int;
                      //             },
                      //             style: AppTheme.black16w600,
                      //             autovalidateMode:
                      //                 AutovalidateMode.onUserInteraction,
                      //             textInputAction: TextInputAction.next,
                      //             keyboardType: TextInputType.number,
                      //             decoration: InputDecoration(
                      //               hintText: '00.0',
                      //               isDense: true,
                      //               border: InputBorder.none,
                      //               fillColor: AppTheme.whiteColor,
                      //               filled: true,
                      //             ),
                      //           ),
                      //         ),
                      //         // Text(
                      //         //   data.countWeight.toString(),
                      //         //   style: AppTheme.mainColor16w600,
                      //         // ),
                      //
                      //         GestureDetector(
                      //           onTap: () {
                      //             Provider.of<HomeProvider>(context,
                      //                     listen: false)
                      //                 .incrementWeight();
                      //             setState(() {
                      //               //  data.countWeight.toString() =  _weight.text;
                      //             });
                      //           },
                      //           child: Container(
                      //             height: 25,
                      //             width: 25,
                      //             decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(15),
                      //               border: Border.all(
                      //                   color: AppTheme.mainColor, width: 2),
                      //             ),
                      //             child: const Icon(
                      //               Icons.add,
                      //               size: 15,
                      //             ),
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                        flex: 2,
                        child: NumberPicker(
                          itemWidth: 50,
                          itemHeight: 50,
                          haptics: true,
                          itemCount: 5,
                          axis: Axis.horizontal,
                          value: _currentWeight,
                          minValue: 0,
                          maxValue: 150,
                          selectedTextStyle: AppTheme.main20w600,
                          onChanged: (value) =>
                              setState(() => _currentWeight = value),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: SizedBox(
                          height: 60,
                          child: DropdownButtonFormField<String>(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            dropdownColor: AppTheme.lightMainColor,
                            decoration: InputDecoration(
                              hintText: "KG",
                              errorMaxLines: 2,
                              contentPadding: const EdgeInsets.fromLTRB(
                                  15.0, 20, 20.0, 20.0),
                              hintStyle: AppTheme.mainColor16w600,
                              enabledBorder: AppTheme.textFieldBorder,
                              focusedBorder: AppTheme.textFieldBorder,
                            ),
                            value: dropDown,
                            isExpanded: true,
                            isDense: true,
                            validator: (value) =>
                                value == null ? 'ⓘ Required' : null,
                            icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: AppTheme.whiteColor,
                            ),
                            iconSize: 24,
                            elevation: 16,
                            onChanged: (newValue) {
                              setState(() {
                                dropDown = newValue.toString();
                              });
                            },
                            items: [
                              "KG",
                              "LBS",
                            ].map<DropdownMenuItem<String>>((value) {
                              return DropdownMenuItem<String>(
                                alignment: Alignment.centerLeft,
                                value: value,
                                child: Text(
                                  value,
                                  style: AppTheme.mainColor16w600,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Height',
                      style: AppTheme.black16w600,
                    ),
                  ),
                  Row(
                    children: [
                      // Expanded(
                      //   flex: 3,
                      //   child: Container(
                      //     height: 60,
                      //     width: width,
                      //     padding: const EdgeInsets.symmetric(horizontal: 15),
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(15),
                      //       border: Border.all(
                      //         color: AppTheme.lightMainColor,
                      //       ),
                      //     ),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         GestureDetector(
                      //           onTap: () {
                      //             if (data.countHeight > 0) {
                      //               Provider.of<HomeProvider>(context,
                      //                       listen: false)
                      //                   .decrementHeight();
                      //             }
                      //           },
                      //           child: Container(
                      //             height: 25,
                      //             width: 25,
                      //             decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(15),
                      //               border: Border.all(
                      //                 color: AppTheme.mainColor,
                      //                 width: 2,
                      //               ),
                      //             ),
                      //             child: const Icon(
                      //               Icons.remove,
                      //               size: 15,
                      //             ),
                      //           ),
                      //         ),
                      //         Text(
                      //           data.countHeight.toString(),
                      //           style: AppTheme.mainColor16w600,
                      //         ),
                      //         GestureDetector(
                      //           onTap: () {
                      //             Provider.of<HomeProvider>(context,
                      //                     listen: false)
                      //                 .incrementHeight();
                      //           },
                      //           child: Container(
                      //             height: 25,
                      //             width: 25,
                      //             decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(15),
                      //               border: Border.all(
                      //                   color: AppTheme.mainColor, width: 2),
                      //             ),
                      //             child: const Icon(
                      //               Icons.add,
                      //               size: 15,
                      //             ),
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                        flex: 2,
                        child: NumberPicker(
                          itemWidth: 50,
                          itemHeight: 50,
                          haptics: true,
                          itemCount: 5,
                          axis: Axis.horizontal,
                          value: _currentHeight,
                          minValue: 0,
                          maxValue: 150,
                          selectedTextStyle: AppTheme.main20w600,
                          onChanged: (value) =>
                              setState(() => _currentHeight = value),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 60,
                          child: DropdownButtonFormField<String>(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            // menuMaxHeight: 10,
                            dropdownColor: AppTheme.lightMainColor,
                            decoration: InputDecoration(
                              hintText: "CM",
                              errorMaxLines: 2,
                              contentPadding: const EdgeInsets.fromLTRB(
                                  15.0, 20, 20.0, 20.0),
                              hintStyle: AppTheme.mainColor16w600,
                              enabledBorder: AppTheme.textFieldBorder,
                              focusedBorder: AppTheme.textFieldBorder,
                            ),
                            value: dropDownHeight,
                            isExpanded: true,
                            isDense: true,
                            validator: (value) =>
                                value == null ? 'ⓘ Required' : null,
                            icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: AppTheme.whiteColor,
                            ),
                            iconSize: 24,
                            elevation: 16,
                            onChanged: (newValue) {
                              setState(() {
                                dropDownHeight = newValue.toString();
                              });
                            },
                            items: [
                              "CM",
                              "M",
                            ].map<DropdownMenuItem<String>>((value) {
                              return DropdownMenuItem<String>(
                                alignment: Alignment.centerLeft,
                                value: value,
                                child: Text(
                                  value,
                                  style: AppTheme.mainColor16w600,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Age',
                      style: AppTheme.black16w600,
                    ),
                  ),
                  SfSlider(
                    min: 0,
                    max: 100,
                    value: _value,
                    thumbIcon: Center(
                      child: Text(
                        _value.toString().split(".").first,
                        style: AppTheme.white14w600,
                      ),
                    ),
                    enableTooltip: true,
                    dividerShape: const SfDividerShape(),
                    stepSize: 1.0,
                    trackShape: const SfTrackShape(),
                    onChanged: (dynamic value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                  // Container(
                  //   height: 50,
                  //   width: width,
                  //   padding: const EdgeInsets.symmetric(horizontal: 15),
                  //   margin: const EdgeInsets.only(bottom: 50),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(15),
                  //     border: Border.all(
                  //       color: AppTheme.lightMainColor,
                  //     ),
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       GestureDetector(
                  //         onTap: () {
                  //           if (data.countAge > 0) {
                  //             Provider.of<HomeProvider>(context, listen: false)
                  //                 .decrementAge();
                  //           }
                  //         },
                  //         child: Container(
                  //           height: 25,
                  //           width: 25,
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(15),
                  //             border: Border.all(
                  //               color: AppTheme.mainColor,
                  //               width: 2,
                  //             ),
                  //           ),
                  //           child: const Icon(
                  //             Icons.remove,
                  //             size: 15,
                  //           ),
                  //         ),
                  //       ),
                  //       Text(
                  //         data.countAge.toString(),
                  //         style: AppTheme.mainColor16w600,
                  //       ),
                  //       GestureDetector(
                  //         onTap: () {
                  //           Provider.of<HomeProvider>(context, listen: false)
                  //               .incrementAge();
                  //         },
                  //         child: Container(
                  //           height: 25,
                  //           width: 25,
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(15),
                  //             border: Border.all(
                  //                 color: AppTheme.mainColor, width: 2),
                  //           ),
                  //           child: const Icon(
                  //             Icons.add,
                  //             size: 15,
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
