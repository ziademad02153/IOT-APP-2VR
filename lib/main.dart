import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const HomeConnectApp());
}

class HomeConnectApp extends StatelessWidget {
  const HomeConnectApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Connect',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ELARABY CONNECT'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NotificationsScreen()),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsScreen()),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Appliances',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            DeviceCard(
              name: 'Washer Dryer',
              status: 'Ready to start',
              icon: Icons.local_laundry_service_outlined,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WashingMachineScreen()),
              ),
            ),
            const SizedBox(height: 12),
            DeviceCard(
              name: 'Refrigerator',
              status: 'Connected',
              icon: Icons.kitchen_outlined,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RefrigeratorScreen()),
              ),
            ),
            const SizedBox(height: 12),
            DeviceCard(
              name: 'Oven',
              status: 'Off',
              icon: Icons.microwave_outlined,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OvenScreen()),
              ),
            ),
            const SizedBox(height: 12),
            DeviceCard(
              name: 'Dishwasher',
              status: 'Program running',
              icon: Icons.wash_outlined,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DishwasherScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeviceCard extends StatelessWidget {
  final String name;
  final String status;
  final IconData icon;
  final VoidCallback onTap;

  const DeviceCard({
    Key? key,
    required this.name,
    required this.status,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      status,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WashingMachineScreen extends StatelessWidget {
  const WashingMachineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Washer Dryer'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Washer'),
              Tab(text: 'Dryer'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _WasherTab(),
            _DryerTab(),
          ],
        ),
      ),
    );
  }
}

class _WasherTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const DeviceStatusCard(
          status: 'Ready to start',
          details: 'Cotton 40°',
        ),
        const SizedBox(height: 24),
        const Text(
          'Quick Actions',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: QuickActionButton(
                icon: Icons.play_arrow_outlined,
                label: 'Start',
                onTap: () {},
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: QuickActionButton(
                icon: Icons.pause_outlined,
                label: 'Pause',
                onTap: () {},
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: QuickActionButton(
                icon: Icons.stop_outlined,
                label: 'Stop',
                onTap: () {},
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Programs',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ProgramCard(
          name: 'Cotton',
          duration: '2:30',
          temperature: '40°C',
          icon: Icons.local_laundry_service_outlined,
          onTap: () {},
        ),
        const SizedBox(height: 8),
        ProgramCard(
          name: 'Easy Care',
          duration: '1:45',
          temperature: '30°C',
          icon: Icons.local_laundry_service_outlined,
          onTap: () {},
        ),
        const SizedBox(height: 8),
        ProgramCard(
          name: 'Quick Wash',
          duration: '0:30',
          temperature: '30°C',
          icon: Icons.local_laundry_service_outlined,
          onTap: () {},
        ),
        const SizedBox(height: 24),
        const Text(
          'Settings',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        SettingCard(
          title: 'Temperature',
          value: '40°C',
          icon: Icons.thermostat_outlined,
          onTap: () {},
        ),
        const SizedBox(height: 8),
        SettingCard(
          title: 'Spin Speed',
          value: '1200 rpm',
          icon: Icons.speed_outlined,
          onTap: () {},
        ),
        const SizedBox(height: 8),
        SettingCard(
          title: 'Extra Rinse',
          value: 'Off',
          icon: Icons.water_drop_outlined,
          onTap: () {},
        ),
        const SizedBox(height: 24),
        const Text(
          'Schedule',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ScheduleCard(
          title: 'Start Time',
          value: 'Now',
          icon: Icons.access_time_outlined,
          onTap: () {},
        ),
        const SizedBox(height: 8),
        ScheduleCard(
          title: 'End Time',
          value: '2:30 PM',
          icon: Icons.timer_outlined,
          onTap: () {},
        ),
      ],
    );
  }
}

class _DryerTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const DeviceStatusCard(
          status: 'Ready to start',
          details: 'Cotton Dry',
        ),
        const SizedBox(height: 24),
        const Text(
          'Quick Actions',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: QuickActionButton(
                icon: Icons.play_arrow_outlined,
                label: 'Start',
                onTap: () {},
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: QuickActionButton(
                icon: Icons.pause_outlined,
                label: 'Pause',
                onTap: () {},
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: QuickActionButton(
                icon: Icons.stop_outlined,
                label: 'Stop',
                onTap: () {},
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Programs',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ProgramCard(
          name: 'Cotton Dry',
          duration: '2:00',
          temperature: 'Normal',
          icon: Icons.dry_cleaning_outlined,
          onTap: () {},
        ),
        const SizedBox(height: 8),
        ProgramCard(
          name: 'Gentle Dry',
          duration: '1:30',
          temperature: 'Low',
          icon: Icons.dry_cleaning_outlined,
          onTap: () {},
        ),
        const SizedBox(height: 24),
        const Text(
          'Settings',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        SettingCard(
          title: 'Dryness Level',
          value: 'Normal',
          icon: Icons.water_outlined,
          onTap: () {},
        ),
        const SizedBox(height: 8),
        SettingCard(
          title: 'Temperature',
          value: 'Medium',
          icon: Icons.thermostat_outlined,
          onTap: () {},
        ),
        const SizedBox(height: 8),
        SettingCard(
          title: 'Anti-Crease',
          value: 'On',
          icon: Icons.iron_outlined,
          onTap: () {},
        ),
        const SizedBox(height: 24),
        const Text(
          'Schedule',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ScheduleCard(
          title: 'Start Time',
          value: 'Now',
          icon: Icons.access_time_outlined,
          onTap: () {},
        ),
        const SizedBox(height: 8),
        ScheduleCard(
          title: 'End Time',
          value: '2:00 PM',
          icon: Icons.timer_outlined,
          onTap: () {},
        ),
      ],
    );
  }
}

class DeviceStatusCard extends StatelessWidget {
  final String status;
  final String details;

  const DeviceStatusCard({
    Key? key,
    required this.status,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            status,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            details,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}

class ProgramCard extends StatelessWidget {
  final String name;
  final String duration;
  final String temperature;
  final IconData icon;
  final VoidCallback onTap;

  const ProgramCard({
    Key? key,
    required this.name,
    required this.duration,
    required this.temperature,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.timer_outlined,
                          size: 16,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          duration,
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          Icons.thermostat_outlined,
                          size: 16,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          temperature,
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final VoidCallback onTap;

  const SettingCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(icon, color: Colors.blue),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final VoidCallback onTap;

  const ScheduleCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(icon, color: Colors.blue),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

class QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const QuickActionButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.blue),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RefrigeratorScreen extends StatelessWidget {
  const RefrigeratorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Refrigerator')),
      body: const Center(child: Text('Refrigerator Controls')),
    );
  }
}

class OvenScreen extends StatelessWidget {
  const OvenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Oven')),
      body: const Center(child: Text('Oven Controls')),
    );
  }
}

class DishwasherScreen extends StatelessWidget {
  const DishwasherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dishwasher')),
      body: const Center(child: Text('Dishwasher Controls')),
    );
  }
}

class ProgramsScreen extends StatelessWidget {
  const ProgramsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Programs',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ProgramSection(
            title: 'Washer Dryer',
            programs: [
              Program(
                name: 'Cotton',
                duration: '2:30',
                temperature: '40°C',
                icon: Icons.local_laundry_service_outlined,
              ),
              Program(
                name: 'Easy Care',
                duration: '1:45',
                temperature: '30°C',
                icon: Icons.local_laundry_service_outlined,
              ),
              Program(
                name: 'Quick Wash',
                duration: '0:30',
                temperature: '30°C',
                icon: Icons.local_laundry_service_outlined,
              ),
              Program(
                name: 'Cotton Dry',
                duration: '2:00',
                temperature: 'Normal',
                icon: Icons.dry_cleaning_outlined,
              ),
              Program(
                name: 'Gentle Dry',
                duration: '1:30',
                temperature: 'Low',
                icon: Icons.dry_cleaning_outlined,
              ),
            ],
          ),
          const SizedBox(height: 24),
          ProgramSection(
            title: 'Dishwasher',
            programs: [
              Program(
                name: 'Eco 50°C',
                duration: '3:15',
                temperature: '50°C',
                icon: Icons.wash_outlined,
              ),
              Program(
                name: 'Quick 45°C',
                duration: '0:45',
                temperature: '45°C',
                icon: Icons.wash_outlined,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProgramSection extends StatelessWidget {
  final String title;
  final List<Program> programs;

  const ProgramSection({
    Key? key,
    required this.title,
    required this.programs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ...programs.map((program) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: ProgramCard(program: program),
        )),
      ],
    );
  }
}

class Program {
  final String name;
  final String duration;
  final String temperature;
  final IconData icon;

  const Program({
    required this.name,
    required this.duration,
    required this.temperature,
    required this.icon,
  });
}

class ProgramCard extends StatelessWidget {
  final Program program;

  const ProgramCard({
    Key? key,
    required this.program,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(program.icon, color: Colors.blue),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      program.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${program.duration} • ${program.temperature}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeSettingsScreen extends StatelessWidget {
  const HomeSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Home',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            child: Column(
              children: [
                HomeSettingItem(
                  title: 'Home Mode',
                  subtitle: 'Automatically adjust device settings',
                  value: 'Away',
                  onTap: () {},
                ),
                HomeSettingItem(
                  title: 'Energy Saving',
                  subtitle: 'Optimize energy consumption',
                  value: 'On',
                  onTap: () {},
                ),
                HomeSettingItem(
                  title: 'Scheduled Programs',
                  subtitle: '2 programs scheduled',
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Statistics',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.5,
            children: const [
              StatisticCard(
                title: 'Energy Usage',
                value: '45.2 kWh',
                trend: '+2.3%',
                icon: Icons.bolt_outlined,
              ),
              StatisticCard(
                title: 'Water Usage',
                value: '320 L',
                trend: '-5.1%',
                icon: Icons.water_drop_outlined,
              ),
              StatisticCard(
                title: 'Programs Run',
                value: '12',
                trend: '+4',
                icon: Icons.play_circle_outline,
              ),
              StatisticCard(
                title: 'Active Devices',
                value: '5',
                trend: '3 in use',
                icon: Icons.devices_outlined,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeSettingItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? value;
  final VoidCallback onTap;

  const HomeSettingItem({
    Key? key,
    required this.title,
    required this.subtitle,
    this.value,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            if (value != null) ...[
              Text(
                value!,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(width: 8),
            ],
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

class StatisticCard extends StatelessWidget {
  final String title;
  final String value;
  final String trend;
  final IconData icon;

  const StatisticCard({
    Key? key,
    required this.title,
    required this.value,
    required this.trend,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.blue),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
                const Spacer(),
                Text(
                  trend,
                  style: TextStyle(
                    fontSize: 12,
                    color: trend.startsWith('+') ? Colors.green : Colors.grey.shade600,
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

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Service',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ServiceSection(
            title: 'Support',
            children: [
              ServiceCard(
                title: 'Contact Support',
                subtitle: 'Get help from our experts',
                icon: Icons.support_agent_outlined,
                onTap: () {},
              ),
              ServiceCard(
                title: 'Device Manual',
                subtitle: 'View user guides and manuals',
                icon: Icons.menu_book_outlined,
                onTap: () {},
              ),
              ServiceCard(
                title: 'Troubleshooting',
                subtitle: 'Find solutions to common issues',
                icon: Icons.build_outlined,
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 24),
          ServiceSection(
            title: 'Maintenance',
            children: [
              ServiceCard(
                title: 'Schedule Service',
                subtitle: 'Book a service appointment',
                icon: Icons.calendar_today_outlined,
                onTap: () {},
              ),
              ServiceCard(
                title: 'Device Health',
                subtitle: 'Check device status and maintenance',
                icon: Icons.health_and_safety_outlined,
                onTap: () {},
              ),
              ServiceCard(
                title: 'Warranty Information',
                subtitle: 'View warranty status and details',
                icon: Icons.verified_outlined,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ServiceSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const ServiceSection({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ...children,
      ],
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const ServiceCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(icon, color: Colors.blue),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SettingsSection(
            title: 'Account',
            children: [
              SettingsItem(
                title: 'Profile',
                icon: Icons.person_outline,
                onTap: () {},
              ),
              SettingsItem(
                title: 'Connected Appliances',
                icon: Icons.devices_outlined,
                onTap: () {},
              ),
              SettingsItem(
                title: 'Notifications',
                icon: Icons.notifications_outlined,
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 24),
          SettingsSection(
            title: 'App Settings',
            children: [
              SettingsItem(
                title: 'Language',
                icon: Icons.language_outlined,
                value: 'English',
                onTap: () {},
              ),
              SettingsItem(
                title: 'Dark Mode',
                icon: Icons.dark_mode_outlined,
                value: 'Off',
                onTap: () {},
              ),
              SettingsItem(
                title: 'Sound',
                icon: Icons.volume_up_outlined,
                value: 'On',
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 24),
          SettingsSection(
            title: 'Support',
            children: [
              SettingsItem(
                title: 'Help Center',
                icon: Icons.help_outline,
                onTap: () {},
              ),
              SettingsItem(
                title: 'Contact Support',
                icon: Icons.support_agent_outlined,
                onTap: () {},
              ),
              SettingsItem(
                title: 'Terms & Privacy',
                icon: Icons.privacy_tip_outlined,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SettingsSection({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}

class SettingsItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String? value;
  final VoidCallback onTap;

  const SettingsItem({
    Key? key,
    required this.title,
    required this.icon,
    this.value,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (value != null) ...[
              Text(
                value!,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(width: 8),
            ],
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          NotificationCard(
            title: 'Washing Machine Program Completed',
            message: 'Cotton 40° program has finished',
            time: '2 min ago',
            icon: Icons.local_laundry_service_outlined,
            isUnread: true,
          ),
          const SizedBox(height: 8),
          NotificationCard(
            title: 'Dryer Ready',
            message: 'Your clothes are dry and ready',
            time: '15 min ago',
            icon: Icons.dry_cleaning_outlined,
            isUnread: true,
          ),
          const SizedBox(height: 8),
          NotificationCard(
            title: 'Maintenance Required',
            message: 'Dishwasher needs cleaning',
            time: '1 hour ago',
            icon: Icons.warning_outlined,
            isUnread: false,
          ),
          const SizedBox(height: 8),
          NotificationCard(
            title: 'Energy Report',
            message: 'Weekly energy consumption report is ready',
            time: '2 hours ago',
            icon: Icons.bolt_outlined,
            isUnread: false,
          ),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String message;
  final String time;
  final IconData icon;
  final bool isUnread;

  const NotificationCard({
    Key? key,
    required this.title,
    required this.message,
    required this.time,
    required this.icon,
    required this.isUnread,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isUnread ? Colors.blue.shade50 : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: isUnread ? Colors.blue : Colors.grey,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: isUnread ? FontWeight.bold : FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
