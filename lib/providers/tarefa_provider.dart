import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/tarefa.dart';

class TarefaNotifier extends StateNotifier<List<Tarefa>> {
  TarefaNotifier() : super([]);

  void adicionar(String titulo) {
    state = [...state, Tarefa(titulo: titulo)];
  }

  void remover(int index) {
    final lista = [...state];
    lista.removeAt(index);
    state = lista;
  }

  void alternarStatus(int index) {
    final lista = [...state];
    lista[index].concluida = !lista[index].concluida;
    state = lista;
  }
}

final tarefaProvider =
    StateNotifierProvider<TarefaNotifier, List<Tarefa>>((ref) {
  return TarefaNotifier();
});