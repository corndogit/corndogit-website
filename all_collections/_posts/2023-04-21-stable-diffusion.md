---
layout: post
title: 'My experiments with Stable Diffusion'
date: 2023-04-21
categories: ["AI", "Stable Diffusion"]
---
AI-generated imagery is an ever expanding field, and its accessibility has increased in recent months. With tools like Stable Diffusion, anyone with a computer that has a recent consumer-level GPU can run models on their own hardware and unlock the potential of this technology. In this post, I will cover a brief introduction to Stable Diffusion and go over some of my personal experiments with it.

Stable Diffusion is a cutting-edge technique in the field of artificial intelligence that allows users to generate high-quality images with realistic details and textures. It is a type of diffusion-based generative model that uses a diffusion process to transform a random noise input into a visually coherent image. This technique has gained popularity in recent months due to its accessibility, as it can be run on standard consumer-grade hardware with a modern GPU.

![stable diffusion webui](/assets/img/2023-04-21-stable-diffusion/stable-diffusion-webui.png)
A screenshot of the Stable Diffusion webui developed by [AUTOMATIC1111](https://github.com/AUTOMATIC1111/stable-diffusion-webui)
{:.caption}

One of the main advantages of Stable Diffusion is its ability to generate diverse and creative images by controlling the diffusion process with different parameters. This allows users to create a wide range of images, from photorealistic landscapes to abstract art, and everything in between. Many Stable Diffusion models are available at sites such as [Hugging Face](https://huggingface.co) and [Civitai](https://civitai.com), many of which are specifically trained for specific illustration styles, generating realistic people or landscapes, etc. The process of running a Stable Diffusion model involves iteratively updating the input noise to gradually transform it into an image. This iterative process allows for fine-grained control over the generated images, enabling users to achieve their desired artistic outcomes.

I have been experimenting with Stable Diffusion to create unique and visually striking images. One of my favorite experiments involved using Stable Diffusion combined with ControlNet to generate futuristic or post-apocalyptic depictions of my home city, Swansea. I started with a pictures of Wind Street and High Street, which are popular and recognisable streets in the city centre. Using the Canny preprocessor and model, ControlNet creates a map of the image which is then used to control the diffusion process.

![Swansea Wind Street in AI](/assets/img/2023-04-21-stable-diffusion/swansea_wind_street.png)
![Swansea High Street in AI](/assets/img/2023-04-21-stable-diffusion/swansea_high_street.png)
The streets of Swansea in a futuristic and post-apocalyptic setting. The input images are included in the top-left.
{:.caption}

Another experiment I conducted with Stable Diffusion was generating anime characters using the Anything model. By using the Anything model in conjunction with Stable Diffusion, I created unique and personalized anime characters with realistic details and textures. The diffusion process allows for fine-grained control over the generated characters, allowing artists and anime enthusiasts to explore different styles, poses, and expressions. The combination of the Anything model and Stable Diffusion opens up exciting possibilities for creating custom anime characters that can be used in various applications, such as digital art, animation, and gaming. The versatility and creative potential of using the Anything model in Stable Diffusion make it an exciting frontier in the field of AI-generated anime imagery.

![Anything](/assets/img/2023-04-21-stable-diffusion/anything.png)
An assortment of characters produced in an anime style using Anything v4.5
{:.caption}

One of the aspects that I found particularly appealing about Stable Diffusion is its accessibility. Unlike some other AI-generated imagery techniques that require specialized hardware or extensive technical expertise, Stable Diffusion can be run on a regular computer with a modern GPU. This makes it accessible to a wide range of users, including artists, designers, and hobbyists, who can now harness the power of AI to create visually stunning imagery without the need for expensive equipment or advanced programming skills.

In conclusion, Stable Diffusion is a powerful and accessible tool for generating high-quality imagery using artificial intelligence. Its ability to generate diverse and visually striking images through a diffusion process controlled by parameters makes it a versatile tool for artists, designers, and creative enthusiasts. With its accessibility and potential for creative experimentation, Stable Diffusion is poised to become a significant driving force in the field of AI-generated imagery, unlocking new possibilities for artistic expression and visual storytelling. I am excited to continue my experiments with Stable Diffusion and explore the endless creative opportunities it offers.
