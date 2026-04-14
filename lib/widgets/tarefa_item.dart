import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/tarefa.dart';
import '../providers/tarefa_provider.dart';

class TarefaItem extends ConsumerWidget {
  final Tarefa tarefa;
  final int index;

  const TarefaItem({
    super.key,
    required this.tarefa,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: tarefa.concluida ? Colors.green[50] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
          )
        ],
      ),
      child: Row(
        children: [
          Checkbox(
            value: tarefa.concluida,
            onChanged: (_) {
              ref.read(tarefaProvider.notifier).alternarStatus(index);
            },
          ),
          Expanded(
            child: Text(
              tarefa.titulo,
              style: TextStyle(
                fontSize: 16,
                decoration:
                    tarefa.concluida ? TextDecoration.lineThrough : null,
                color: tarefa.concluida ? Colors.grey : Colors.black,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              ref.read(tarefaProvider.notifier).remover(index);
            },
          )
        ],
      ),
    );
  }
}