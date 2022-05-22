
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import 'bloc/bloc.dart';
import 'bloc/event.dart';
import 'model/user_model.dart';

Future<dynamic> showUserAddDialog(
  BuildContext context,
) {
  final con1 = TextEditingController();
  final con2 = TextEditingController();

  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      content: SizedBox(
        height: 250,
        child: Column(
          children: [
            TextField(
              controller: con1,
              decoration: const InputDecoration(
                labelText: "Name",
              ),
            ),
            TextField(
              controller: con2,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),
            
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                //final user = User(
                  //url1: url1.text,            
                  //id: const Uuid().v4(),
                //);
                String url1 = con1.text;
                String url2 = con2.text;
                BlocProvider.of<DashboardBloc>(context).add(
                  LoadDataEvent(url1: url1, url2: url2),
                );
                
                final user =User(city_name: c)
             
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    ),
  );
}

