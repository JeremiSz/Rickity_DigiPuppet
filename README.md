# Rickity DigiPuppet

![Sample image of DigiPuppet](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiaSM8LS2N1yxhh4VQjL6ZtnEaGHU3xtYHVToKX4vblKoa2m3Pv_UCeKQ-z8N0W8GhpAJJkDsjOX3-hzBP_0J5ObLoTr7yVGRLqPAkeQFGY90kqSp6_tjUp3r0tMHDVcHVCkxhU8pa6CGcqDaGgJeej_oPgPIpFHcvQ47m5K2NNNoikvdrQJmDm3T-1gA/w515-h525/Screenshot%20from%202023-06-25%2022-47-24.png)

## Requirements
* Node
* Godot 4.0+
* Http-server (npm package)
* A webcam

## Usage
1. Clone this repo
2. In detection server, run 'npm install' 
3. Staying in that directory, run npx http-server
4. In avatar, run godot avatar.tscn

To allow for more control over the puppet or to change to the mesh display, use this method:

4. In avatar, run godot -e to open the editor. 

If the editor was ran, the project will have to be started via the play button in the editor.

5. Open any web browser and go to localhost:8080.
6. Allow the requested premissions.
7. Facial tracking should now be working and the character should be mirroring your facial movements.

## Edior usage
In the editor, most settings can be changed by editing fields on the eye_mat and mouth_mat materials.

To change between sprite and mesh displays, code must be uncommented in the root script. This code can be found in the handle_points function. If no functions were added, it can be found near the bottom of the script.