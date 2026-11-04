import 'package:flutter/material.dart';
import '../components/app_header.dart';
import '../components/dashboard_card.dart';

class DashboardSection extends StatelessWidget {
  final ValueChanged<int> onNavigate;
  const DashboardSection({super.key, required this.onNavigate});

  void _message(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppHeader(),
          _profileSummary(),
          const SizedBox(height: 14),
          _pointsCard(),
          const SizedBox(height: 15),
          _reportButton(context),
          const SizedBox(height: 19),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeading(title: 'Kendaraan Terdaftar', trailing: '⊕ Tambah Kendaraan',
                    onTrailingTap: () => _message(context, 'Form tambah kendaraan akan dibuat selanjutnya.')),
                const SizedBox(height: 10),
                _vehicleCard(context),
                const SizedBox(height: 18),
                Row(
                  children: const [
                    Expanded(child: SectionHeading(title: 'Riwayat Pelanggaran')),
                    SmallPill('1 Baru', background: Color(0xFFFFDAD7), foreground: Color(0xFFB7192B)),
                    SizedBox(width: 8),
                    Text('Bulan Ini', style: TextStyle(fontSize: 10, color: muted, fontWeight: FontWeight.w600)),
                  ],
                ),
                const SizedBox(height: 10),
                _violationCard(context),
                const SizedBox(height: 15),
                _leaderboardCard(context),
                const SizedBox(height: 15),
                _lostKeyCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileSummary() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFFF4F0EF), borderRadius: BorderRadius.circular(19)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SmallPill('●  Akun Mahasiswa Aktif', background: Color(0xFFECE6E4), foreground: Color(0xFF644F4C)),
              const Spacer(),
              Container(
                width: 44, height: 44,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
                child: const Icon(Icons.verified_user_outlined, color: appMaroon, size: 23),
              ),
            ],
          ),
          const SizedBox(height: 2),
          const Text('Halo, Alifa Rahma 👋', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800, color: ink)),
          const SizedBox(height: 4),
          const Text('1301213045 • S1 Teknik Informatika', style: TextStyle(fontSize: 11, color: muted)),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _pointsCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: WhiteCard(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Text('TOTAL AKUMULASI', style: TextStyle(fontSize: 10, letterSpacing: 1, color: muted, fontWeight: FontWeight.w700)),
                Spacer(),
                SmallPill('⚠ Hati-hati', background: Color(0xFFFFDAD7), foreground: Color(0xFFB7192B)),
              ],
            ),
            const SizedBox(height: 2),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('4', style: TextStyle(fontSize: 38, height: 1, color: appMaroon, fontWeight: FontWeight.w900)),
                SizedBox(width: 7),
                Padding(padding: EdgeInsets.only(bottom: 4), child: Text('Poin', style: TextStyle(fontSize: 19, color: ink, fontWeight: FontWeight.w600))),
              ],
            ),
            const SizedBox(height: 12),
            const Text('-24 Point To Top LeaderBoard', style: TextStyle(fontSize: 11, color: ink, fontWeight: FontWeight.w700)),
            const SizedBox(height: 7),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const LinearProgressIndicator(value: 0.08, minHeight: 6, backgroundColor: Color(0xFFE9E4E3), color: appMaroon),
            ),
            const SizedBox(height: 15),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: softBackground, borderRadius: BorderRadius.circular(13)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    children: [
                      Icon(Icons.history, color: Color(0xFF087A35), size: 16),
                      SizedBox(width: 5),
                      Text('Insentif Kedisiplinan', style: TextStyle(fontSize: 11, color: Color(0xFF087A35), fontWeight: FontWeight.w800)),
                      Spacer(),
                      SmallPill('18 Hari tersisa', background: Color(0xFFECE6E4), foreground: muted),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text('Tanpa pelanggaran hingga 15 April untuk pengurangan -10 poin otomatis.',
                      style: TextStyle(fontSize: 11, color: muted, height: 1.45)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _reportButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        color: appMaroon,
        borderRadius: BorderRadius.circular(17),
        elevation: 2,
        child: InkWell(
          borderRadius: BorderRadius.circular(17),
          onTap: () => onNavigate(2),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
            child: Row(
              children: [
                Container(
                  width: 43, height: 43,
                  decoration: BoxDecoration(color: Colors.white.withOpacity(.17), borderRadius: BorderRadius.circular(12)),
                  child: const Icon(Icons.camera_alt_outlined, color: Colors.white, size: 25),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Laporkan Parkir Liar', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800)),
                      SizedBox(height: 3),
                      Text('Bantu tertibkan area kampus & raih poin reputasi',
                          style: TextStyle(color: Color(0xFFFFE5E5), fontSize: 10, height: 1.35)),
                    ],
                  ),
                ),
                const CircleAvatar(radius: 16, backgroundColor: Color(0x55FFFFFF),
                    child: Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 20)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _vehicleCard(BuildContext context) {
    return WhiteCard(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
      child: Row(
        children: [
          _iconTile(Icons.two_wheeler_rounded),
          const SizedBox(width: 11),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Honda Vario 160', style: TextStyle(fontSize: 13, color: ink, fontWeight: FontWeight.w800)),
                SizedBox(height: 5),
                Row(
                  children: [
                    SmallPill('D 4521 TLU', background: Color(0xFFEAE7E6), foreground: ink),
                    SizedBox(width: 7),
                  ],
                ),
              ],
            ),
          ),
          const SmallPill('● Terverifikasi'),
          IconButton(
            onPressed: () => _message(context, 'Menu kendaraan dibuka.'),
            icon: const Icon(Icons.more_vert, color: muted),
            visualDensity: VisualDensity.compact,
          ),
        ],
      ),
    );
  }

  Widget _violationCard(BuildContext context) {
    return WhiteCard(
      padding: const EdgeInsets.all(13),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _photoPlaceholder(Icons.directions_car_filled_outlined),
              const SizedBox(width: 11),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Menghalangi Akses Kendaraan', style: TextStyle(fontSize: 12, color: ink, fontWeight: FontWeight.w800)),
                    SizedBox(height: 4),
                    Row(children: [
                      Icon(Icons.location_on_outlined, size: 13, color: muted),
                      SizedBox(width: 2),
                      Expanded(child: Text('Gedung Tokong Nanas (GKU)', style: TextStyle(fontSize: 10, color: muted))),
                    ]),
                    SizedBox(height: 6),
                    SmallPill('24 Mar 2025 • 09:42 WIB', background: softBackground, foreground: muted),
                  ],
                ),
              ),
              const Text('+4 Poin', style: TextStyle(fontSize: 10, color: appMaroon, fontWeight: FontWeight.w800)),
            ],
          ),
          const SizedBox(height: 9),
          Row(
            children: [
              const Expanded(child: Text('Batas sanggah: 1 hari lagi', style: TextStyle(fontSize: 10, color: muted))),
              const SmallPill('Terverifikasi Satpam', background: Color(0xFF70F28B), foreground: Color(0xFF075B2B), icon: Icons.verified_outlined),
            ],
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: OutlinedButton.icon(
              onPressed: () => _message(context, 'Form pengajuan keberatan akan dibuka.'),
              icon: const Icon(Icons.gavel_rounded, size: 15),
              label: const Text('Ajukan Keberatan', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700)),
              style: OutlinedButton.styleFrom(
                foregroundColor: ink,
                side: BorderSide.none,
                backgroundColor: softBackground,
                padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
                visualDensity: VisualDensity.compact,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _leaderboardCard(BuildContext context) {
    return Material(
      color: const Color(0xFFF4F0EF),
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => onNavigate(1),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                width: 42, height: 42,
                decoration: BoxDecoration(color: const Color(0xFF007B3C), borderRadius: BorderRadius.circular(12)),
                child: const Icon(Icons.workspace_premium_outlined, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Peringkat Ketidakpatuhan Parkir', style: TextStyle(fontSize: 10, color: muted, fontWeight: FontWeight.w700)),
                    SizedBox(height: 2),
                    Text('#14 dari 850 Mahasiswa', style: TextStyle(fontSize: 17, color: ink, fontWeight: FontWeight.w900)),
                  ],
                ),
              ),
              const CircleAvatar(radius: 17, backgroundColor: Colors.white,
                  child: Icon(Icons.arrow_forward_rounded, color: appMaroon)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _lostKeyCard() {
    return WhiteCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.key_rounded, color: appMaroon, size: 18),
              SizedBox(width: 7),
              Expanded(child: Text('Info Kunci Tertinggal', style: TextStyle(fontSize: 18, color: ink, fontWeight: FontWeight.w800))),
              Text('Terkini', style: TextStyle(fontSize: 10, color: appMaroon, fontWeight: FontWeight.w700)),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(color: softBackground, borderRadius: BorderRadius.circular(13)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _photoPlaceholder(Icons.key_outlined, width: 54, height: 54),
                const SizedBox(width: 10),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ditemukan Kunci Honda Vario dengan gantungan Telkom di Parkiran FEB',
                          style: TextStyle(fontSize: 11, color: ink, fontWeight: FontWeight.w700, height: 1.35)),
                      SizedBox(height: 6),
                      SmallPill('Diamankan di Pos Satpam Utama',
                          background: Color(0xFFFF7777), foreground: Colors.white, icon: Icons.shield_outlined),
                      SizedBox(height: 5),
                      Text('32 menit lalu', style: TextStyle(fontSize: 10, color: muted)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconTile(IconData icon) => Container(
    width: 43, height: 43,
    decoration: BoxDecoration(color: softBackground, borderRadius: BorderRadius.circular(12)),
    child: Icon(icon, color: muted, size: 24),
  );

  Widget _photoPlaceholder(IconData icon, {double width = 64, double height = 64}) => Container(
    width: width, height: height,
    decoration: BoxDecoration(
      color: const Color(0xFFE5DAD5),
      borderRadius: BorderRadius.circular(11),
    ),
    child: Icon(icon, color: const Color(0xFF8A716A), size: 27),
  );
}
