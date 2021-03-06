import 'package:flutter/material.dart';
import 'package:colaborae/app/shared/utils/constants.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: fundo,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Image.asset('images/imagens/$imagem.png'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
          ],
        ),
      ),
    );
  }
}
