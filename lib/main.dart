import 'package:flutter/material.dart';
import 'package:master_plan/views/plan_screen.dart';
import 'views/plan_creator_screen.dart'; // Ensure this is correctly set up
import 'models/data_layer.dart'; // Ensure the Plan and Task models are here
import 'provider/plan_provider.dart'; // Ensure PlanProvider is correctly implemented

void main() {
  runApp(
    PlanProvider(
      notifier: ValueNotifier<List<Plan>>([
        // Adding some sample data to match the screenshot
        Plan(
            name: 'Try to take over the world',
            tasks: List.generate(3, (index) => Task())),
        Plan(
            name: 'Invent New Form of Cheese',
            tasks: List.generate(14, (index) => Task())),
        Plan(
            name: 'Learn Flutter',
            tasks: List.generate(14, (index) => const Task(complete: true)))
          ..setRange(
              0, 6, List.generate(6, (index) => const Task(complete: true))),
      ]),
      child: MaterialApp(
        title: 'Master Plans',
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.deepPurple,
            elevation: 0,
          ),
          cardTheme: CardTheme(
            elevation: 5,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        home: const PlanCreatorScreen(),
      ),
    ),
  );
}

// Update PlanCreatorScreen
class PlanCreatorScreen extends StatefulWidget {
  const PlanCreatorScreen({Key? key}) : super(key: key);

  @override
  _PlanCreatorScreenState createState() => _PlanCreatorScreenState();
}

class _PlanCreatorScreenState extends State<PlanCreatorScreen> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Master Plans',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          _buildListCreator(),
          Expanded(child: _buildMasterPlans()),
        ],
      ),
    );
  }

  Widget _buildListCreator() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: textController,
          decoration: const InputDecoration(
            hintText: 'Add a plan',
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 8),
          ),
          onEditingComplete: addPlan,
        ),
      ),
    );
  }

  Widget _buildMasterPlans() {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);

    return ValueListenableBuilder<List<Plan>>(
      valueListenable: planNotifier,
      builder: (context, plans, child) {
        if (plans.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.note, size: 100, color: Colors.grey),
              Text('You have no plans yet.',
                  style: Theme.of(context).textTheme.headlineSmall),
            ],
          );
        }

        return ListView.builder(
          itemCount: plans.length,
          itemBuilder: (context, index) {
            final plan = plans[index];
            return ListTile(
              title: Text(
                plan.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                '${plan.completedCount} out of ${plan.tasks.length} tasks',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => PlanScreen(plan: plan)),
                );
              },
            );
          },
        );
      },
    );
  }

  void addPlan() {
    final text = textController.text;
    if (text.isEmpty) {
      return;
    }
    final plan = Plan(name: text, tasks: []);
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    planNotifier.value = List<Plan>.from(planNotifier.value)..add(plan);
    textController.clear();
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
