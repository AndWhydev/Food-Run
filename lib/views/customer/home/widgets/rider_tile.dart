// lib/widgets/rider_tile.dart
import 'package:flutter/material.dart';
import 'package:foodhub/models/user_model.dart';

class RiderTile extends StatelessWidget {
  final UserModel rider;
  final VoidCallback onAssign;

  const RiderTile({Key? key, required this.rider, required this.onAssign})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: rider.profileImage != null
            ? NetworkImage(rider.profileImage!)
            : null,
        child: rider.profileImage == null ? Icon(Icons.person) : null,
      ),
      title: Text(rider.name),
      subtitle: Text('${rider.phone} • ${rider.rating ?? '-'} ★'),
      trailing: ElevatedButton(onPressed: onAssign, child: Text('Assign')),
    );
  }
}
