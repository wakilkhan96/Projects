import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:landconsultancy/CitizenPage/CitizenDashboardTab.dart';


class PaymentMethod {
  // indexID must start from 0 and must follow ascending order [0,,1,2,3,4 ... n]
  bool isSelected = false;
  int paymentMethodIndexID;
  String methodName;
  String methodImagePath;
  PaymentMethod(
      {required this.paymentMethodIndexID,
      required this.methodName,
      required this.methodImagePath});
}

class PaymentPage extends StatefulWidget {
  final ConsultantInfo consultantInfo;
  PaymentPage({required this.consultantInfo});
  @override
  _PaymentPageState createState() => _PaymentPageState(consultantInfo: consultantInfo);
}
//711103392
class _PaymentPageState extends State<PaymentPage> {
  double paymentAmount = 0;
  final ConsultantInfo consultantInfo;

  _PaymentPageState({required this.consultantInfo}) {
    paymentAmount = ((consultantInfo.consultantFeePerConsultation * (100 - consultantInfo.currentOffPercentagePerConsultation)) / 100);

  }

  int selectedPaymentMethodIndexID = -1;
  List<PaymentMethod> paymentOptions = [
    PaymentMethod(
      paymentMethodIndexID: 0,
      methodName: "bKash",
      methodImagePath: "assets/images/bkash_logo.png",
    ),
    PaymentMethod(
        paymentMethodIndexID: 1,
        methodName: "rocket",
        methodImagePath: "assets/images/rocket_logo.png"),
    PaymentMethod(
        paymentMethodIndexID: 2,
        methodName: "nagad",
        methodImagePath: "assets/images/nagad_logo.png"),
    PaymentMethod(
        paymentMethodIndexID: 3,
        methodName: "upay",
        methodImagePath: "assets/images/upay_logo.png"),
    PaymentMethod(
        paymentMethodIndexID: 4,
        methodName: "nexuspay",
        methodImagePath: "assets/images/nexuspay_logo.png"),
    PaymentMethod(
        paymentMethodIndexID: 5,
        methodName: "ekpay",
        methodImagePath: "assets/images/ekpay_logo.png"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Option"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "Select a payment option",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            child: ListView.separated(
                // padding: EdgeInsets.all(5),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    buildImageCard(paymentOptions[index]),
                separatorBuilder: (context, _) => const SizedBox(
                      width: 5,
                    ),
                itemCount: paymentOptions.length),
          ),
          SizedBox(height: 5,),
          Expanded(
            child: Container(
              // color: Colors.yellow,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight:Radius.circular(10),),
              ),
              child: Column(
                children: [
                  SizedBox(height: 8,),
                  Container(
                    color: Colors.green,
                    height: 30,
                    child: Column(
                      children: [
                        Text(
                          // "Selected Payment Method : "+(selectedPaymentMethodIndexID!=-1? paymentOptions[selectedPaymentMethodIndexID].methodName: ""),
                          (selectedPaymentMethodIndexID != -1?
                            "Selected ePayment Method : "+paymentOptions[selectedPaymentMethodIndexID].methodName
                              : "Please select an ePayment Method"),
                          style: TextStyle(
                            fontSize: 20,
                            // fontWeight: FontWeight.w300,
                          ),
                        ),

                      ],
                    ),
                  ),
                  if(selectedPaymentMethodIndexID != -1) Expanded(
                    child: Container(
                      color: Colors.teal,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                consultantInfo.consultantName.toString()+ "\n"+
                                    consultantInfo.consultantFeePerConsultation.toString()+ "\n"+
                                    consultantInfo.currentOffPercentagePerConsultation.toString()+ "\n"+
                                    paymentAmount.toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  // fontWeight: FontWeight.w300,
                                ),
                              ),


                            ],
                          ),

                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget buildImageCard(PaymentMethod paymentMethod) {
    // double containerWidth = 120;

    return Padding(
      padding: EdgeInsets.all(0),
      // padding: EdgeInsets.only(top: 1, bottom: 1),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          // side: (paymentMethod.isSelected==true? const BorderSide(color: Colors.green, width: 2) : const BorderSide(color: Colors.black12, width: 2)),
          side: (selectedPaymentMethodIndexID ==
                  paymentMethod.paymentMethodIndexID
              ? const BorderSide(color: Colors.green, width: 2.5)
              : const BorderSide(color: Colors.black12, width: 2.5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  setState(() {
                    // paymentMethod.isSelected = true;
                    selectedPaymentMethodIndexID =
                        paymentMethod.paymentMethodIndexID;
                    print(
                        "selectedPaymentMethodIndexID = $selectedPaymentMethodIndexID");
                  });
                  print(paymentMethod.methodName);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Container(
                    // color: Colors.yellow,
                    // width: containerWidth,
                    // height: 70,
                    child: AspectRatio(
                      aspectRatio: 4 / 3,
                      child: ClipRRect(
                        // borderRadius: BorderRadius.circular(22.0),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.asset(
                          paymentMethod.methodImagePath,
                          // width: containerWidth,
                          // height: 100,
                          // fit: BoxFit.fitWidth,
                        ),
                        // child: Image.network(
                        //   consultantInfo.urlImage,
                        //   fit: BoxFit.cover,
                        //
                        // ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
