import 'package:flutter/material.dart';

/// Exercício 2 — Redimensionador de Logotipo (StatefulWidget)
///
/// Widget com estado interno [_tamanhoLogo] que é reconstruído
/// a cada chamada de [setState], aumentando ou diminuindo o logo.
class LogotipoInterativo extends StatefulWidget {
  const LogotipoInterativo({super.key});

  /// O framework chama [createState()] uma única vez para iniciar
  /// o ciclo de vida deste widget.
  @override
  State<LogotipoInterativo> createState() => _LogotipoInterativoState();
}

class _LogotipoInterativoState extends State<LogotipoInterativo> {
  // Variável mutável de estado — inicia em 50
  double _tamanhoLogo = 50.0;

  /// Aumenta o tamanho em 20 e chama [setState] para reconstruir o build().
  void _aumentar() {
    setState(() {
      _tamanhoLogo += 20;
    });
  }

  /// Diminui o tamanho em 20, com mínimo de 20, e chama [setState].
  void _diminuir() {
    setState(() {
      if (_tamanhoLogo > 20) {
        _tamanhoLogo -= 20;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // build() é chamado novamente a cada setState(), refletindo o novo _tamanhoLogo
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Redimensionar Logo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 32),

            // FlutterLogo com tamanho dinâmico controlado pelo estado
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              width: _tamanhoLogo,
              height: _tamanhoLogo,
              decoration: BoxDecoration(
                color: const Color(0xFF3B82F6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: FlutterLogo(size: _tamanhoLogo * 0.65),
              ),
            ),
            const SizedBox(height: 20),

            // Tamanho atual
            Text(
              'Tamanho: ${_tamanhoLogo.toInt()}px',
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF6B7280),
              ),
            ),
            const SizedBox(height: 24),

            // Botões Diminuir e Aumentar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _diminuir,
                  icon: const Icon(Icons.remove, size: 20),
                  label: const Text('Diminuir'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEF4444),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: _aumentar,
                  icon: const Icon(Icons.add, size: 20),
                  label: const Text('Aumentar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF22C55E),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
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
