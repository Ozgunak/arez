import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          _buildWelcomeBackSection(),
          _buildButtonRow(),
          const Text('Appointments'),
          _buildAppointmentList(),
        ],
      ),
    );
  }

  Widget _buildWelcomeBackSection() {
    return const Column(
      children: [
        SizedBox(height: 10),
        Image(width: 200, image: AssetImage('assets/images/arezImage.png')),
        SizedBox(height: 10),
        Text('Welcome Back!'),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildButtonRow() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.phone),
              label: const Text('Call'),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.map),
              label: const Text('Route'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentList() {
    return ListView.builder(
      itemCount: 40,
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const Icon(Icons.calendar_today),
            title: Text('Appointment ${index + 1}'),
            subtitle: const Text('Date: 12/12/2021'),
            trailing: const Icon(Icons.more_vert),
            tileColor: index % 2 == 0
                ? Colors.deepPurple.shade100
                : Colors.deepPurple.shade200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        );
      },
    );
  }
}
