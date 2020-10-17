# Developers Guide

This is for new developers describing what we have done.

## FPS

First Person Shooter

## Scenes

### Arena

### World

## Audio

Playing audio is managed in `Globals.gd`
Listening to each audio file is done by `Audio.tscn`

## SpawnPoints

Each `SpawnPoint.tscn` has a list of scenes to instantiate in groups and has a maximum capacity.

These are managed by `SpawnPointManager.tscn`. It gets a list of children, which must be `SpawnPoint.tscn`.

The manager triggers every configured seconds one of its `SpawnPoint.tscn` to produce its configuration depending on the `percentage`.

## HUD

## Pause dialog

Overlay

## Settings

The `UI/Settings.tscn` manages the settings using the defined structure in `Globals.gd`.

# References

## FPS

- https://docs.godotengine.org/en/stable/tutorials/3d/fps_tutorial/index.html
  - which is a way https://github.com/TwistedTwigleg/Godot_FPS_Tutorial
