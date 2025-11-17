import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveriesHistoryScreen extends StatelessWidget {
  const DeliveriesHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deliveries = [
      {
        "restaurant": "Burger Hub",
        "date": "Oct 28, 2025",
        "time": "6:45 PM",
        "amount": "\$12.50",
        "status": "Delivered",
        "dropoff": "45B Street, Lahore",
      },
      {
        "restaurant": "Pizza Mania",
        "date": "Oct 27, 2025",
        "time": "9:10 PM",
        "amount": "\$18.90",
        "status": "Delivered",
        "dropoff": "House #12, Model Town",
      },
      {
        "restaurant": "Kebab Kingdom",
        "date": "Oct 25, 2025",
        "time": "2:30 PM",
        "amount": "\$15.20",
        "status": "Cancelled",
        "dropoff": "Block C, DHA Phase 3",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: const BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Text(
                "Delivery History",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // HISTORY LIST
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: deliveries.length,
                itemBuilder: (context, index) {
                  final delivery = deliveries[index];
                  return _DeliveryCard(
                    restaurant: delivery["restaurant"]!,
                    date: delivery["date"]!,
                    time: delivery["time"]!,
                    amount: delivery["amount"]!,
                    status: delivery["status"]!,
                    dropoff: delivery["dropoff"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DeliveryCard extends StatelessWidget {
  final String restaurant;
  final String date;
  final String time;
  final String amount;
  final String status;
  final String dropoff;

  const _DeliveryCard({
    required this.restaurant,
    required this.date,
    required this.time,
    required this.amount,
    required this.status,
    required this.dropoff,
  });

  Color _statusColor() {
    switch (status) {
      case "Delivered":
        return Colors.green;
      case "Cancelled":
        return Colors.redAccent;
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      shadowColor: Colors.deepOrange.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER ROW
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  restaurant,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _statusColor().withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    status,
                    style: GoogleFonts.poppins(
                      color: _statusColor(),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // DATE & TIME
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                const SizedBox(width: 6),
                Text(
                  "$date  |  $time",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // DROP LOCATION
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.location_on,
                  size: 16,
                  color: Colors.deepOrange,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    dropoff,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
            Divider(color: Colors.grey[300]),

            // AMOUNT
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Earned",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  amount,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.deepOrange,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
