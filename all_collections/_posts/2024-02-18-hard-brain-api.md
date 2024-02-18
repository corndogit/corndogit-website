---
layout: post
title: 'Using FastAPI and Disnake to make a Discord music quiz bot'
date: 2023-04-21
categories: ["projects", "python"]
---
![fast api and disnake logos](/assets/img/2024-02-18-hard-brain-api/logos.png)

Well, it's been a while since I've written any posts for this website, which has entirely passed my mind given how busy I've been in the past year. So what's happened since my last post almost a year ago?

I have:

- Finished my MSc CompSci including a final project where I made a game in Godot (I was meant to write a post about that...)
- Started my first job in the tech industry as a junior software engineer where I've learned a ton of new developer skills on the full-stack such as React, Jest + Cypress, Spring Boot, and also picked up some skills in the field of AI/ML
- Gotten back into my favourite game of all time, [Beatmania IIDX](https://en.wikipedia.org/wiki/Beatmania_IIDX), and achieved the 10th Dan rank in single player

It's been a busy couple of months, but my passion for development is still going strong ever since changing career paths back in 2022; in fact, this month actually marks my 2 year anniversary of having a proper go at learning to code! I haven't prepared any celebration, other than that I happen to be going to Japan next week, a trip that I've had dreamed of doing for probably a decade.

With catch-up out of the way, I'd like to talk about a new project I'm working on, including some of the challenges I've encountered on it so far. Inspired by getting back into IIDX, a conversation with friends as well as the group of us spending hours using [RinBot](https://rinbot.moe/) on our Discord server, I have set out to make **"Hard Brain"**, a music quiz bot entirely based on music from IIDX. To accomplish this, I am using FastAPI to create a backend that can fetch song data and audio, and Disnake to create the Discord bot.

FastAPI is an asynchronous, scalable web framework for Python that heavily employs type hinting. It has a simple and intuitive syntax for defining routes and runs very quickly compared to other Python web frameworks. The great thing about FastAPI is that responses are returned as JSON by default, and are automatically inferred with the help of Pydantic and Swagger, making it even easier to develop with. Since it is OpenAPI-compliant, it also automatically generates interactive documentation via Swagger UI, where you can manually test and explore your routes. Tip: if you run your own FastAPI server, try visiting "/docs"!

Routes in FastAPI are defined in a similar manner to other web frameworks such as Spring or Flask. An example route from the backend for Hard Brain looks something like this:

```python
@app.get("/question")
def get_random_question(number_of_songs: PositiveInt = 1):
    return get_random_song(number_of_songs)
```

In just 3 lines of code, this function defines a route `/question` that accepts a HTTP GET request, with an optional query parameter to select the number of songs to return. The call to `get_random_song` returns a list of random song data objects from a JSON file containing IIDX song data. Due to FastAPI's clever typing, the response is returned as a JSON to API consumers. The pydantic type PositiveInt also ensures that any value passed as a number of songs must be an integer greater than 0.

A more advanced route, the one used for returning the audio file corresponding to a song looks like this:

```python
@app.get("/audio/{song_id}")
def get_song_audio_by_id(song_id: int):
    song_data = get_song_by_id(song_id)
    if len(song_data) == 0:
        raise HTTPException(status_code=404, detail="No song found with this ID")
    fp = Path(f"{__file__}/..") / f"resources/songs/{song_data['filename']}"
    if not fp.resolve().exists():
        raise HTTPException(
            status_code=404, detail="No song file found for this song ID"
        )
    return FileResponse(fp.resolve(), media_type="audio/mp3")
```

Like before, we define our GET route `/audio/{song_id}` which accepts a song ID as an integer. `get_song_by_id` returns the object (a dict) from the song data JSON corresponding to the ID provided. If an object is not found, `song_data` will be an empty dict, so we raise a 404 error code. The filename of the song is stored in the JSON, and so we use Pathlib to navigate to the folder where audio files are stored and see if there is a match. We do another check just in case the path points to a file that doesn't exist (which happens more often than I'd like to admit while developing as I forget to add the audio files I need to the project...). Unlike before, this time we do not want our response to be a JSON; instead it should be a file response. FastAPI has a convenient collection of Response objects that can handle other types of responses, for example, plain HTML to serve a web page or a stream to return a particularly large or slow response. We use `FileResponse` which returns an MP3 file and automatically handles file streaming.

This project is still very much in its infancy, and I don't even have a MVP for it yet. I'm currently working on squashing a ton of asynchronous bugs in the Disnake layer, but I feel like it's almost there. When it's in a more functional state, I think I'll write another blog post all about dealing with the nightmares encountered as a noob to concurrency and asynchronous programming.

![Hard Brain bot preview](/assets/img/2024-02-18-hard-brain-api/bot.png)
Here's a screenshot to prove I'm not lying.
{:.caption}

That's all, thank you for reading :relaxed: hopefully I will make another post within a year... not making any promises though.
