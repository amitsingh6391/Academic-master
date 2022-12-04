import 'package:academic_master/presentation/e_learning/profile/widgets/logout_widget.dart';
import 'package:academic_master/presentation/routes/router.gr.dart';
import 'package:academic_master/presentation/theme/theme.dart';
import 'package:academic_master/presentation/utils/constants.dart';
import 'package:academic_master/presentation/utils/utilizer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_icons/line_icons.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Profileoption extends StatefulWidget {
  final String mobileNumber;
  final String email;

  const Profileoption({
    super.key,
    required this.mobileNumber,
    required this.email,
  });

  @override
  State<Profileoption> createState() => _ProfileoptionState();
}

class _ProfileoptionState extends State<Profileoption> {
  late Razorpay _razorpay;
  @override
  void initState() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: toppadding,
        left: rightpadding - 10,
        right: rightpadding - 10,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(
            128,
            141,
            241,
            0.03,
          ),
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: ListTile.divideTiles(
            context: context,
            color: Apptheme.secondaryColor,
            tiles: [
              ListTile(
                onTap: () async {
                  customDialog(
                    context,
                    onDismiss: () {},
                    widget: logoutWidget(context),
                  );
                },
                leading: Icon(
                  Icons.logout_outlined,
                  size: 25.sp,
                  color: Apptheme.primaryColor,
                ),
                title: Text(
                  "Logout",
                  style: Apptheme(context).normalText.copyWith(
                        fontSize: 14.sp,
                      ),
                ),
              ),
              SizedBox(height: 5.h),
              ListTile(
                leading: Icon(
                  Icons.info_outline_rounded,
                  color: Apptheme.primaryColor,
                  size: 25.sp,
                ),
                title: Text(
                  "Contact Us",
                  style: Apptheme(context).normalText.copyWith(
                        fontSize: 14.sp,
                      ),
                ),
                onTap: () {
                  openUrl('mailto:amitsingh506142@gmail.com');
                },
              ),
              SizedBox(height: 5.h),
              ListTile(
                leading: Icon(
                  Icons.edit_outlined,
                  size: 25.sp,
                  color: Apptheme.primaryColor,
                ),
                title: Text(
                  "Edit Profile",
                  style: Apptheme(context).normalText.copyWith(
                        fontSize: 14.sp,
                      ),
                ),
                onTap: () {
                  AutoRouter.of(context).push(
                    const EditProfileRoute(),
                  );
                },
              ),
              SizedBox(height: 5.h),
              ListTile(
                leading: Icon(
                  LineIcons.moneyBill,
                  size: 25.sp,
                  color: Apptheme.primaryColor,
                ),
                title: Text(
                  "join membership",
                  style: Apptheme(context).normalText.copyWith(
                        fontSize: 14.sp,
                      ),
                ),
                onTap: () {
                  openCheckout();
                },
              ),
              SizedBox(height: 5.h),
            ],
          ).toList(),
        ),
      ),
    );
  }

  Future<void> openCheckout() async {
    final options = {
      'key': 'rzp_test_1iFdsz611tIZeV',
      'amount': 100 * 100,
      'name': widget.email,
      'description': '3 Months Plan',
      'prefill': {'contact': widget.mobileNumber, 'email': widget.email},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
      msg: "Payment Success",
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
      msg: "Payment Failed",
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
      msg: "EXTERNAL_WALLET: ${response.walletName}",
      toastLength: Toast.LENGTH_SHORT,
    );
  }
}
