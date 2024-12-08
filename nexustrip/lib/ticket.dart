import 'package:flutter/material.dart';

class TicketPage extends StatefulWidget {
  @override
  _TicketPageState createState() {
    return _TicketPageState();
  }
}

// calculate the total based on the amount selected
// https://stackoverflow.com/questions/74438143/flutter-how-to-calculate-total-price-of-a-list-of-items-in-futurebuilder
// https://stackoverflow.com/questions/63637296/flutter-calculating-the-total-price-of-the-items-in-thier-category
// i initially wanted to use the pay package for Dart and use that
// but that proved too challenging to figure out (https://pub.dev/packages/pay)
// this kind of is a makeshift workaround in light of that
class _TicketPageState extends State<TicketPage> {
  int youthTickets = 0;
  int adultRideTickets = 0;
  int adultDayTickets = 0;

  String? selectedPaymentMethod;

  double calculateTotal() {
    return (youthTickets * 0.75) +
        (adultRideTickets * 1.50) +
        (adultDayTickets * 3.50);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF30B665),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Purchase Tickets",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ticket options
              _buildTicketOption(
                "Youth (6-17) - \$0.75",
                youthTickets,
                    () => setState(() {
                  if (youthTickets > 0) youthTickets--;
                }),
                    () => setState(() {
                  youthTickets++;
                }),
              ),
              _buildTicketOption(
                "Adult 1 Ride - \$1.50",
                adultRideTickets,
                    () => setState(() {
                  if (adultRideTickets > 0) adultRideTickets--;
                }),
                    () => setState(() {
                  adultRideTickets++;
                }),
              ),
              _buildTicketOption(
                "Adult Day - \$3.50",
                adultDayTickets,
                    () => setState(() {
                  if (adultDayTickets > 0) adultDayTickets--;
                }),
                    () => setState(() {
                  adultDayTickets++;
                }),
              ),

              SizedBox(height: 20),

              // total cost
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\$${calculateTotal().toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              // payment methods
              Text(
                "Payment Methods",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),

              _buildPaymentOption("Google Pay"),
              _buildPaymentOption("Apple Pay"),
              _buildPaymentOption("VISA •••• 2766"),

              GestureDetector(
                onTap: () {
                  // Action for adding payment type
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Click Here to Add a Payment Type",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // purchased tickets button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/myTickets');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF30B665),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Click Here to View Your Purchased Tickets",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),

              SizedBox(height: 20),

              Divider(thickness: 2),

              SizedBox(height: 25), // Added spacing to move the button up

              // purchase button
              ElevatedButton(
                onPressed: () {
                  // Action for purchasing tickets
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Changed to black
                  padding: EdgeInsets.symmetric(vertical: 25), // Larger button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.black, width: 2), // Black outline
                  ),
                ),
                child: Center(
                  child: Text(
                    "Purchase",
                    style: TextStyle(
                      fontSize: 20, // Larger font
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ticket options
  Widget _buildTicketOption(
      String title,
      int count,
      VoidCallback onDecrease,
      VoidCallback onIncrease,
      ) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xFF30B665),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: onDecrease,
                icon: Icon(Icons.remove, color: Colors.white),
              ),
              Text(
                "$count",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              IconButton(
                onPressed: onIncrease,
                icon: Icon(Icons.add, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // toggleable payment options
  Widget _buildPaymentOption(String paymentMethod) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPaymentMethod = paymentMethod;
        });
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: selectedPaymentMethod == paymentMethod
              ? Color(0xFF30B665)
              : Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(
              paymentMethod,
              style: TextStyle(
                fontSize: 16,
                color: selectedPaymentMethod == paymentMethod
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            Spacer(),
            Icon(
              selectedPaymentMethod == paymentMethod
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color: selectedPaymentMethod == paymentMethod
                  ? Colors.white
                  : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}