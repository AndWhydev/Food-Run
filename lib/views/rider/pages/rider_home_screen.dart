import 'package:flutter/material.dart';
import 'package:foodhub/views/rider/widgets/order_card.dart';
import 'package:google_fonts/google_fonts.dart';

class RiderHomeScreen extends StatefulWidget {
  const RiderHomeScreen({super.key});

  @override
  State<RiderHomeScreen> createState() => _RiderHomeScreenState();
}

class _RiderHomeScreenState extends State<RiderHomeScreen> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                decoration: const BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.fastfood, color: Colors.white),
                        const SizedBox(width: 8),
                        Text(
                          "FoodHub",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Rider App",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // STATUS CARD
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  color: Colors.white,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Status
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Availability Status",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 14,
                                  color: switchValue
                                      ? Colors.green
                                      : Colors.grey,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  switchValue ? "Online" : "Offline",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: switchValue
                                        ? Colors.green
                                        : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Go Online",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Switch(
                              value: switchValue,
                              activeColor: Colors.green,
                              onChanged: (v) {
                                setState(() => switchValue = v);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // 🧾 Order List (for now single dummy)
              // if (switchValue)
              //   Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 20),
              //     child: OrderCard(
              //       restaurantName: "Pizza Palace",
              //       orderId: "1245",
              //       pickupLocation: "Pizza Palace, Main Street",
              //       dropoffLocation: "House #12, Park Avenue",
              //       items: "2x Pepperoni Pizza • 1x Garlic Bread",
              //       total: "\$18.99",
              //       onAccept: () {
              //         ScaffoldMessenger.of(context).showSnackBar(
              //           const SnackBar(content: Text("Order Accepted ✅")),
              //         );
              //       },
              //       onCancel: () {
              //         ScaffoldMessenger.of(context).showSnackBar(
              //           const SnackBar(content: Text("Order Cancelled ❌")),
              //         );
              //       },
              //     ),
              //   )
              // else
              //   Center(
              //     child: Padding(
              //       padding: const EdgeInsets.only(top: 50),
              //       child: Text(
              //         "Go online to see available deliveries",
              //         style: GoogleFonts.poppins(color: Colors.grey[600]),
              //       ),
              //     ),
              //   ),
              if (switchValue)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: OrderCard(
                    restaurantName: "Pizza Palace",
                    orderId: "1245",
                    pickupLocation: "Pizza Palace, Main Street",
                    dropoffLocation: "House #12, Park Avenue",
                    items: "2x Pepperoni Pizza • 1x Garlic Bread",
                    total: "\$18.99",

                    // NEW: Bid submit callback
                    onBidSubmit: (bidAmount) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Bid submitted: \$${bidAmount.toStringAsFixed(2)}",
                          ),
                        ),
                      );
                    },
                  ),
                )
              else
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Text(
                      "Go online to see available deliveries",
                      style: GoogleFonts.poppins(color: Colors.grey[600]),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
