import 'package:flutter/material.dart';
import '../models/data_layer.dart'; // Pastikan file ini berisi kelas Task dan Plan
import '../provider/plan_provider.dart'; // Pastikan file ini berisi PlanProvider

class PlanScreen extends StatefulWidget {
  final Plan plan;

  const PlanScreen({super.key, required this.plan});

  @override
  _PlanScreenState createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;

  Plan get plan => widget.plan;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    scrollController.dispose(); // Bersihkan controller ketika tidak digunakan
    super.dispose();
  }

  // Modifikasi _buildAddTaskButton
  Widget _buildAddTaskButton(BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        Plan currentPlan = plan;
        int planIndex =
            planNotifier.value.indexWhere((p) => p.name == currentPlan.name);

        List<Task> updatedTasks = List<Task>.from(currentPlan.tasks)
          ..add(const Task()); // Tambahkan task baru

        // Perbarui plan di provider
        planNotifier.value = List<Plan>.from(planNotifier.value)
          ..[planIndex] = Plan(name: currentPlan.name, tasks: updatedTasks);

        // Tidak lagi mengubah widget.plan secara langsung, mengandalkan manajemen state.
        setState(() {
          // Menyebabkan UI untuk membangun ulang setelah menambahkan task (tanpa mengubah widget.plan secara langsung)
        });
      },
    );
  }

  // Modifikasi _buildTaskTile
  Widget _buildTaskTile(Task task, int index, BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);

    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          Plan currentPlan = plan;
          int planIndex =
              planNotifier.value.indexWhere((p) => p.name == currentPlan.name);

          // Perbarui status penyelesaian task
          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(
              name: currentPlan.name,
              tasks: List<Task>.from(currentPlan.tasks)
                ..[index] = Task(
                    description: task.description, complete: selected ?? false),
            );
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          Plan currentPlan = plan;
          int planIndex =
              planNotifier.value.indexWhere((p) => p.name == currentPlan.name);

          // Perbarui deskripsi task
          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(
              name: currentPlan.name,
              tasks: List<Task>.from(currentPlan.tasks)
                ..[index] = Task(description: text, complete: task.complete),
            );
        },
      ),
    );
  }

  // Modifikasi _buildList
  Widget _buildList(Plan plan) {
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(plan.tasks[index], index, context),
    );
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Plan>> plansNotifier = PlanProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(plan.name)),
      body: ValueListenableBuilder<List<Plan>>(
        valueListenable: plansNotifier,
        builder: (context, plans, child) {
          Plan currentPlan = plans.firstWhere((p) => p.name == plan.name);
          return Column(
            children: [
              Expanded(child: _buildList(currentPlan)),
              SafeArea(child: Text(currentPlan.completenessMessage)),
            ],
          );
        },
      ),
      floatingActionButton: _buildAddTaskButton(context),
    );
  }
}
