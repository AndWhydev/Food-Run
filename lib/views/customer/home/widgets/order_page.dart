import 'package:flutter/material.dart';
import 'package:foodhub/widgets/custom_textformfield.dart';

class OrderPage extends StatefulWidget {
  final Map<String, dynamic> food;

  const OrderPage({super.key, required this.food});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController orderController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool delivery = true;

  @override
  Widget build(BuildContext context) {
    final food = widget.food;

    return Scaffold(
      appBar: AppBar(
        title: Text(food["restaurant"]),
        backgroundColor: Colors.grey[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Food preview
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(food["image"]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Food Name
              Text(
                food["name"],
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Order Details
              CustomTextformfield(
                controller: orderController,
                maxLines: 3,
                hintText: "1x pizza, 2x burgers, 1x cold drink etc.",
                // labelText: "Order Details",
                prefixIcon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.deepOrange,
                ),
              ),
              const SizedBox(height: 16),

              // Address
              CustomTextformfield(
                controller: addressController,
                hintText: "Enter your delivery address",
                // labelText: "Address",
                prefixIcon: const Icon(
                  Icons.location_on_outlined,
                  color: Colors.deepOrange,
                ),
              ),
              const SizedBox(height: 16),

              // Phone Number
              CustomTextformfield(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                hintText: "Enter your phone number",
                // labelText: "Phone Number",
                prefixIcon: const Icon(
                  Icons.phone_outlined,
                  color: Colors.deepOrange,
                ),
              ),
              const SizedBox(height: 16),

              // Delivery Checkbox
              Row(
                children: [
                  Checkbox(
                    value: delivery,
                    activeColor: Colors.deepOrange,
                    onChanged: (val) {
                      setState(() => delivery = val ?? true);
                    },
                  ),
                  const Text("Delivery", style: TextStyle(fontSize: 16)),
                ],
              ),

              //
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      final order = orderController.text.trim();
                      final address = addressController.text.trim();
                      final phone = phoneController.text.trim();

                      if (order.isEmpty || address.isEmpty || phone.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please fill all fields"),
                          ),
                        );
                        return;
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Order Placed!\n$order\nAddress: $address\nPhone: $phone\nDelivery: ${delivery ? "Yes" : "No"}",
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "Place Order",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // Place Order Button
    );
  }
}
