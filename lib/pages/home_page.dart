import 'package:flutter/material.dart'; // Material UI Flutter
import 'tasks_page.dart'; // Import halaman tugas

class HomePage extends StatelessWidget {
  // Halaman utama
  const HomePage({super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width; // Ambil lebar layar
    final bool isDesktop = width >= 900; // Deteksi desktop / mobile

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // Warna background global

      appBar: isDesktop
          ? null // Tidak ada app bar di desktop,
          : AppBar(
              title: const Text('Life Manager'), //judul app bar di mobile
              backgroundColor: Colors.white, //warna app bar di mobile
              foregroundColor: Colors.black, //warna teks app bar di mobile
              elevation: 1, //shadow app bar di mobile
            ),

      // ================= DRAWER (MOBILE ONLY) =================
      drawer: isDesktop
          ? null // Tidak ada drawer di desktop
          : Drawer(
              child: Column(
                children: [
                  // ---------- HEADER DRAWER ----------
                  DrawerHeader(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(
                          radius: 30,
                          child: Icon(Icons.person, size: 30),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Welcome back',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  // ---------- Menu ----------
                  drawerItem(context, Icons.dashboard, 'Dashboard'),
                  drawerItem(context, Icons.checklist, 'Tasks'),
                  drawerItem(context, Icons.folder, 'Projects'),
                  drawerItem(context, Icons.trending_up, 'Skills'),

                  const Spacer(),

                  drawerItem(context, Icons.logout, 'Logout'),

                  const SizedBox(height: 16),
                ],
              ),
            ),

      body: SafeArea(
        child: Row(
          children: [
            // ================= SIDEBAR (DESKTOP) =================
            if (isDesktop)
              Container(
                width: 240, // Lebar sidebar
                color: Colors.white, // Warna sidebar
                padding: const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Life Manager', // Judul app
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 32),

                    sidebarItem(context, Icons.dashboard, 'Dashboard'),
                    sidebarItem(context, Icons.checklist, 'Tasks'),
                    sidebarItem(context, Icons.folder, 'Projects'),
                    sidebarItem(context, Icons.trending_up, 'Skills'),

                    const Spacer(),

                    sidebarItem(context, Icons.logout, 'Logout'),
                  ],
                ),
              ),

            // ================= MAIN CONTENT =================
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ---------- HEADER ----------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Today's Tasks",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        ElevatedButton.icon(
                          onPressed: () {}, // Nanti kita isi
                          icon: const Icon(Icons.add),
                          label: const Text('Add Task'),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // ---------- TASK LIST ----------
                    Expanded(
                      child: ListView(
                        children: [
                          taskCard(
                            title: 'Read Chapter 4',
                            subtitle: 'Database Project',
                            status: 'OVERDUE',
                            color: Colors.red,
                          ),

                          taskCard(
                            title: 'Prepare Presentation',
                            subtitle: 'AI Research',
                            status: 'DUE TODAY',
                            color: Colors.orange,
                          ),

                          taskCard(
                            title: 'Gym Workout',
                            subtitle: 'Personal',
                            status: 'UPCOMING',
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= SIDEBAR ITEM =================
  Widget sidebarItem(BuildContext context, IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () {
          if (title == 'Tasks') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TasksPage()),
            );
          }
        },
        child: Row(
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 12),
            Text(title),
          ],
        ),
      ),
    );
  }

  // ================= DRAWER ITEM (MOBILE) =================
  Widget drawerItem(BuildContext context, IconData icon, String title) {
    return ListTile(
      leading: Icon(icon), // Icon menu
      title: Text(title), // Nama menu
      onTap: () {
        Navigator.pop(context); // Tutup drawer

        if (title == 'Tasks') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TasksPage()),
          );
        }
      },
    );
  }

  // ================= TASK CARD =================
  Widget taskCard({
    required String title,
    required String subtitle,
    required String status,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border(left: BorderSide(color: color, width: 5)),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 4),

          Text(subtitle, style: const TextStyle(color: Colors.grey)),

          const SizedBox(height: 8),

          Text(
            status,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
