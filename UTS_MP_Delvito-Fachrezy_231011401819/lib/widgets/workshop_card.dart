import 'package:flutter/material.dart';
import '../models/workshop.dart';

class WorkshopCard extends StatefulWidget {
  final Workshop workshop;
  final int index;
  final VoidCallback onRegister;

  const WorkshopCard({
    super.key,
    required this.workshop,
    required this.index,
    required this.onRegister,
  });

  @override
  State<WorkshopCard> createState() => _WorkshopCardState();
}

class _WorkshopCardState extends State<WorkshopCard> {
  bool _isHovered = false;

  List<Color> get _gradientColors {
    final gradients = [
      [const Color(0xFF667EEA), const Color(0xFF764BA2)],
      [const Color(0xFFF093FB), const Color(0xFFF5576C)],
      [const Color(0xFF4FACFE), const Color(0xFF00F2FE)],
      [const Color(0xFFFA709A), const Color(0xFFFEED7D)],
    ];
    return gradients[widget.index % gradients.length].cast<Color>();
  }

  String _getCategoryTag() {
    if (widget.workshop.title.contains('Flutter') || widget.workshop.title.contains('Pemula')) return 'BEGINNER';
    if (widget.workshop.title.contains('Consultant')) return 'CONSULTANT';
    if (widget.workshop.title.contains('Seminar')) return 'SEMINAR';
    if (widget.workshop.title.contains('Advanced')) return 'ADVANCED';
    if (widget.workshop.title.contains('Cyber') || widget.workshop.title.contains('Security')) return 'SECURITY';
    if (widget.workshop.title.contains('Database')) return 'DATABASE';
    return 'WORKSHOP';
  }

  IconData _getIconForWorkshop() {
    if (widget.workshop.title.contains('Flutter')) return Icons.flutter_dash;
    if (widget.workshop.title.contains('Consultant')) return Icons.business_center;
    if (widget.workshop.title.contains('Seminar')) return Icons.groups;
    if (widget.workshop.title.contains('Backend')) return Icons.computer;
    if (widget.workshop.title.contains('Cyber') || widget.workshop.title.contains('Security')) return Icons.security;
    if (widget.workshop.title.contains('Database')) return Icons.storage;
    return Icons.school;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Card(
        margin: const EdgeInsets.only(bottom: 20),
        elevation: _isHovered ? 12 : 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header dengan Gradient Background
              Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: _gradientColors,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        _getIconForWorkshop(),
                        size: 80,
                        color: Colors.white.withOpacity(0.3),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.95),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _getCategoryTag(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6C5CE7),
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Content
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.workshop.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3436),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Tanggal & Waktu
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          size: 16,
                          color: Color(0xFF6C5CE7),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.workshop.date,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF2D3436),
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                widget.workshop.time,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF636E72),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Lokasi
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 16,
                          color: Color(0xFF6C5CE7),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            widget.workshop.location,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF636E72),
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        const Icon(
                          Icons.people,
                          size: 16,
                          color: Color(0xFF6C5CE7),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          widget.workshop.quotaText,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: widget.workshop.quotaLeft < 5
                                ? Colors.red
                                : const Color(0xFF27AE60),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: widget.workshop.quotaLeft /
                                  widget.workshop.quotaTotal,
                              minHeight: 6,
                              backgroundColor: Colors.grey[300],
                              valueColor: AlwaysStoppedAnimation<Color>(
                                widget.workshop.quotaLeft < 5
                                    ? Colors.red
                                    : const Color(0xFF27AE60),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: widget.workshop.quotaLeft > 0
                            ? widget.onRegister
                            : null,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: widget.workshop.quotaLeft > 0
                              ? const Color(0xFF6C5CE7)
                              : Colors.grey[400],
                          elevation: _isHovered ? 8 : 2,
                        ),
                        child: Text(
                          widget.workshop.quotaLeft > 0
                              ? 'Daftar Sekarang'
                              : 'Kuota Habis',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}