import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/tarefa_provider.dart';
import '../widgets/tarefa_item.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tarefas = ref.watch(tarefaProvider);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('📝 Minhas Tarefas'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Digite uma tarefa...',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.all(14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      ref
                          .read(tarefaProvider.notifier)
                          .adicionar(controller.text);
                      controller.clear();
                    }
                  },
                  child: const Icon(Icons.add),
                )
              ],
            ),

            const SizedBox(height: 10),

            Expanded(
              child: tarefas.isEmpty
                  ? const Center(
                      child: Text(
                        "Nenhuma tarefa ainda 😅",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: tarefas.length,
                      itemBuilder: (context, index) {
                        return TarefaItem(
                          tarefa: tarefas[index],
                          index: index,
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