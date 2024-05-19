---
layout: post
title: 'Hard Brain Pt. 2: Dockerizing a Discord bot'
date: 2024-05-19
categories: ["Projects", "Python", "Docker"]
---
It's been just over 3 months since my last post about **"Hard Brain"**, a music quiz bot entirely based on music from the rhythm game Beatmania IIDX. I'm happy to announce that the project has been shipped and is now in use in 4 Discord servers, and has received some good feedback from users! :tada:

This has been a very interesting project, wrought with new technical challenges and some non-technical ones. As a reminder, Hard Brain consists of three services:  

- A Discord bot written in Python using [Disnake](https://docs.disnake.dev/en/stable/index.html), a fork of the popular discord.py library with additional features such as Flask-like function decorators for defining slash commands.
- A FastAPI server for handling information about songs as well as streaming audio files to the bot
- A PostgreSQL database for storing song information.

Each of these services is deployed via a Docker Compose file
