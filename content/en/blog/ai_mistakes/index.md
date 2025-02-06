---
title: "Analysing LLM Mistakes"
date: 2024-02-11T12:04:06-05:00
tags: ["Opinion", "AI"]
author: ["Jan Wendel"]
---


One of my main frustrations with LLMs is the way they make mistakes. To me, the seemingly random insertion of incorrect or hallucinated code fundamentally contradict how I usally read and think about code. For example, reacently I tried to find all the red sections in an image with some Python code, and I had a rough idea of how it should work. An image is essentially and array of pixels and each pixel is a set of numbers representing it’s color. A format called RGB is commonly used for this, where each pixel consist of three number in the range of 0-255, representing how much red, green and blue light make up the pixel. You loop over the array and check whether the color values of a pixel fall with a range that would be red, meaning it should have high values for red, and lower values for green and blue.  

<!--more-->
<img src="/blog/ai_mistakes/ai_oops.webp" width="500x" align="right" style="padding:10px;border:0px;">
Unfortunately I couldn’t really remember what library and functions to use for this, and just asked ChatGPT to write the code for me instead. Upon first inspection everything looked good, but running the code produced weird result. The wrong parts of the image were getting detected and the colors in the output image were different from the original. After debugging for a bit I realized there was and issue with the way the number range representing the color “red”. The code was written for images in the RGB color format, which has three numeric values per pixel, representing how much red, green and blue it contains. the numeric values used to define the “red” color range were for the CMYK format, which stands for Cyan, Magenta, Yellow, and Key (Black). I don't really understand the nuanced differences between the two color formats (and will hopefully never have to), but using the correct RGB values to define the color range my code worked properly.  

Finding the error took me longer then I liked, I was a bit annoyed at myself for not checking the base assumptions of the program earlier. But the bug also felt odd to me and I kept thinking that a human programmer would never make a mistake like. OK, maybe not “never”, but it seem very unlikely that a someone would pick out the values for the wrong color format and then somehow bang out an other wise perfect program based on those incorrect values. It just doesn't match the iterative approach most people have to writing software. Where running your program early and often will cause such mistakes to be noticed before you finish writing the whole thing. Since then I have often found that bugs in LLM generated code seem harder to find then usual - they seem placed in more unexpected, seemingly random places.  

## II

This reminded me of an effect I’ve seen people talk about in competitive games, where low difficulty bots often feel more difficult to predict, especially when you are used to playing against people. For example, chess beginners are known to play very reactively - they tend to always respond to the last move by their opponent, forgetting the bigger picture. This allows a higher rated player to set up distraction and traps, which the lower rated player will predictably walk into.  

An AI will it doesn’t feel like it makes mistakes in a same way. An AI that’s rated 1000 elo will on average make the same amount of mistakes as a 1000 elo player, but the mistakes will be less predictable. A chess AI won’t get obviously distracted like a player would, the reasons for the bad moves it makes wont be comprehensible.  

I think the fundamental problem here is that this “prediction” work on empathy. On trying to image yourself in the other’s position. It’s thinking “if I was a lower rated chess player, what would I do?”. It make no sense say “if I was an easy difficulty chess AI”, a chess engines algorithms are not compatible with human, on the fly decision making.  

This lack of empathic connection to the AI is also what makes debugging LLM generated code more difficult. Debugging code is also at least partially an empathic process. You are putting yourself in the shoes of the codes original author, trying to rebuild their mental models from his code and to figure out where the mistake happened.  

If I imagine myself as a person who wrote the color detection code above, and tried to think where the error likely happened -  I would not expect the initial values to just be completely wrong. Of course, the code was written by an LLM instead of a person, but I can’t imagine that.  
