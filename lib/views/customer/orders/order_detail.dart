import 'package:flutter/material.dart';

class OrderDetailPage extends StatelessWidget {
  final Map<String, dynamic> order;

  const OrderDetailPage({super.key, required this.order});

  int _getStatusStep(String status) {
    switch (status) {
      case "Preparing":
        return 1;
      case "On the way":
        return 2;
      case "Delivered":
        return 3;
      default:
        return 0; // Placed
    }
  }

  @override
  Widget build(BuildContext context) {
    final step = _getStatusStep(order["status"]);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Tracking"),
        backgroundColor: Colors.grey[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Food image
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  order["image"],
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),

              // Name + restaurant
              Text(
                order["foodName"],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.restaurant,
                    size: 16,
                    color: Colors.deepOrange,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    order["restaurant"],
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Order details
              _buildInfoRow(Icons.shopping_cart_outlined, order["details"]),
              _buildInfoRow(Icons.location_on_outlined, order["address"]),
              _buildInfoRow(Icons.phone_outlined, order["phone"]),
              _buildInfoRow(
                Icons.delivery_dining,
                order["delivery"] ? "Delivery" : "Pick up",
              ),
              const SizedBox(height: 20),

              // Tracking
              const Text(
                "Tracking",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
              const SizedBox(height: 12),
              _buildVerticalTracking(step),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.deepOrange),
          const SizedBox(width: 6),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }

  Widget _buildVerticalTracking(int currentStep) {
    final steps = ["Placed", "Preparing", "On the way", "Delivered"];
    return Column(
      children: List.generate(steps.length, (index) {
        final isActive = index <= currentStep;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: isActive ? Colors.green : Colors.grey[300],
                  child: Icon(
                    isActive ? Icons.check : Icons.circle,
                    size: 12,
                    color: Colors.white,
                  ),
                ),
                if (index != steps.length - 1)
                  Container(
                    height: 40,
                    width: 2,
                    color: isActive ? Colors.green : Colors.grey[300],
                  ),
              ],
            ),
            const SizedBox(width: 8),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                steps[index],
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  color: isActive ? Colors.green : Colors.grey,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
