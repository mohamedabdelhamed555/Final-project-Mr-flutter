import 'dart:async';
import 'dart:math';
import 'package:country_picker/country_picker.dart';
import 'package:final_project/Screens/home_screen.dart';
import 'package:final_project/Widget/animation_enum.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Artboard? riveArtboard;
  late RiveAnimationController controllerIdle;
  late RiveAnimationController controllerHandsUp;
  late RiveAnimationController controllerHandsDown;
  late RiveAnimationController controllerLookLeft;
  late RiveAnimationController controllerLookRight;
  late RiveAnimationController controllerSuccess;
  late RiveAnimationController controllerFail;
  var phoneController = TextEditingController();
  var otpController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLookingLeft = false;
  bool isLookingRight = false;
  String alertText = "";
  Country selectedCountry = Country(
      phoneCode: '20',
      countryCode: 'egy',
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: 'Egypt',
      example: 'Egypt',
      displayName: 'Egypt',
      displayNameNoCountryCode: 'Egypt',
      e164Key: '');

  void removeAllControllers() {
    riveArtboard?.artboard.removeController(controllerIdle);
    riveArtboard?.artboard.removeController(controllerHandsUp);
    riveArtboard?.artboard.removeController(controllerHandsDown);
    riveArtboard?.artboard.removeController(controllerLookLeft);
    riveArtboard?.artboard.removeController(controllerLookRight);
    riveArtboard?.artboard.removeController(controllerSuccess);
    riveArtboard?.artboard.removeController(controllerFail);
    isLookingLeft = false;
    isLookingRight = false;
  }

  void addIdleController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerIdle);
    debugPrint("idleee");
  }

  void addHandsUpController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerHandsUp);
    debugPrint("hands up");
  }

  void addHandsDownController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerHandsDown);
    debugPrint("hands down");
  }

  void addSuccessController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerSuccess);
    debugPrint("Success");
  }

  void addFailController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerFail);
    debugPrint("Faillll");
  }

  void addLookRightController() {
    removeAllControllers();
    isLookingRight = true;
    riveArtboard?.artboard.addController(controllerLookRight);
    debugPrint("Righttt");
  }

  void addLookLeftController() {
    removeAllControllers();
    isLookingLeft = true;
    riveArtboard?.artboard.addController(controllerLookLeft);
    debugPrint("Leftttttt");
  }

  @override
  void initState() {
    super.initState();
    controllerIdle = SimpleAnimation(AnimationEnum.idle.name);
    controllerHandsUp = SimpleAnimation(AnimationEnum.Hands_up.name);
    controllerHandsDown = SimpleAnimation(AnimationEnum.hands_down.name);
    controllerLookRight = SimpleAnimation(AnimationEnum.Look_down_right.name);
    controllerLookLeft = SimpleAnimation(AnimationEnum.Look_down_left.name);
    controllerSuccess = SimpleAnimation(AnimationEnum.success.name);
    controllerFail = SimpleAnimation(AnimationEnum.fail.name);
    rootBundle.load('assets/images/animation_login_screen.riv').then((data) {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      artboard.addController(controllerIdle);
      setState(() {
        riveArtboard = artboard;
      });
    });
  }


  void validateEmailAndPassword() {
    Future.delayed(const Duration(seconds: 1), () {
      if (formKey.currentState!.validate()) {
        addSuccessController();
      } else {
        addFailController();
      }
    });
  }

  final TextEditingController inputController = TextEditingController();
  int number = -1;
  String verificationResult = '';
  bool verifying = false;
  void generateRandomNumberAndShowDialog() {
    final int newNumber = nextNumber(min: 1000, max: 10000);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$newNumber'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff14142B),
              ),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
    setState(() {
      number = newNumber;
    });
  }

  void verifyNumber() {
    String inputNumber = otpController.text;
    if (number == int.tryParse(inputNumber) && inputNumber.length == 4) {
      setState(() {
        verificationResult = 'Correct!';
        verifying = true; // Set to true when verification is correct
      });
      // After a delay, navigate to the HomeScreen page
      mobileNumber = phoneController.text;
      Timer(const Duration(seconds: 3), () {
        Navigator.push(
          context,
          MaterialPageRoute(

            builder: (context) => homeScreen(),

            builder: (context) =>
                homeScreen(),

          ),
        );
      });
    } else {
      setState(() {
        verificationResult = 'Incorrect. Try again.';
      });
    }
  }

  int nextNumber({required int min, required int max}) =>
      Random().nextInt(max - min) + min;

  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
      TextPosition(offset: phoneController.text.length),
    );
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.6,
                child: riveArtboard == null
                    ? const SizedBox.shrink()
                    : Rive(

                        artboard: riveArtboard!,
                      ),

                  artboard: riveArtboard!,
                ),

              ),
              Form(
                key: formKey,
                child: Column(
                  children: [


                    TextFormField(
                      controller: phoneController,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                      decoration: InputDecoration(
                        prefixIcon: Container(
                          padding: const EdgeInsets.all(8),
                          child: InkWell(
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                countryListTheme: CountryListThemeData(

                                  bottomSheetHeight:
                                      MediaQuery.of(context).size.height / 2,

                                  bottomSheetHeight: MediaQuery.of(context).size.height / 2,

                                ),
                                onSelect: (value) {
                                  setState(() {
                                    selectedCountry = value;
                                  });
                                },
                              );
                            },
                            child: Text(
                              '${selectedCountry?.flagEmoji ?? '🇪🇬'} +${selectedCountry?.phoneCode ?? '20'}',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        labelStyle: const TextStyle(color: Colors.white),
                        labelText: "Enter phone number",
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      validator: (value) =>

                          value!.length != 11 ? "must contain 11 number" : null,

                      value!.length != 11 ? "must contain 11 number" : null,

                      onChanged: (value) {
                        if (value.isNotEmpty &&
                            value.length < 8 &&
                            !isLookingLeft) {
                          addLookLeftController();
                        } else if (value.isNotEmpty &&
                            value.length > 8 &&
                            !isLookingRight) {
                          addLookRightController();
                        }
                      },


                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    TextFormField(
                      controller: otpController,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(color: Colors.white),
                        labelText: "Enter OTP",
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      validator: (value) =>
                      value!.length != 4 ? "must contain 4-digit number" : null,

                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),

                    TextFormField(
                        controller: otpController,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(color: Colors.white),
                          labelText: "Enter OTP",
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.length != 4) {
                            return "must contain 4-digit number";
                          } else if (number != int.tryParse(value)) {
                            return "enter correct OTP";
                          } else {
                            return null;
                          }
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 2 / 3,
                        height: MediaQuery.of(context).size.height * 0.07,

                    Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Colors.white),
                        child: TextButton(
                          onPressed:
                             generateRandomNumberAndShowDialog
                          ,
                          child: const Text(
                            'Get OTP',
                            style: TextStyle(
                                fontSize: 25,
                                color: Kprimarycolor,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 2.5,

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Colors.white),
                        child: TextButton(

                          onPressed: generateRandomNumberAndShowDialog,
                          child: const Text(
                            'Get OTP',
                            style: TextStyle(
                              color: Color(0xff14142B),
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 2 / 3,
                        height: MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Colors.white),
                        child: TextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              verifyNumber();
                            } else {
                              addFailController();
                            }
                          },
                          child: verifying
                              ? const CircularProgressIndicator() // Show circular progress indicator during verification
                              : const Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Color(0xff14142B),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 2 / 3,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          AuthService().sinInWithGoogle();
                        },
                        icon: Image.asset(
                          'assets/images/google.png',
                          width: 24.0,
                          height: 24.0,
                        ),
                        label: const Text(
                          'Sign In with Gmail',
                          style: TextStyle(
                            color: Color(0xff14142B),
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          //foregroundColor: Colors.white,
                          //backgroundColor: Colors.red[280],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),

                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              verifyNumber ();
                            } else {
                              addFailController();
                            }
                          },
                          child: verifying
                              ? const CircularProgressIndicator() // Show circular progress indicator during verification
                              :
                          const Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 25,
                                color: Kprimarycolor,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        AuthService().sinInWithGoogle();
                      },
                      icon: Image.asset(
                        'assets/images/icons8-google-48-300x300.png',
                        width: 24.0,
                        height: 24.0,
                      ),
                      label: const Text('Sign In with Gmail'
                      , style: TextStyle(color: Color(0xff14142B)),),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        //foregroundColor: Colors.white,
                        //backgroundColor: Colors.red[280],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),

                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}