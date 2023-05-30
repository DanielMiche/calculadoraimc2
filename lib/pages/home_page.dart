import 'package:calculadora_imc_dois/fake_db.dart';
import 'package:calculadora_imc_dois/model/pessoa.dart';
import 'package:calculadora_imc_dois/pages/pessoa_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pessoas'),
      ),
      body: ListView.builder(
        itemCount: FakeDb.pessoas.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PessoaPage(pessoa: FakeDb.pessoas[index])));
            },
            leading: const Icon(Icons.person_rounded),
            title: Text(FakeDb.pessoas[index].nome),
            trailing: const Icon(Icons.list),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.person_add_alt_rounded),
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) {
              TextEditingController nomeController =
                  TextEditingController(text: "");
              return AlertDialog(
                title: const Text("Nome"),
                content: TextField(
                  controller: nomeController,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancelar"),
                  ),
                  TextButton(
                    onPressed: () {
                      FakeDb.pessoas.add(Pessoa(nomeController.text));
                      Navigator.pop(context);
                    },
                    child: const Text("Salvar"),
                  ),
                ],
              );
            },
          );
          setState(() {});
        },
      ),
    );
  }
}
