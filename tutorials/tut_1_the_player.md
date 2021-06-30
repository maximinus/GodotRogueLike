Part 1: Drawing a character and moving
======================================

Open up Godot again, and this time just choose your project and select "Edit"

So let's think about how Godot works. When Godot is running, it displays a scene. A scene is a simple tree of nodes - those nodes can be all sorts of things, like sprites, lights, sounds, tilemaps and so on.

A scene can also contain other scenes, and this is a way of making editing a lot simpler. Instead of having to edit a complicated scene with every gameplay element on it, we can make every object a seperate, self contained scene that we can then work on.

To start with, we are going to create an object that can be displayed on the screen - the player.

Let's create a scene. We'll do that just by editing the current [empty] one.

For the root scene, select "2D Scene". Now the editor should change to be looking at a 2D scene. Double-click this Node2D and change the name to "Player". This root node does very little, so we need to add a child. Click on the + sign above the Player node, type in "Sprite" to choose a sprite, and then click "Create".

The properties of a node are displayed on the right hand side of the screen. If the sprite node is highlighted, you'll see there's a texture setting that is currently set to empty. Drag and drop the human image we got earlier.

Your 2D screen should contain a box, this is the screen area that will be displayed. Drag the sprite into the middle of the screen somewhere. It's almost time to run our game! To do this, we first need to save the scene. Go Scene -> Save As, create a new folder called "scenes", inside that create a folder "player" and then finally save the scene as "Player". Lastly, press F6 to run this scene. You should see our little sprite on a grey background.

One last small thing. The position of a node is equal to it's positiom _plus_ it's offset _plus_ it's parent's position. Let's keep things simple by making sure that the offset and position of the sprite are set to zero. Then click on the root node and click the "make sure the object's children are not selectable", which will make sure you can't accidentally select the sprite only when moving (the icon is next to the lock in the upper middle of the screen).


Adding Controls
---------------

So we need to add some movement. For now we will do the simplest thing possible, but with a thought about the future.

So the actual code will be fairly simple: every frame we will check the keys being pressed, and then update the position of the sprite. Later on though, this will get slightly more complex, as we will need to check if a wall is in the way. Now our single sprite doesn't know anything about maps, and nor should it really. We will have a seperate "map" scene later to hold that information. But in the same manner our map won't know anything about the player sprite. However, if the player and map are in the same scene, then we can put code in that scene which has a reference to both the player and the sprite.

So let's make that scene. Go ahead and click the little + sign next to the Player scene tab to make a new scene.

Now we have a little book-keeping to get everything setup. Choose 2D scene on the left. Rename the new node "World" and press CTRL+S to save the scene. In the popup save window, go into the scenes folder and create a new folder called world. Finally, click save to save the scene in the folder.

Now we need put the player into the scene. Instead of adding a node to the root node, we need to add our player scene. Click on the chain next to the + above the scene tree - it should say "Instance Scene Node". Of the options given, choose "Player".

You should now see the player scene as a child of "World". Great, we're getting somewhere. Add a script node to the "World" node (click on the icon to the right of the "filter nodes" box). If you've saved the scene in it's own folder, then the script will be saved in the same folder.

Change the script to this:

```gdscript
extends Node2D

const SQUARE_SIZE = 32

func _ready():
	pass

func _process(delta):
	var move_delta = Vector2(0, 0)
	if Input.is_action_just_pressed('ui_up'):
		move_delta.y -= SQUARE_SIZE
	if Input.is_action_just_pressed('ui_down'):
		move_delta.y += SQUARE_SIZE
	if Input.is_action_just_pressed('ui_left'):
		move_delta.x -= SQUARE_SIZE
	if Input.is_action_just_pressed('ui_right'):
		move_delta.x += SQUARE_SIZE
	$Player.position += move_delta
```

Now you _can_ run this scene with F6, but you can also define a "master" scene that is the game. Press F5 and you'll be asked to select this master scene. Choose "world" and from now on F5 will run this scene, whilst F6 will run the scene selected in the editor.


Screen Resolution
-----------------

One more thing we should do is think about resolution. Now you may know that this can be tricky in many game engines, but luckily Godot makes it easy.
Let's start by defining the screen _ratio_: for most gamers today it's 16:9. So if I went with a horizontal resolution of 800 (800 / 32 = 25 tiles), we need (800/16)\*9 = 450 pixels for the vertical resolution (You are quite welcome to change these settings as most of these tutorials will be resolution independant).
But we'll also want the player to able to maximize the screen, change window size and so on (by doing this, we will automatically handle other resolutions with no extra work).

In Godot, go **Project -> Project Settings** and scroll down the left hand side until you get to **Display:Window**. Set the width to 800 and the height to 450. Make sure **Resizeable** is selected but leave the other size flags unchecked for now. Finally, scroll down the right hand size to get to **Stretch**, then choose **Mode: Viewport** and **Aspect: Keep**. We are done here!

Run the game (F5 again) and when the window is open, maximise it. You should see that Godot handles things just fine.
