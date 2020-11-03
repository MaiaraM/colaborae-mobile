import 'package:flutter/material.dart';
import 'package:colaborae/constants.dart';

class Categoria extends StatelessWidget {
  Categoria(
      {@required this.fundo,
      @required this.imagem,
      @required this.titulo,
      this.descricao,
      this.onPress});

  final Color fundo;
  final String imagem;
  final String titulo;
  final String descricao;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        // Envelope
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                  color: fundo, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Image.asset('images/imagens/$imagem.png'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '$titulo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$descricao',
              style: TextStyle(
                fontSize: 18,
                color: lightGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
