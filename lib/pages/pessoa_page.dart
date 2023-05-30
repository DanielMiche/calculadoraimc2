import 'package:calculadora_imc_dois/model/pessoa.dart';
import 'package:flutter/material.dart';

class PessoaPage extends StatefulWidget {
  final Pessoa pessoa;
  const PessoaPage({Key? key, required this.pessoa}) : super(key: key);

  @override
  State<PessoaPage> createState() => _PessoaPageState();
}

class _PessoaPageState extends State<PessoaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pessoa.nome),
      ),
      body: ListView.builder(
        itemCount: widget.pessoa.informacoes.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(widget.pessoa.informacoes[index].toString()),
            onDismissed: (direction) {
              widget.pessoa.removerInformacao(widget.pessoa.informacoes[index]);
            },
            child: ListTile(
              title: Text(widget.pessoa.informacoes[index].resultadoIMC()),
              subtitle: Text(
                  widget.pessoa.informacoes[index].calcularIMC().toString()),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_comment),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              TextEditingController alturaController = TextEditingController();
              TextEditingController pesoController = TextEditingController();
              return AlertDialog(
                title: const Text("Digite os dados"),
                content: SizedBox(
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Altura (em metros):"),
                      TextField(
                        controller: alturaController,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 15),
                      const Text("Peso (em kg):"),
                      TextField(
                        controller: pesoController,
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancelar")),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        widget.pessoa.adicionarInformacao(Informacao(
                            double.parse(alturaController.text
                                .replaceAll("-", "")
                                .replaceAll(",", ".".trim())),
                            double.parse(pesoController.text
                                .replaceAll("-", "")
                                .replaceAll(",", ".".trim()))));
                        setState(() {});
                      },
                      child: const Text("Salvar"))
                ],
              );
            },
          );
        },
      ),
    );
  }
}
