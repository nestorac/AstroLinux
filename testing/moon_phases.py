#!/usr/bin/env python3
"""
Calculador de Fases Lunares - Basado en algoritmos de Jean Meeus
"""

import sys
import math
from datetime import datetime, date

def julian_date(y, m, d):
    """Calcula el Día Juliano"""
    if m <= 2:
        y -= 1
        m += 12
    a = y // 100
    b = a // 4
    return math.floor(365.25 * (y + 4716)) + math.floor(30.6001 * (m + 1)) + d + b - 1524.5

def moon_phase(year=None, month=None, day=None):
    if year is None:
        dt = datetime.now()
        year, month, day = dt.year, dt.month, dt.day
    else:
        dt = date(year, month, day)

    jd = julian_date(year, month, day)
    days_since_2000 = jd - 2451545.0

    # Ciclo sinódico
    synodic_month = 29.530588853
    moon_age = (days_since_2000 + 0.25) % synodic_month   # offset ajustado

    # Iluminación (fórmula más precisa)
    phase_angle = 2 * math.pi * moon_age / synodic_month
    illumination = (1 - math.cos(phase_angle)) * 50

    # Nombre de la fase
    if moon_age < 1.85:
        phase_name = "🌑 Luna Nueva"
    elif moon_age < 5.55:
        phase_name = "🌒 Luna Creciente"
    elif moon_age < 9.25:
        phase_name = "🌓 Cuarto Creciente"
    elif moon_age < 13.85:
        phase_name = "🌔 Gibosa Creciente"
    elif moon_age < 16.55:
        phase_name = "🌕 Luna Llena"
    elif moon_age < 20.25:
        phase_name = "🌖 Gibosa Menguante"
    elif moon_age < 23.95:
        phase_name = "🌗 Cuarto Menguante"
    else:
        phase_name = "🌘 Menguante"

    return {
        "date": dt,
        "moon_age": round(moon_age, 2),
        "illumination": round(illumination, 1),
        "phase_name": phase_name
    }


# ====================== USO ======================
if __name__ == "__main__":
    if len(sys.argv) > 1 and sys.argv[1] in ["-h", "--help"]:
        print("Uso:")
        print("  python3 moon_phase.py                    → Hoy")
        print("  python3 moon_phase.py 2026 4 26         → Fecha específica")
        print("  python3 moon_phase.py 2025 12 25        → Navidad 2025")
        sys.exit(0)

    if len(sys.argv) == 4:
        y = int(sys.argv[1])
        m = int(sys.argv[2])
        d = int(sys.argv[3])
        result = moon_phase(y, m, d)
    else:
        result = moon_phase()

    print("="*50)
    print(f"📅 Fecha: {result['date']}")
    print(f"🌕 Fase: {result['phase_name']}")
    print(f"🕒 Edad lunar: {result['moon_age']} días")
    print(f"☀️  Iluminación: {result['illumination']}%")
    print("="*50)
