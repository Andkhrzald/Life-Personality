import 'package:flutter/material.dart'; // UI material Flutter

// ================= HALAMAN TASKS =================
class TasksPage extends StatefulWidget {
  const TasksPage({super.key}); // Constructor

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  // ================= DATA TASK =================
  List<String> tasks = []; // List sederhana untuk simpan task

  // Controller untuk input text
  final TextEditingController taskController = TextEditingController();

  // ================= TAMBAH TASK =================
  void addTask() {
    if (taskController.text.trim().isEmpty) {
      // Validasi input kosong
      return;
    }

    setState(() {
      tasks.add(taskController.text); // Tambah task ke list
      taskController.clear(); // Kosongkan input
    });
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        title: const Text('Tasks'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            // ---------- INPUT TASK ----------
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskController,
                    decoration: const InputDecoration(
                      hintText: 'Tambah tugas baru',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                ElevatedButton(
                  onPressed: addTask, // Tambah task
                  child: const Icon(Icons.add),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // ---------- LIST TASK ----------
            Expanded(
              child: tasks.isEmpty
                  ? const Center(
                      child: Text(
                        'Belum ada tugas',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return Card(child: ListTile(title: Text(tasks[index])));
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
