import 'package:flutter/material.dart';

/// Exercício 1 — Componente de Perfil Estático (StatelessWidget)
///
/// Widget imutável que exibe nome, bio e logo de perfil.
/// Todos os campos são [final] pois o estado nunca muda após a construção.
class CartaoPerfil extends StatelessWidget {
  final String nome;
  final String descricao;

  const CartaoPerfil({
    super.key,
    required this.nome,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Imagem de perfil representada pelo FlutterLogo
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: const Color(0xFF3B82F6),
                borderRadius: BorderRadius.circular(48),
              ),
              child: const Center(
                child: FlutterLogo(size: 56),
              ),
            ),
            const SizedBox(height: 20),

            // Nome
            Text(
              nome,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F2937),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),

            // Descrição / Bio
            Text(
              descricao,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF6B7280),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
