import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameCubit extends Cubit<String> {
  NameCubit(String name) : super('');

  void change(String name) => emit(name);
}

class NameContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NameCubit('Josué'),
      child: NameView(),
    );
  }
}

class NameView extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = context.read<NameCubit>().state;
    BlocBuilder<NameCubit, String>(){

    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Mudar Nome'),
        ),
        body: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome Desejado',
              ),
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  child: Text("Alterar"),
                  onPressed: () {
                    final name = _nameController.text;
                    context.read<NameCubit>().change(name);
                    Navigator.pop(context);
                  },
                ),
              ),
            )
          ],
        ));
  }
}
