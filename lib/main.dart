import 'package:flutter/material.dart';
import 'widgets/cartao_perfil.dart';
import 'widgets/logotipo_interativo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercícios Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3B82F6)),
        useMaterial3: true,
      ),
      home: const TelaExercicios(),
    );
  }
}

class TelaExercicios extends StatelessWidget {
  const TelaExercicios({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF2FF), // azul-índigo suave
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              // Título principal
              const Text(
                'Exercícios Flutter\nProtótipos de Design',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 32),

              // ── Exercício 1: StatelessWidget ──
              _BadgeExercicio(label: 'Exercício 1: StatelessWidget'),
              const SizedBox(height: 12),
              const CartaoPerfil(
                nome: 'Maria Silva',
                descricao:
                    'Desenvolvedora Flutter apaixonada por criar aplicativos '
                    'mobile incríveis. Especialista em UI/UX e arquitetura de software.',
              ),
              const SizedBox(height: 32),

              // ── Exercício 2: StatefulWidget ──
              _BadgeExercicio(label: 'Exercício 2: StatefulWidget'),
              const SizedBox(height: 12),
              const LogotipoInterativo(),
              const SizedBox(height: 32),

              // ── Notas de Implementação ──
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '📝 Notas de Implementação',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      const SizedBox(height: 12),
                      _Nota(
                        'Exercício 1',
                        'Widget estático com campos final, recebe nome e '
                            'descrição no construtor — nunca reconstrói.',
                      ),
                      const SizedBox(height: 8),
                      _Nota(
                        'Exercício 2',
                        'Estado interno _tamanhoLogo atualizado via setState(), '
                            'que aciona um novo build() a cada toque.',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Badge colorido de cabeçalho dos exercícios
class _BadgeExercicio extends StatelessWidget {
  final String label;
  const _BadgeExercicio({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF4F46E5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

/// Item de nota com label em negrito
class _Nota extends StatelessWidget {
  final String titulo;
  final String texto;
  const _Nota(this.titulo, this.texto);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 14, color: Color(0xFF4B5563)),
        children: [
          TextSpan(
            text: '$titulo: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: texto),
        ],
      ),
    );
  }
}
