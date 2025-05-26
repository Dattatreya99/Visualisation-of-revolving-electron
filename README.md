# Visualisation-of-revolving-electron

## Overview

This repository contains three MATLAB simulations visualizing different aspects of electromagnetic radiation emitted by a revolving electron:

1. **Radiation Field Vectors**  
2. **Radiation Wavefronts**  
3. **Interfering Spherical Wavefronts**

The goal of these simulations is to provide an intuitive and quantitative understanding of classical dipole radiation patterns from an accelerating charge in circular motion, based on the Liénard-Wiechert potentials and classical electrodynamics.

---

## Motivation and Purpose

Electromagnetic radiation from accelerated charges is a foundational concept in physics, crucial in fields ranging from antenna theory to astrophysics. The complexity of the exact analytic solutions, particularly for time-dependent accelerated motion, often hinders intuition. These simulations allow visualization of radiation fields, wavefront propagation, and wave interference — providing a dynamic and direct physical insight beyond static equations.

By running these codes, students and researchers can better appreciate:

- How the instantaneous acceleration of the electron translates into radiated fields.
- The spherical nature and expansion speed of electromagnetic wavefronts.
- The interference pattern formed by superposition of successive spherical wavefronts emitted periodically.

---

## Code Details and Physical Assumptions

### 1. Radiation Field Vectors

- Calculates the instantaneous electric field vector at discrete points in 3D space due to an electron revolving in a circle of radius `R0`.
- Uses the simplified far-field approximation from classical electrodynamics.
- Assumes non-relativistic speeds (electron speed ≪ speed of light) so retardation effects are approximated by current time acceleration.
- Uses a coarse grid to ensure computational feasibility.

### 2. Radiation Wavefronts

- Visualizes expanding spherical wavefronts emitted continuously by the revolving electron.
- Each wavefront is approximated as a spherical shell expanding at the speed of light from the electron’s position at emission time.
- Assumes isotropic spherical wavefronts which is an approximation since actual radiation pattern is directional.
- Limited to a few wavelengths range to visualize wave propagation clearly.

### 3. Interfering Spherical Wavefronts

- Computes scalar interference patterns in a 2D plane slice caused by superposition of multiple spherical wavefronts emitted periodically.
- Uses a simple harmonic oscillation model with phase delays corresponding to wave travel time.
- Neglects polarization and vector nature of fields; focuses on scalar wave amplitude interference.
- Demonstrates how coherent wave emission leads to complex interference patterns.

---

## How Accurate Are These Simulations?

- The simulations are based on classical electrodynamics and the dipole approximation.
- Retardation is simplified; full Liénard-Wiechert potentials with exact retarded time calculation are not implemented due to computational complexity.
- Radiation reaction and quantum effects are ignored.
- Electron motion is idealized as uniform circular motion with constant frequency.
- Grid resolutions and time steps are chosen for visual clarity and computational speed rather than ultra-high precision.
- Despite simplifications, the qualitative behavior of radiation and wave interference is accurately captured, providing valuable physical insight.

---

## Usage Instructions

1. Clone or download this repository.
2. Run any of the `.m` files in MATLAB.
3. Ensure the MATLAB figure window remains open to continue animations.
---

## Potential Future Work

- Implement full Liénard-Wiechert potentials with retarded time calculations.
- Include magnetic field vector visualization.
- Extend to relativistic electron speeds and Doppler effects.
- Add user interface for changing electron parameters dynamically.

---

## References

- J.D. Jackson, *Classical Electrodynamics*, 3rd Ed., Wiley (1998).
- D.J. Griffiths, *Introduction to Electrodynamics*, 4th Ed., Pearson (2013).
- Feynman Lectures on Physics, Vol. II, Chapter on Radiation.

---

## Contact

For questions, suggestions or collaboration, please contact:  
**Dattatreya** – Physics Student at SVNIT  
Email: mssdatta2@gmail.com  
GitHub: https://github.com/Dattatreya99
---

*Thank you for exploring these simulations!*

