# Parachute-Freefall-Physics-Simulation

Simulates a skydiver's descent from 4,000 meters, modeling two stages of motion: free fall and parachute deployment. It uses realistic air resistance, variable air density by altitude, and physics-based drag calculations to chart velocity, altitude, and acceleration over time.

---

## How It Works

1. **Stage 1 (Free Fall)**: 
   - Uses a smaller drag area and lower air resistance
   - Applies gravity and air resistance based on altitude
2. **Stage 2 (Parachute Deployment)**:
   - Occurs at t = 60 seconds
   - Drag area increases gradually, affecting acceleration and velocity
   - Terminal velocity is reduced significantly

---

## Description and Tracked Data

- Simulates fall under gravity with drag from the body
- Deploy a parachute at 60 seconds
- Experience a dynamic increase in drag due to the expanding parachute
- Reach terminal velocity in each phase

It uses time-stepping and models gravity, drag, and changing air density to accurately reflect skydiving motion.

---

## Features

- Variable air density by altitude
- Two-stage drag modeling: free fall and parachute deployment
- Dynamic area increase of parachute over time
- Time-stepped simulation using physics formulas
- Calculates maximum g-force experienced
- Multiple plots for visualization

---

## Concepts Demonstrated

- Newton's Second Law and net acceleration
- Air resistance (drag force)
- Time-stepped kinematic motion
- Piecewise functions based on simulation stage
- Data visualization in MATLAB




