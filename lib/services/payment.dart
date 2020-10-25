import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

int back, words;

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  Razorpay razorpay;
  TextEditingController coinEditingController = new TextEditingController();
  int x = 50;
  @override
  void initState() {
    super.initState();
    getmode();
    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  getmode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      back = preferences.getInt('back');
      words = preferences.getInt('words');
    });
  }

  @override
  void dispose() {
// TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    var options = {
      "key": "rzp_live_ozPULXLDgca7CR",
      "amount": x * 100,
      "description": "Academic Master",
      // "prefill": {"contact": "6677545343", "email": "amit@gmail.com"},
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlerPaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
      msg: "Your Payment is Successfull",
      fontSize: 30,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );

    print("Pamyent successful");
    //Uploadcoin2();
// success();
  }

  void handlerErrorFailure(PaymentFailureResponse response) {
    print("Payment error");
    Fluttertoast.showToast(
      msg: "error" + response.code.toString() + "." + response.message,
      fontSize: 30,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  void handlerExternalWallet(ExternalWalletResponse response) {
    print("External Wallet");
    Fluttertoast.showToast(
      msg: "External Wallet" + response.walletName,
      fontSize: 30,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(back),
      appBar: AppBar(
          backgroundColor: Color(back),
          title: Text("Academic Master Membership",
              style: TextStyle(color: Color(words), fontSize: 15))),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  x = 200;
                });
                openCheckout();
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFB9F2FF),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3))
                      ]),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 38.0),
                      child: Center(
                          child: Text("Diamond",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 38.0),
                      child: Center(
                          child: Text("200₹ / Year",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("⚫ You can Mail Or Message us (24 X 7)"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "⚫ You will be  download every notes and Books."),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: Text(
                          "⚫We will provide placement preparation material."),
                    )
                  ])),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  x = 100;
                });
                openCheckout();
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFD7BE69),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3))
                      ]),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 38.0),
                      child: Center(
                          child: Text("Gold",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 38.0),
                      child: Center(
                          child: Text("100₹ / 6 Months",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("⚫ You can Mail Or Message us (24 X 7)"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "⚫ You will be  download every notes and Books."),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: Text(
                          "⚫We will provide placement preparation material."),
                    )
                  ])),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  x = 50;
                });
                openCheckout();
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFBEC2CB),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3))
                      ]),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 38.0),
                      child: Center(
                          child: Text("Silver",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 38.0),
                      child: Center(
                          child: Text("50₹ / 3 Months",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("⚫ You can Mail Or Message us (24 X 7)"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "⚫ You will be  download every notes and Books."),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: Text(
                          "⚫We will provide placement preparation material."),
                    )
                  ])),
            ),
          )
        ],
      )),
    );
  }
}
