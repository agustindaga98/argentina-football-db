# Argentina Football Database ⚽🇦🇷

Relational database design and implementation for an 
Argentine football league management system.

## Overview
Full MySQL database modelling a professional football league,
including teams, stadiums, players, referees, matches,
lineups and match events across 5 matchdays.

## Schema
- `teams` — 20 Argentine football clubs
- `stadiums` — home stadiums with capacity
- `players` — 300 registered players
- `referees` — match officials
- `competitions` — league and cup tournaments
- `matches` — 50 matches across 5 matchdays
- `lineups` — player participation per match
- `events` — goals and match events

## Features
- Views: goals per matchday, player minutes, goals by stadium
- Functions: average goals by position, goals for/against by team
- Stored procedures: standings table, fixture summary by matchday
- Triggers: negative goals validation, max 90 minutes per player

## Tools
- MySQL

## Files
- `futarg.sql` — full database script (schema + data + logic)

## Data
Fictional dataset created for academic purposes.


# Base de Datos de Fútbol Argentino ⚽🇦🇷

Diseño e implementación de una base de datos relacional 
para la gestión de una liga de fútbol argentino.

## Descripción
Base de datos MySQL completa que modela una liga de fútbol 
profesional, incluyendo equipos, estadios, jugadores, árbitros, 
partidos, alineaciones y eventos en 5 fechas.

## Esquema
- `equipos` — 20 clubes de fútbol argentino
- `estadios` — estadios con capacidad
- `jugadores` — 300 jugadores registrados
- `árbitros` — jueces de los partidos
- `competiciones` — liga y torneos
- `partidos` — 50 partidos en 5 fechas
- `alineaciones` — participación de jugadores por partido
- `eventos` — goles y eventos del partido

## Funcionalidades
- Vistas: goles por fecha, minutos por jugador, goles por estadio
- Funciones: promedio de goles por posición, goles a favor/en contra por equipo
- Procedimientos: tabla de posiciones, fixture por fecha
- Triggers: validación de goles negativos, máximo 90 minutos por jugador

## Herramientas
- MySQL

## Archivos
- `futarg.sql` — script completo (esquema + datos + lógica)

## Datos
Dataset ficticio creado con fines académicos.
